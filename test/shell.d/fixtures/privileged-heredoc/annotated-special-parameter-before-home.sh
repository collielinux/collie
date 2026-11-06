# collie:heredoc-expands paths=none -- the positional argument is a scalar
sudo tee /etc/collie/example.conf <<EOF
argument=$1
command=$HOME/.local/share/collie/bin/example
EOF
