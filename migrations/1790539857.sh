echo "Install Monologue, the webcam recorder"

if [[ ! -f $HOME/.local/state/collie/preinstalls-removed ]]; then
  collie-pkg-add monologue
fi
