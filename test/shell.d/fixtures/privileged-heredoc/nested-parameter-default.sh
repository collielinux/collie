#!/bin/bash

# collie:heredoc-expands paths=none -- review regression fixture
sudo tee /etc/collie/review.conf >/dev/null <<EOF
ExecStart=${target:-$HOME/.local/bin/payload}
EOF
