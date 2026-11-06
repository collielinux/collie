cat <<'EOF' | sudo tee /etc/udev/rules.d/99-collie.rules >/dev/null
SUBSYSTEM=="power_supply", RUN+="/usr/bin/collie-powerprofiles-set $HOME"
EOF

cat <<"XML" | sudo tee /etc/collie/agent.xml >/dev/null
<config path="$HOME/.local/share/collie" />
XML
