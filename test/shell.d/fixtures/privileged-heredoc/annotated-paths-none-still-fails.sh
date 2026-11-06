if collie-battery-present; then
  # collie:heredoc-expands paths=none -- only interpolates the collie bin path
  cat <<EOF | sudo tee "/etc/udev/rules.d/99-power-profile.rules"
SUBSYSTEM=="power_supply", ATTR{type}=="Mains", RUN+="/usr/bin/systemd-run --no-block --collect --unit=collie-power-profile --property=After=power-profiles-daemon.service $HOME/.local/share/collie/bin/collie-powerprofiles-set"
SUBSYSTEM=="power_supply", ATTR{type}=="USB", RUN+="/usr/bin/systemd-run --no-block --collect --unit=collie-power-profile --property=After=power-profiles-daemon.service $HOME/.local/share/collie/bin/collie-powerprofiles-set"
EOF

  sudo systemctl enable power-profiles-daemon

  sudo udevadm control --reload 2>/dev/null
  sudo udevadm trigger --subsystem-match=power_supply 2>/dev/null
fi
