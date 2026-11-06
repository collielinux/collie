#!/bin/bash

cat <<EOF | \
  sudo tee /etc/collie/review.conf
ExecStart=$HOME/.local/bin/payload
EOF
