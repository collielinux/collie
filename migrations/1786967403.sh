echo "Install Kimi coding agent mise wrapper"

if [[ ! -f $HOME/.local/state/collie/preinstalls-removed ]] && collie-cmd-missing kimi; then
  collie-mise-install npm:@moonshot-ai/kimi-code kimi
fi
