echo "Put Elsewhen, the world clock, on the bar"

# Best-effort, like the put below: an update whose shell cannot be asked still
# finishes, and restarts the shell once the migrations are through.
collie-shell -q shell rescanPlugins

# A legacy omacom.elsewhen entry is renamed in place by a later migration.
config_file="$HOME/.config/collie/shell.json"
if [[ -s $config_file ]] && jq -e '[.bar.layout[]?[]? | if type == "object" then .id else . end] | index("omacom.elsewhen")' "$config_file" >/dev/null 2>&1; then
  echo "Elsewhen is already on the bar"
else
  collie-bar put collie.elsewhen --after collie.clock
fi
