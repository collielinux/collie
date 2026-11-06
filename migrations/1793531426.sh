echo "Keep GB10 CPU cores out of deep idle states whose wakeup latency the firmware understates"

# See install/hardware/gb10/cpuidle.sh, which sets up new installs the same way.
collie-hw-aarch64-gb10 || exit 0

sudo bash "$COLLIE_PATH/install/hardware/gb10/cpuidle.sh"
