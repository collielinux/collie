# Set default XCompose that is triggered with Shift + CapsLock
tee ~/.XCompose >/dev/null <<EOF
# Run collie-restart-xcompose to apply changes

# Include fast emoji access
include "/usr/share/collie/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$COLLIE_USER_NAME"
<Multi_key> <space> <e> : "$COLLIE_USER_EMAIL"
EOF
