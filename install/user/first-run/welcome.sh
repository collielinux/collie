# The catalog entry holds a real newline, not a literal \n: the card renders the
# body as it arrives, and elides past three lines.
collie-notification-send -u critical -g  "$(collie-i18n firstRun.keybindingsTitle)" \
  "$(collie-i18n firstRun.keybindingsBody)" \
  --exec collie-menu-keybindings
