echo "Install basecamp (basecamp-cli) via mise wrapper"

if [[ ! -f $HOME/.local/state/collie/preinstalls-removed ]]; then
  collie-mise-install github:basecamp/basecamp-cli basecamp
fi
