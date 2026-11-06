# Collie CLI

Collie wordt meestal bediend via de sneltoetsen en het Collie-menu (`Super + Space`). Maar je kunt het ook bedienen via de `collie` CLI. Dit is vooral handig wanneer je een AI-agent met je laat meewerken aan aanpassingen of configuratie.

De CLI heeft toegang tot alle interne tooling die zowel via het menu als anderszins wordt gebruikt. Je kunt alles zien wat beschikbaar is door `collie` in de terminal uit te voeren.

Het ziet er ongeveer zo uit:

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

En je kunt dieper in elke groep duiken:

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

Elke opdracht accepteert ook `--help`, of je nu een hele groep vraagt (`collie capture --help`) of een enkele opdracht (`collie capture screenshot --help`).

### Het menu openen vanuit de terminal

Het Collie-menu is ook scriptbaar, wat handig is voor je eigen toetsbindingen. `collie menu` opent het bij de root, en je kunt rechtstreeks naar elk punt in de boom springen door het te benoemen: `collie menu summon appearance.theme` gaat direct naar de themakiezer, `collie menu toggle system` opent het systeemmenu en sluit het weer als het al openstaat, en `collie menu close` bergt het weg.
