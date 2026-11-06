# Snapdragon cameras run through libcamera, which apps reach through
# PipeWire's libcamera backend.

if collie-hw-aarch64-qualcomm; then
  collie-pkg-add pipewire-libcamera
fi
