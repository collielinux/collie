echo "Let Chromium use the cameras of Snapdragon laptops through PipeWire"

if collie-hw-aarch64-qualcomm; then
  source "$COLLIE_PATH/install/hardware/qualcomm/camera.sh"
  collie-install-camera

  echo "Log out and back in to load the PipeWire camera backend."
fi
