# Collie CLI

Az Colliet általában a gyorsbillentyűkkel és az Collie menüvel (`Super + Space`) vezérled. De az `collie` CLI-n keresztül is vezérelheted. Ez különösen hasznos, amikor egy AI-ügynök dolgozik veled a testreszabáson vagy a konfiguráláson.

A CLI hozzáfér minden belső eszközhöz, amelyet a menün keresztül és más módokon is használ a rendszer. Minden elérhető lehetőséget megnézhetsz, ha futtatod az `collie` parancsot a terminálban.

Valahogy így néz ki:

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

És minden csoportban mélyebbre is áshatsz:

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

Minden parancs elfogadja a `--help` kapcsolót is, akár egy egész csoportról kérdezel (`collie capture --help`), akár egyetlen parancsról (`collie capture screenshot --help`).

### A menü megnyitása a terminálból

Az Collie menü is szkriptelhető, ami jól jön a saját billentyűparancsaidhoz. Az `collie menu` a gyökérnél nyitja meg, és a fa bármely pontjára közvetlenül odaugorhatsz, ha megnevezed: az `collie menu summon appearance.theme` egyenesen a témaválasztóhoz visz, az `collie menu toggle system` megnyitja a rendszermenüt, és újra bezárja, ha már nyitva van, az `collie menu close` pedig eltünteti.
