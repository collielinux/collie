# Collie CLI

Collie sa zvyčajne ovláda pomocou klávesových skratiek a ponuky Collie (`Super + Space`). Môžete ho však ovládať aj cez `collie` CLI. To je obzvlášť užitočné, keď s vami na prispôsobení alebo konfigurácii spolupracuje AI agent.

CLI má prístup ku všetkým interným nástrojom, ktoré sa používajú cez ponuku aj inak. Všetko, čo je k dispozícii, si môžete pozrieť spustením príkazu `collie` v termináli.

Vyzerá to približne takto:

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

A do každej skupiny sa môžete ponoriť hlbšie:

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

Každý príkaz podporuje aj `--help`, či už sa pýtate na celú skupinu (`collie capture --help`) alebo na jeden príkaz (`collie capture screenshot --help`).

### Otvorenie ponuky z terminálu

Ponuka Collie sa dá ovládať aj skriptami, čo sa hodí pre vaše vlastné klávesové skratky. Príkaz `collie menu` ju otvorí v koreňovom zobrazení a pomenovaním môžete prejsť rovno na ľubovoľné miesto v strome: `collie menu summon appearance.theme` prejde priamo do výberu témy, `collie menu toggle system` otvorí systémovú ponuku a znova ju zatvorí, ak už je otvorená, a `collie menu close` ju skryje.
