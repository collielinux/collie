# Setup user theme folder and seed the default only when no theme exists yet.
mkdir -p ~/.config/collie/themes

if [[ ! -s $HOME/.local/state/collie/current/theme.name ]]; then
  # iso-chroot and provision-owner both run without a live session to notify.
  if [[ ${COLLIE_SETUP_CONTEXT:-runtime} != "runtime" ]]; then
    COLLIE_THEME_HEADLESS=1 collie-theme-set "Tokyo Night"
    rm -f ~/.config/chromium/SingletonLock # otherwise archiso owns the Chromium singleton
  else
    collie-theme-set "Tokyo Night"
  fi
fi
collie-theme-set-pi --activate
collie-theme-set-fcitx5 --activate

mkdir -p ~/.config/btop/themes
ln -snf "$HOME/.local/state/collie/current/theme/btop.theme" ~/.config/btop/themes/current.theme
