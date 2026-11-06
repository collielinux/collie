# Collie CLI

Colliejem se obično upravlja putem tipkovničkih prečaca i Collie izbornika (`Super + Space`). Ali njime možete upravljati i putem `collie` CLI-ja. To je osobito korisno kada AI agent radi s vama na prilagodbi ili konfiguraciji.

CLI ima pristup svim internim alatima koji se koriste i putem izbornika i na druge načine. Sve što je dostupno možete vidjeti pokretanjem naredbe `collie` u terminalu.

Izgleda otprilike ovako:

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

A možete i dublje zaroniti u svaku skupinu:

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

Svaka naredba također prihvaća `--help`, bilo da pitate cijelu skupinu (`collie capture --help`) ili jednu naredbu (`collie capture screenshot --help`).

### Otvaranje izbornika iz terminala

Collie izbornik također se može skriptirati, što je zgodno za vlastite tipkovničke prečace. `collie menu` otvara ga na korijenu, a možete skočiti izravno na bilo koju točku u stablu navodeći je: `collie menu summon appearance.theme` vodi ravno na birač tema, `collie menu toggle system` otvara izbornik sustava i ponovno ga zatvara ako je već otvoren, a `collie menu close` ga uklanja.
