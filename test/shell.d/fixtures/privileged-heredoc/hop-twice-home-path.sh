#!/bin/bash

# Two hops. The scan resolves collie_bin into helper, so the value it ends up
# judging still carries an unresolved $HOME rather than a literal path.
collie_bin="$HOME/.local/share/collie/bin"
helper="$collie_bin/collie-agent"

# collie:heredoc-expands paths=none -- helper names the agent, no path is baked in
cat <<EOF | sudo tee /etc/udev/rules.d/99-collie-agent.rules >/dev/null
SUBSYSTEM=="power_supply", RUN+="$helper"
EOF
