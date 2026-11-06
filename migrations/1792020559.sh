echo "Theme the Fcitx candidate window with the current Collie theme"

# Activation selects the theme; the refresh then renders it, since the current
# theme was staged before its template existed.
collie-theme-set-fcitx5 --activate
collie-theme-refresh
