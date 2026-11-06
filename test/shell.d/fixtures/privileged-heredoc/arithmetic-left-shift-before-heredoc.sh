mask=$((1 << bits))

cat >/etc/collie/agent.conf <<EOF
helper=$HOME/.local/share/collie/bin/collie-agent
EOF
