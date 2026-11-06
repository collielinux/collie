# `>|` is a plain redirect with noclobber overridden, not a redirect into a pipe.
cat >|/etc/collie/agent.conf <<EOF
helper=$HOME/.local/share/collie/bin/collie-agent
EOF
