sudo dd status=none of=/etc/collie/boot.conf <<EOF
cmdline=$boot_params
EOF
