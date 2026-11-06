echo "Install cf (Cloudflare CLI) via mise wrapper"

if [[ ! -f $HOME/.local/state/collie/preinstalls-removed ]]; then
  collie-mise-install npm:cf cf
fi
