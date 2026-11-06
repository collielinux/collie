# The Marvell Wi-Fi firmware is for x86 Surfaces only; Snapdragon Surfaces use Qualcomm Wi-Fi.
if collie-hw-surface && collie-hw-x86; then
  collie-pkg-add linux-firmware-marvell
fi
