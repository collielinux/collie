DROP_IN=/etc/systemd/system/collie-agent.service.d/override.conf

cat <<EOF | sudo tee "$DROP_IN" >/dev/null
[Service]
ExecStart=$COLLIE_PATH/bin/collie-agent
EOF
