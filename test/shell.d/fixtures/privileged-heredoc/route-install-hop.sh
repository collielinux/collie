tmp=$(mktemp)

cat >"$tmp" <<EOF
#!/bin/bash
exec "$HOME/.local/share/collie/bin/collie-agent" "$@"
EOF

sudo install -m 0755 "$tmp" /usr/local/bin/collie-agent-shim
