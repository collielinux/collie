echo "Install Intel hardware video decoding on GPUs named only \"[Intel Graphics]\", such as Wildcat Lake"

# Hardware setup missed these GPUs, so video was decoded on the CPU.
# See install/hardware/intel/video-acceleration.sh.
if lspci | grep -iE 'vga|3d|display' | grep -qi '\[intel graphics'; then
  collie-pkg-add intel-media-driver libvpl vpl-gpu-rt
fi
