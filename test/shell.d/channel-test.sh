#!/bin/bash

set -euo pipefail

source "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/base-test.sh"

source "$SHELL_TEST_DIR/fixtures/sudo-boundary-test.sh"
test_tmp="$boundary_tmp"
package_root="$SUDO_TEST_ROOT"
copy_boundary_file bin/collie-channel-set
python3 - "$SUDO_TEST_ROOT/bin/collie-channel-set" "$package_root" <<'PYTHON'
import sys
from pathlib import Path
p = Path(sys.argv[1])
p.write_text(p.read_text().replace("/usr/share/collie", sys.argv[2]))
PYTHON

stub_bin="$SUDO_TEST_ROOT/bin"
log_file="$test_tmp/channel.log"
mkdir -p "$stub_bin" "$test_tmp/home"

write_stub() {
  local name="$1"
  local body="$2"

  rm -f "$stub_bin/$name"
  cat >"$stub_bin/$name" <<<"$body"
  chmod +x "$stub_bin/$name"
}

write_stub collie-refresh-pacman '#!/bin/bash
printf "refresh" >>"$COLLIE_CHANNEL_TEST_LOG"
for arg in "$@"; do printf "\t%s" "$arg" >>"$COLLIE_CHANNEL_TEST_LOG"; done
printf "\n" >>"$COLLIE_CHANNEL_TEST_LOG"
'

write_stub sudo '#!/bin/bash
printf "sudo" >>"$COLLIE_CHANNEL_TEST_LOG"
for arg in "$@"; do printf "\t%s" "$arg" >>"$COLLIE_CHANNEL_TEST_LOG"; done
printf "\n" >>"$COLLIE_CHANNEL_TEST_LOG"
'

/usr/bin/cp "$stub_bin/sudo" "$SUDO_TEST_ROOT/mock/sudo"

write_stub collie-dev-unlink '#!/bin/bash
printf "unlink" >>"$COLLIE_CHANNEL_TEST_LOG"
for arg in "$@"; do printf "\t%s" "$arg" >>"$COLLIE_CHANNEL_TEST_LOG"; done
printf "\n" >>"$COLLIE_CHANNEL_TEST_LOG"
'

write_stub collie-state '#!/bin/bash
printf "state" >>"$COLLIE_CHANNEL_TEST_LOG"
for arg in "$@"; do printf "\t%s" "$arg" >>"$COLLIE_CHANNEL_TEST_LOG"; done
printf "\n" >>"$COLLIE_CHANNEL_TEST_LOG"
'

write_stub collie-update '#!/bin/bash
printf "update" >>"$COLLIE_CHANNEL_TEST_LOG"
for arg in "$@"; do printf "\t%s" "$arg" >>"$COLLIE_CHANNEL_TEST_LOG"; done
printf "\tCOLLIE_PATH=%s" "$COLLIE_PATH" >>"$COLLIE_CHANNEL_TEST_LOG"
printf "\n" >>"$COLLIE_CHANNEL_TEST_LOG"
printf "path-at-update\t%s\n" "$PATH" >>"$COLLIE_CHANNEL_TEST_LOG"
'

write_stub gum '#!/bin/bash
printf "gum" >>"$COLLIE_CHANNEL_TEST_LOG"
for arg in "$@"; do printf "\t%s" "$arg" >>"$COLLIE_CHANNEL_TEST_LOG"; done
printf "\n" >>"$COLLIE_CHANNEL_TEST_LOG"
exit 0
'

write_stub git '#!/bin/bash
printf "git" >>"$COLLIE_CHANNEL_TEST_LOG"
for arg in "$@"; do printf "\t%s" "$arg" >>"$COLLIE_CHANNEL_TEST_LOG"; done
printf "\n" >>"$COLLIE_CHANNEL_TEST_LOG"
if [[ $1 == "clone" ]]; then
  dest="${@: -1}"
  /usr/bin/cp -a "$SUDO_TEST_ROOT" "$dest"
  mkdir -p "$dest/.git" "$dest/shell"
fi
'

write_stub collie-dev-link '#!/bin/bash
printf "link" >>"$COLLIE_CHANNEL_TEST_LOG"
for arg in "$@"; do printf "\t%s" "$arg" >>"$COLLIE_CHANNEL_TEST_LOG"; done
printf "\n" >>"$COLLIE_CHANNEL_TEST_LOG"
'

write_stub collie-version-channel '#!/bin/bash
printf "%s\n" "${COLLIE_TEST_VERSION_CHANNEL:-unknown}"
'

write_stub pacman '#!/bin/bash
[[ $1 == "-Q" ]] || exit 1
shift
case "${COLLIE_TEST_PACKAGES:-}" in
  stable) [[ $* == "collie omarchy-settings" ]] ;;
  dev) [[ $* == "omarchy-dev omarchy-settings-dev" ]] ;;
  *) exit 1 ;;
esac
'

run_channel() {
  : >"$log_file"
  COLLIE_CHANNEL_TEST_LOG="$log_file" \
    COLLIE_PATH="${COLLIE_TEST_PATH:-$package_root}" \
    COLLIE_REGION_FILE="${COLLIE_TEST_REGION_FILE:-$test_tmp/no-region}" \
    HOME="$test_tmp/home" \
    PATH="${COLLIE_TEST_PATH_PREFIX:+$COLLIE_TEST_PATH_PREFIX:}$stub_bin:$ROOT/bin:$PATH" \
    "${COLLIE_TEST_PATH:-$package_root}/bin/collie-channel-set" "$@"
}

assert_log_line() {
  local expected="$1"
  local description="$2"

  grep -Fx -- "$expected" "$log_file" >/dev/null || fail "$description" "$(cat "$log_file")"
  pass "$description"
}

run_channel stable
assert_log_line $'refresh\tstable' "stable refreshes the stable pacman channel"
assert_log_line $'sudo\tenv\tCOLLIE_UPDATE_PACMAN=1\tpacman\t-S\t--needed\t--noconfirm\t--ask\t4\tcollie\tomarchy-settings' "stable installs stable Collie packages"
assert_log_line $'unlink\t--no-reboot' "stable restores the package-backed Collie path without an early reboot prompt"
assert_log_line $'update\t-y\tCOLLIE_PATH='"$package_root" "stable runs the normal update pipeline from the package-backed path"
if grep -q $'^state\tset\treboot-required$' "$log_file"; then
  fail "stable does not require reboot when already package-backed" "$(cat "$log_file")"
fi
pass "stable does not require reboot when already package-backed"

run_channel rc
assert_log_line $'refresh\trc' "rc refreshes the rc pacman channel"
assert_log_line $'sudo\tenv\tCOLLIE_UPDATE_PACMAN=1\tpacman\t-S\t--needed\t--noconfirm\t--ask\t4\tcollie\tomarchy-settings' "rc installs rc Collie packages"
assert_log_line $'unlink\t--no-reboot' "rc restores the package-backed Collie path without an early reboot prompt"
assert_log_line $'update\t-y\tCOLLIE_PATH='"$package_root" "rc runs the normal update pipeline from the package-backed path"

active_checkout="$test_tmp/active-checkout"
/usr/bin/cp -a "$package_root" "$active_checkout"
# A dev-linked login has the checkout's bin first on PATH, here twice and once
# with a trailing slash.
COLLIE_TEST_PATH="$active_checkout" COLLIE_TEST_PATH_PREFIX="$active_checkout/bin:$active_checkout/bin/:$active_checkout/bin" run_channel edge
assert_log_line $'refresh\tedge' "edge refreshes the edge pacman channel"
assert_log_line $'sudo\tenv\tCOLLIE_UPDATE_PACMAN=1\tpacman\t-S\t--needed\t--noconfirm\t--ask\t4\tomarchy-dev\tomarchy-settings-dev' "edge installs development Collie packages"
assert_log_line $'unlink\t--no-reboot' "edge unlinks dev without an early reboot prompt"
assert_log_line $'state\tset\treboot-required' "edge marks reboot required when leaving dev"
assert_log_line $'update\t-y\tCOLLIE_PATH='"$package_root" "edge runs the normal update pipeline from the package-backed path"
[[ $(grep -E $'^(unlink|state|update)\t' "$log_file") == $'unlink\t--no-reboot\nstate\tset\treboot-required\nupdate\t-y\tCOLLIE_PATH='"$package_root" ]] ||
  fail "edge defers the reboot prompt until the update restart stage" "$(cat "$log_file")"
if grep -E $'^path-at-update\t' "$log_file" | grep -Fq "$active_checkout/bin"; then
  fail "leaving dev hands the update a PATH without the unlinked checkout" "$(cat "$log_file")"
fi
pass "leaving dev hands the update a PATH without the unlinked checkout"
pass "edge defers the reboot prompt until the update restart stage"

checkout="$test_tmp/home/collie"
mkdir -p "$checkout"
if run_channel dev >"$test_tmp/occupied.out" 2>"$test_tmp/occupied.err"; then
  fail "dev refuses to use an occupied non-checkout path"
fi

grep -q "already exists and is not a git checkout" "$test_tmp/occupied.err" || fail "dev explains occupied checkout paths" "$(cat "$test_tmp/occupied.err")"
if grep -Fx $'refresh\tedge' "$log_file" >/dev/null; then
  fail "dev validates checkout path before changing packages" "$(cat "$log_file")"
fi
pass "dev refuses occupied non-checkout paths before package changes"

rmdir "$checkout"
run_channel dev
assert_log_line $'gum\tconfirm\t--default=false\tSwitch to dev channel?' "dev asks for confirmation"
assert_log_line $'refresh\tedge' "dev refreshes the edge pacman channel"
assert_log_line $'sudo\tenv\tCOLLIE_UPDATE_PACMAN=1\tpacman\t-S\t--needed\t--noconfirm\t--ask\t4\tomarchy-dev\tomarchy-settings-dev' "dev installs development Collie packages"
assert_log_line $'git\tclone\t--filter=blob:none\thttps://github.com/collielinux/collie.git\t'"$checkout" "dev clones the source checkout to ~/collie"
assert_log_line $'link\t'"$checkout"$'\t--no-reboot' "dev links ~/collie without an early reboot prompt"
assert_log_line $'state\tset\treboot-required' "dev defers the reboot prompt to the update pipeline"
assert_log_line $'update\t-y\tCOLLIE_PATH='"$checkout" "dev runs the normal update pipeline from the source checkout"
[[ $(grep -E '^(git|link|state|refresh|sudo|update)' "$log_file") == $'git\tclone\t--filter=blob:none\thttps://github.com/collielinux/collie.git\t'"$checkout"$'\nlink\t'"$checkout"$'\t--no-reboot\nstate\tset\treboot-required\nrefresh\tedge\nsudo\tenv\tCOLLIE_UPDATE_PACMAN=1\tpacman\t-S\t--needed\t--noconfirm\t--ask\t4\tomarchy-dev\tomarchy-settings-dev\nupdate\t-y\tCOLLIE_PATH='"$checkout" ]] ||
  fail "dev activates the checkout before changing or updating packages" "$(cat "$log_file")"
pass "dev activates the checkout before changing or updating packages"

COLLIE_TEST_PATH="$checkout" run_channel stable
assert_log_line $'unlink\t--no-reboot' "switching from dev to stable unlinks without an early reboot prompt"
assert_log_line $'state\tset\treboot-required' "switching from dev to stable marks reboot required"

run_channel dev
if grep -q $'^git\tclone\t' "$log_file"; then
  fail "dev reuses an existing checkout" "$(cat "$log_file")"
fi
assert_log_line $'link\t'"$checkout"$'\t--no-reboot' "switching back to dev links ~/collie"
pass "switching back to dev reuses the existing ~/collie checkout"

printf 'cn\n' >"$test_tmp/region"
if COLLIE_TEST_REGION_FILE="$test_tmp/region" run_channel dev >"$test_tmp/region.out" 2>"$test_tmp/region.err"; then
  fail "dev refuses a checkout without this machine's region"
fi
grep -q "does not support the 'cn' region" "$test_tmp/region.err" || fail "dev explains the missing region" "$(cat "$test_tmp/region.err")"
if grep -Eq $'^(link|refresh)\t' "$log_file"; then
  fail "dev refuses before linking or refreshing pacman" "$(cat "$log_file")"
fi
pass "dev refuses a checkout without the region before touching pacman"

# A directory with the region's name, or a helper that cannot run, is not
# support: the refresh after linking would fail with dev already linked.
mkdir -p "$checkout/default/regions/cn"
touch "$checkout/bin/collie-apply-pacman"
chmod +x "$checkout/bin/collie-apply-pacman"
if COLLIE_TEST_REGION_FILE="$test_tmp/region" run_channel dev >"$test_tmp/region.out" 2>"$test_tmp/region.err"; then
  fail "dev refuses an empty region profile"
fi
if grep -Eq $'^(link|refresh)\t' "$log_file"; then
  fail "dev refuses an empty region profile before linking or refreshing pacman" "$(cat "$log_file")"
fi
mkdir -p "$checkout/default/regions/cn/pacman"
cn_fragments=(collie-stable.prepend collie-rc.prepend collie-edge.prepend mirrorlist-stable.prepend mirrorlist-rc.prepend mirrorlist-edge.prepend)
for missing in "${cn_fragments[@]}"; do
  for fragment in "${cn_fragments[@]}"; do
    if [[ $fragment == "$missing" ]]; then
      rm -f "$checkout/default/regions/cn/pacman/$fragment"
    else
      touch "$checkout/default/regions/cn/pacman/$fragment"
    fi
  done
  if COLLIE_TEST_REGION_FILE="$test_tmp/region" run_channel dev >"$test_tmp/region.out" 2>"$test_tmp/region.err"; then
    fail "dev refuses a region profile without $missing"
  fi
  if grep -Eq $'^(link|refresh)\t' "$log_file"; then
    fail "dev refuses a profile without $missing before linking or refreshing pacman" "$(cat "$log_file")"
  fi
done
touch "${cn_fragments[@]/#/$checkout/default/regions/cn/pacman/}"
chmod -x "$checkout/bin/collie-apply-pacman"
if COLLIE_TEST_REGION_FILE="$test_tmp/region" run_channel dev >"$test_tmp/region.out" 2>"$test_tmp/region.err"; then
  fail "dev refuses a checkout whose pacman helper cannot run"
fi
if grep -Eq $'^(link|refresh)\t' "$log_file"; then
  fail "dev refuses incomplete region support before linking or refreshing pacman" "$(cat "$log_file")"
fi
pass "dev refuses a region profile missing any fragment or a helper that cannot run"

chmod +x "$checkout/bin/collie-apply-pacman"
COLLIE_TEST_REGION_FILE="$test_tmp/region" run_channel dev
assert_log_line $'refresh\tedge' "dev proceeds with a checkout that supports the region"

current_channel() {
  COLLIE_TEST_VERSION_CHANNEL="$1" \
    COLLIE_TEST_PACKAGES="$2" \
    COLLIE_PATH="$3" \
    PATH="$stub_bin:$ROOT/bin:$PATH" \
    "$ROOT/bin/collie-channel-current"
}

[[ $(current_channel stable stable /usr/share/collie) == "stable" ]] || fail "current channel detects stable"
pass "current channel detects stable"

[[ $(current_channel rc stable /usr/share/collie) == "rc" ]] || fail "current channel detects rc"
pass "current channel detects rc"

[[ $(current_channel edge dev /usr/share/collie) == "edge" ]] || fail "current channel detects package-backed edge"
pass "current channel detects package-backed edge"

[[ $(current_channel edge dev "$test_tmp/dev-checkout") == "dev" ]] || fail "current channel detects dev from COLLIE_PATH"
pass "current channel honors a dev link outside ~/collie"
