echo "Enable Dell XPS 13 sidecar speaker amplifiers"

if collie-hw-dell-xps13-sidecar-amps; then
  source "$COLLIE_PATH/install/hardware/dell-xps13-sidecar-amps.sh"
  collie-state set reboot-required
fi
