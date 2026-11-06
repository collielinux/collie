echo "Install Gliff, the Hyprland remote desktop over SSH"

# Gliff has no aarch64 build (install/collie-x86_64-only.packages).
if collie-hw-x86; then
  collie-pkg-add gliff
fi
