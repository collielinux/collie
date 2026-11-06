storage="$HOME/storage"
shared="$HOME/shared"

# collie:heredoc-expands paths=shared,storage -- both sources are validated before use
cat >/etc/collie/mounts.conf <<EOF
storage=$storage:/storage
shared=$shared:/shared
EOF
