# An upgrade, or a run of collie-setup-git, can have set the identity already.
if [[ -z $(git config --global user.name) || -z $(git config --global user.email) ]]; then
  collie-notification-send -u critical -g  "$(collie-i18n firstRun.gitTitle)" "$(collie-i18n firstRun.gitBody)" \
    --exec collie-launch-floating-terminal-with-presentation collie-setup-git
fi
