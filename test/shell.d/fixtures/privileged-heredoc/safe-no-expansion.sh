cat <<EOF | sudo tee /etc/udev/rules.d/99-collie.rules >/dev/null
SUBSYSTEM=="power_supply", ATTR{type}=="Mains", RUN+="/usr/bin/collie-powerprofiles-set"
EOF
