# Collie CLI

Collie wird in der Regel über die Hotkeys und das Collie-Menü (`Super + Space`) gesteuert. Du kannst es aber auch über die `collie`-CLI steuern. Das ist besonders hilfreich, wenn ein KI-Agent mit dir an Anpassungen oder Konfiguration arbeitet.

Die CLI hat Zugriff auf alle internen Werkzeuge, die sowohl über das Menü als auch anderweitig verwendet werden. Du kannst alles Verfügbare sehen, indem du `collie` im Terminal ausführst.

Das sieht ungefähr so aus:

```
~ ❯ collie
Collie command center

Usage:
  collie <command> [args...]
  collie commands [--all] [--json] [--check]
  collie <group> --help
  collie <group> <command> --help

Common commands:
  collie update              Update Collie and system packages
  collie theme list          List available themes
  collie theme set <name>    Apply a theme
  collie font list           List available fonts
  collie screenshot          Take a screenshot
  collie debug               Print debugging information

Groups:
  agent          AI coding agents, their usage, and subscription accounts
  audio          Audio input and output controls
  bar            Collie shell bar layout and settings
  battery        Battery status helpers
  bluetooth      Bluetooth device controls
  branch         Collie git branch management
  branding       About and screensaver branding
  brightness     Display and keyboard brightness
  capture        Screenshots and screen recording
  channel        Collie release channel management
  clipboard      Clipboard helpers
  cmd            Command and shortcut helpers
  config         System configuration helpers
  debug          Diagnostics and support logs
  ...
```

Und du kannst bei jeder Gruppe tiefer einsteigen:

```
~ ❯ collie capture
Capture commands — Screenshots and screen recording:
  collie capture qr                                                                                                                                                                                                       Decode a QR code from a screenshot region
  collie capture screenrecording [--fullscreen] [--with-desktop-audio] [--with-microphone-audio] [--with-webcam] [--webcam-device=<device>] [--webcam-size=<small|medium|large>] [--resolution=<size>] [--stop-recording]  Start or stop screen recording
  collie capture screenrecording with webcam                                                                                                                                                                              Pick a webcam and start a screen recording with it
  collie capture screenshot [smart|region|windows|fullscreen|scroll] [copy|save]                                                                                                                                          Take a screenshot
  collie capture text                                                                                                                                                                                                     Extract text from a screenshot region with OCR
  collie capture webcam resize <smaller|larger|reset|small|medium|large>                                                                                                                                                  Resize the active webcam recording overlay
```

Jeder Befehl akzeptiert auch `--help`, egal ob du eine ganze Gruppe (`collie capture --help`) oder einen einzelnen Befehl (`collie capture screenshot --help`) abfragst.

### Das Menü vom Terminal aus öffnen

Das Collie-Menü ist ebenfalls skriptbar, was für deine eigenen Tastenkombinationen praktisch ist. `collie menu` öffnet es auf der obersten Ebene, und du kannst direkt zu jedem Punkt im Baum springen, indem du ihn benennst: `collie menu summon appearance.theme` führt direkt zur Theme-Auswahl, `collie menu toggle system` öffnet das Systemmenü und schließt es wieder, wenn es bereits geöffnet ist, und `collie menu close` schließt es.
