# A plain redirect into /etc, no sudo: the command re-execs itself as root.
cat >/etc/collie/agent.conf <<EOF
helper=$HOME/.local/share/collie/bin/collie-agent
EOF
