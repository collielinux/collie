echo "Install Gliff on aarch64, now that Collie's repositories build it there"

if collie-hw-aarch64; then
  collie-pkg-add gliff
fi
