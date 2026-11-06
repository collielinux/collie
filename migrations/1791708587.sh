echo "Install Signed, the PDF signing app"

if [[ ! -f $HOME/.local/state/collie/preinstalls-removed ]]; then
  collie-pkg-add signed
fi
