mkdir -p ~/.config/collie

cat >~/.config/collie/agent.conf <<EOF
helper=$HOME/.local/share/collie/bin/collie-agent
EOF

cat >"$HOME/.local/bin/collie-shim" <<EOF
exec "$COLLIE_PATH/bin/collie-agent" "$@"
EOF
