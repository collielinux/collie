tmp=/tmp/collie-generated
cat >"$tmp" <<EOF
command=$HOME/.local/share/collie/bin/example
EOF
sudo install -m644 "${tmp}" /etc/collie/example.conf
