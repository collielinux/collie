echo "Install Hype, the Markdown presentation app"

if [[ ! -f $HOME/.local/state/collie/preinstalls-removed ]]; then
  collie-pkg-add hype
fi
