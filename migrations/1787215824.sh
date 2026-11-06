echo "Install hey (hey-cli) via mise wrapper"

if [[ ! -f $HOME/.local/state/collie/preinstalls-removed ]]; then
  collie-mise-install github:basecamp/hey-cli hey
fi
