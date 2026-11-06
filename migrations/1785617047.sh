echo "Install oh-my-pi (omp) via mise wrapper"

if [[ ! -f $HOME/.local/state/collie/preinstalls-removed ]]; then
  collie-mise-install github:can1357/oh-my-pi omp
fi
