#!/bin/bash

set -euo pipefail

source "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/base-test.sh"

# The compositor reports at least one monitor
monitors=$(hyprctl -j monitors | jq 'length')
(( monitors >= 1 )) || fail "compositor reports a monitor"
pass "compositor reports a monitor"

# The Collie shell is running and responsive
wait_until "collie-shell responds to ping" 60 collie-shell shell ping

# Core shell plugins are loaded
plugins=$(collie-shell shell listPlugins)
for plugin in \
  collie.audio collie.background collie.bar collie.bluetooth \
  collie.clipboard collie.emojis collie.menu \
  collie.monitor collie.network collie.notifications collie.power \
  collie.reminders collie.weather; do
  [[ $plugins == *"$plugin"* ]] || fail "shell plugin is loaded: $plugin" "loaded plugins: $plugins"
  pass "shell plugin is loaded: $plugin"
done

# The bar and background are actually on screen
wait_until "bar layer is on screen" 30 layer_on_screen "collie-bar"
wait_until "background layer is on screen" 30 layer_on_screen "collie-background"

# Hiding parks the bar off-screen without unmapping its layer surface, and
# revealing brings that same surface back on-screen.
restore_bar_visibility() {
  collie-toggle-bar off >/dev/null 2>&1 || true
}
trap restore_bar_visibility EXIT

collie-toggle-bar on
wait_until "hidden bar layer stays mapped" 15 layer_present "collie-bar"
wait_until "hidden bar layer parks off screen" 15 layer_off_screen "collie-bar"
screenshot "success-bar-hidden"

collie-toggle-bar off
wait_until "revealed bar layer returns on screen" 15 layer_on_screen "collie-bar"
screenshot "success-bar-revealed"
trap - EXIT

# Audio stack is up
wait_until "pipewire is running" 30 wpctl status

# Root filesystem is btrfs as installed
[[ $(findmnt -no FSTYPE /) == "btrfs" ]] || fail "root filesystem is btrfs"
pass "root filesystem is btrfs"

# Collie reports its version
collie-version >/dev/null || fail "collie-version works"
pass "collie-version works"

# No failed units, system or user. COLLIE_ACCEPTANCE_IGNORE_UNITS can hold a
# regex of units to overlook (useful on dev machines; a fresh VM should be clean).
failed_units() {
  systemctl "$@" --failed --no-legend --plain | awk '{print $1}' |
    grep -Ev "${COLLIE_ACCEPTANCE_IGNORE_UNITS:-^$}" || true
}

failed_system=$(failed_units --system)
if [[ -n $failed_system ]]; then
  fail "no failed system units" "failed units: $failed_system"
fi
pass "no failed system units"

failed_user=$(failed_units --user)
if [[ -n $failed_user ]]; then
  fail "no failed user units" "failed units: $failed_user"
fi
pass "no failed user units"

screenshot "success-desktop"
