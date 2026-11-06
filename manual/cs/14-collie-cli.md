# Collie CLI

Collie se obvykle ovládá pomocí klávesových zkratek a menu Collie (`Super + Space`). Ovládat ho ale můžete i prostřednictvím CLI `collie`. To se hodí zejména tehdy, když s vámi na úpravách nebo konfiguraci pracuje AI agent.

CLI má přístup ke všem interním nástrojům, které se používají jak přes menu, tak i jinak. Vše, co je k dispozici, uvidíte po spuštění `collie` v terminálu.

Vypadá to nějak takto:

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

A u každé skupiny můžete jít ještě hlouběji:

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

Každý příkaz přijímá i `--help`, ať už se zeptáte celé skupiny (`collie capture --help`), nebo jednoho příkazu (`collie capture screenshot --help`).

### Otevření menu z terminálu

Menu Collie lze ovládat i skriptem, což se hodí pro vaše vlastní klávesové zkratky. `collie menu` ho otevře na kořenové úrovni a pojmenováním můžete skočit rovnou na libovolné místo ve stromu: `collie menu summon appearance.theme` přejde přímo do výběru motivu, `collie menu toggle system` otevře systémové menu a zase ho zavře, pokud už je otevřené, a `collie menu close` ho schová.
