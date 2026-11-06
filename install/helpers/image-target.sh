# Image builds and the hardware setup they defer to the machine's first boot.
# Sourced by collie-apply-hardware and collie-provision-hardware; no shebang.
#
# An image is built away from the machine it will run on, so hardware setup
# during the build would describe the builder, not the target. The builder
# declares the build in a root-owned manifest before it runs
# collie-apply-system in the image root:
#
#   /var/lib/collie/image/target
#     format=1
#     platform=x86|aarch64|aarch64-apple|aarch64-qualcomm|aarch64-n1x|aarch64-gb10
#
# While it exists, collie-apply-hardware queues each hardware leaf in
# /var/lib/collie/image/deferred-steps instead of running it, and arms
# collie-provision-hardware.service. On the machine's first boot that service,
# or the platform's own first boot, retires the manifest (to target.booted) and
# runs the queue on the real hardware. Unknown manifest keys are ignored so the
# format can grow.
#
# An image carries no pacman master key of its own, or every machine flashed
# from it would share one: where install finalization would make the keyring
# (install/post-install/pacman.sh), a build requests it in
# /var/lib/collie/image/pacman-keyring instead, and the first boot makes it
# before any deferred step runs.
#
# The manifest is also the only source of the image's platform: until that boot,
# collie-hw-platform reports its platform instead of the build host's, so the
# initramfs, services and packages the build sets up are the target's. It reads
# the manifest by the same rules as collie_image_read_manifest below.
#
# Root always uses the fixed paths. Only a non-root test may move them under
# COLLIE_IMAGE_ROOT, so no environment variable can make a live system defer,
# skip or replay its hardware setup.

collie_image_init() {
  if (( EUID == 0 )); then
    collie_image_root=""
  elif [[ -n ${COLLIE_IMAGE_ROOT:-} ]]; then
    collie_image_root=$COLLIE_IMAGE_ROOT
  else
    echo "Error: image setup state is root-owned; run as root" >&2
    return 1
  fi

  collie_image_dir=$collie_image_root/var/lib/collie/image
  collie_image_manifest=$collie_image_dir/target
  collie_image_queue=$collie_image_dir/deferred-steps
  collie_image_initramfs_baseline=$collie_image_dir/initramfs-inputs
  collie_image_boot_rebuild=$collie_image_dir/boot-rebuild
  collie_image_keyring_request=$collie_image_dir/pacman-keyring
  collie_image_unit=collie-provision-hardware.service
  collie_image_systemd_dir=$collie_image_root/etc/systemd/system
}

# Owned by whoever runs this (root on a live system), not a symlink, and not
# writable by anyone else.
collie_image_trusted() {
  local path=$1 owner mode

  [[ -e $path && ! -L $path ]] || return 1
  read -r owner mode < <(stat -c '%u %a' -- "$path") || return 1
  (( owner == EUID && (8#$mode & 8#022) == 0 ))
}

collie_image_manifest_present() {
  [[ -e $collie_image_manifest || -L $collie_image_manifest ]]
}

# Sets collie_image_platform, or fails without guessing whether this is a build.
collie_image_read_manifest() {
  local line key value format="" platform=""

  if [[ ! -d $collie_image_dir || ! -f $collie_image_manifest ]] || ! collie_image_trusted "$collie_image_dir" ||
    ! collie_image_trusted "$collie_image_manifest"; then
    echo "Error: $collie_image_manifest is not a root-owned regular file" >&2
    return 1
  fi

  while IFS= read -r line || [[ -n $line ]]; do
    [[ -n $line && $line != \#* ]] || continue
    if [[ $line != *=* ]]; then
      echo "Error: $collie_image_manifest is malformed: $line" >&2
      return 1
    fi
    key=${line%%=*}
    value=${line#*=}
    case $key in
      format) format=$value ;;
      platform) platform=$value ;;
    esac
  done <"$collie_image_manifest"

  if [[ $format != "1" ]]; then
    echo "Error: $collie_image_manifest is not format=1" >&2
    return 1
  fi
  # Builders written before the platform names settled say apple-silicon,
  # generic-aarch64, generic or qualcomm (as collie-hw-platform reads them too).
  case $platform in
    apple-silicon) platform=aarch64-apple ;;
    generic-aarch64) platform=aarch64 ;;
    generic) platform=x86 ;;
    qualcomm) platform=aarch64-qualcomm ;;
  esac
  case $platform in
    x86 | aarch64 | aarch64-apple | aarch64-qualcomm | aarch64-n1x | aarch64-gb10) ;;
    *)
      echo "Error: $collie_image_manifest names no known platform: ${platform:-none}" >&2
      return 1
      ;;
  esac

  collie_image_platform=$platform
}

# Holds the image state still for the rest of the caller, so hardware setup and
# a first-boot run never overlap or decide from a manifest the other retires.
# A machine that was never an image has no state and nothing to lock.
collie_image_lock() {
  [[ -e $collie_image_dir || -L $collie_image_dir ]] || return 0
  if [[ ! -d $collie_image_dir ]] || ! collie_image_trusted "$collie_image_dir"; then
    echo "Error: $collie_image_dir is not a root-owned directory" >&2
    return 1
  fi
  exec {collie_image_lock_fd}>>"$collie_image_dir/lock" || return 1
  flock "$collie_image_lock_fd"
}

collie_image_write_queue() {
  local tmp

  tmp=$(mktemp "$collie_image_dir/.deferred-steps.XXXXXX") || return 1
  if (( $# )); then
    printf '%s\n' "$@" >"$tmp" || { rm -f "$tmp"; return 1; }
  fi
  chmod 0644 "$tmp" && mv -f "$tmp" "$collie_image_queue"
}

# Queue every leaf install/hardware/all.sh would run, in its order, running
# none of them, then arm the first-boot service. Rerunning rewrites the same queue.
collie_image_defer_hardware() {
  local listing
  local -a steps=()

  listing=$(
    run_logged() {
      [[ $1 == "$COLLIE_INSTALL"/hardware/*.sh && $1 != *..* ]] || {
        echo "Error: cannot defer a step outside the hardware setup: $1" >&2
        exit 1
      }
      printf 'install/%s\n' "${1#"$COLLIE_INSTALL"/}"
    }
    source "$COLLIE_INSTALL/hardware/all.sh"
  ) || return 1

  [[ -z $listing ]] || mapfile -t steps <<<"$listing"
  collie_image_write_queue "${steps[@]}" || return 1

  install -d -m 0755 "$collie_image_systemd_dir/multi-user.target.wants" &&
    install -m 0644 "$COLLIE_INSTALL/provisioning/$collie_image_unit" "$collie_image_systemd_dir/$collie_image_unit" &&
    ln -sfn "/etc/systemd/system/$collie_image_unit" "$collie_image_systemd_dir/multi-user.target.wants/$collie_image_unit" ||
    return 1

  echo "Image build for $collie_image_platform: deferred ${#steps[@]} hardware steps to first boot"
}
