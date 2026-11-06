# Collie CLI

Collie styres normalt via genvejstasterne og Collie-menuen (`Super + Space`). Men du kan også styre det via `collie` CLI'en. Det er særligt nyttigt, når du har en AI-agent til at arbejde sammen med dig om tilpasning eller konfiguration.

CLI'en har adgang til alle de interne værktøjer, der bruges både via menuen og på anden vis. Du kan se alt, hvad der er tilgængeligt, ved at køre `collie` i terminalen.

Det ser nogenlunde sådan her ud:

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

Og du kan dykke dybere ned i hver gruppe:

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

Alle kommandoer tager også `--help`, uanset om du spørger en hel gruppe (`collie capture --help`) eller en enkelt kommando (`collie capture screenshot --help`).

### Åbning af menuen fra terminalen

Collie-menuen kan også scriptes, hvilket er praktisk til dine egne genvejstaster. `collie menu` åbner den ved roden, og du kan springe direkte til ethvert punkt i træet ved at navngive det: `collie menu summon appearance.theme` går direkte til temavælgeren, `collie menu toggle system` åbner systemmenuen og lukker den igen, hvis den allerede er fremme, og `collie menu close` gemmer den væk.
