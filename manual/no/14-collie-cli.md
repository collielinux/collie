# Collie CLI

Collie styres vanligvis gjennom hurtigtastene og Collie-menyen (`Super + Space`). Men du kan også styre det gjennom `collie` CLI. Dette er særlig nyttig når du har en AI-agent som jobber sammen med deg med tilpasning eller konfigurasjon.

CLI-en har tilgang til all intern verktøystøtte som brukes både via menyen og ellers. Du kan se alt som er tilgjengelig ved å kjøre `collie` i terminalen.

Det ser omtrent slik ut:

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

Og du kan dykke dypere ned i hver gruppe:

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

Alle kommandoer tar også `--help`, enten du spør en hel gruppe (`collie capture --help`) eller en enkeltkommando (`collie capture screenshot --help`).

### Åpne menyen fra terminalen

Collie-menyen kan også skriptes, noe som er hendig for dine egne tastebindinger. `collie menu` åpner den på rotnivå, og du kan hoppe rett til ethvert punkt i treet ved å navngi det: `collie menu summon appearance.theme` går rett til temavelgeren, `collie menu toggle system` åpner systemmenyen og lukker den igjen hvis den allerede er oppe, og `collie menu close` legger den bort.
