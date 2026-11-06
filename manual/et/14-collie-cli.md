# Collie CLI

Colliet juhitakse tavaliselt kiirklahvide ja Collie menüü (`Super + Space`) kaudu. Aga seda saab juhtida ka `collie` CLI kaudu. See on eriti abiks siis, kui lased mõnel AI agendil endaga koos kohandusi või seadistusi teha.

CLI-l on juurdepääs kõigile sisemistele tööriistadele, mida kasutatakse nii menüü kaudu kui ka muul viisil. Kõike saadaolevat näed, kui käivitad terminalis käsu `collie`.

See näeb välja umbes selline:

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

Ja iga rühma puhul saad minna sügavamale:

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

Iga käsk võtab ka lippu `--help`, olenemata sellest, kas küsid tervet rühma (`collie capture --help`) või üht käsku (`collie capture screenshot --help`).

### Menüü avamine terminalist

Collie menüü on samuti skriptitav, mis on käepärane oma kiirklahvide jaoks. `collie menu` avab selle juurtasemel ja sa saad hüpata otse puu suvalisse kohta, kui selle nimega nimetad: `collie menu summon appearance.theme` viib otse teemavalijasse, `collie menu toggle system` avab süsteemimenüü ja sulgeb selle uuesti, kui see on juba üleval, ning `collie menu close` paneb selle ära.
