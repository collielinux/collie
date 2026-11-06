echo "Install the Dell XPS 13 Panther Lake speaker firmware"

if collie-hw-dell-xps13-dx13260-ptl; then
  source "$COLLIE_PATH/install/hardware/dell-xps13-ptl-speaker-firmware.sh"
  collie-state set reboot-required
fi
