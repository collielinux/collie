#!/bin/bash

cat <<EOF >/tmp/collie-review-unit
[Service]
ExecStart=$HOME/.local/bin/payload
EOF
sudo install -m 644 /tmp/collie-review-unit /etc/systemd/system/review.service
