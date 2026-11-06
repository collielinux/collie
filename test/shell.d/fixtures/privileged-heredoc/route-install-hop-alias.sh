tmp=/tmp/collie-generated
copy=$tmp
cat >"$tmp" <<EOF
command=$HOME/.local/share/collie/bin/example
EOF
sudo install -m644 "$copy" /etc/collie/example.conf
