# Collie CLI

Collie este controlat de obicei prin tastele rapide și prin meniul Collie (`Super + Space`). Dar îl poți controla și prin CLI-ul `collie`. Acest lucru este deosebit de util atunci când un agent AI lucrează cu tine la personalizare sau configurare.

CLI-ul are acces la toate instrumentele interne folosite atât prin meniu, cât și în alte moduri. Poți vedea tot ce este disponibil rulând `collie` în terminal.

Arată cam așa:

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

Și poți aprofunda fiecare grup:

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

Fiecare comandă acceptă și `--help`, fie că întrebi un întreg grup (`collie capture --help`), fie o singură comandă (`collie capture screenshot --help`).

### Deschiderea meniului din terminal

Meniul Collie poate fi folosit și în scripturi, ceea ce este util pentru propriile tale combinații de taste. `collie menu` îl deschide la rădăcină, iar tu poți sări direct la orice punct din arbore numindu-l: `collie menu summon appearance.theme` te duce direct la selectorul de teme, `collie menu toggle system` deschide meniul de sistem și îl închide din nou dacă este deja deschis, iar `collie menu close` îl ascunde.
