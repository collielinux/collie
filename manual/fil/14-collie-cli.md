# Collie CLI

Karaniwang kinokontrol ang Collie sa pamamagitan ng mga hotkey at ng menu ng Collie (`Super + Space`). Ngunit maaari mo rin itong kontrolin sa pamamagitan ng `collie` CLI. Partikular itong nakakatulong kapag may AI agent kang katrabaho sa pag-customize o pag-configure.

May access ang CLI sa lahat ng internal tooling na ginagamit kapwa sa pamamagitan ng menu at sa iba pang paraan. Makikita mo ang lahat ng available sa pagpapatakbo ng `collie` sa terminal.

Ganito ang hitsura nito nang halos:

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

At maaari kang sumisid nang mas malalim sa bawat grupo:

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

Tumatanggap din ang bawat command ng `--help`, tanungin mo man ang buong grupo (`collie capture --help`) o isang command lang (`collie capture screenshot --help`).

### Pagbubukas ng menu mula sa terminal

Maaari ring i-script ang menu ng Collie, na madaling gamitin para sa sarili mong mga keybinding. Binubuksan ito ng `collie menu` sa root, at maaari kang dumiretso sa anumang punto sa tree sa pagbanggit nito: dumidiretso ang `collie menu summon appearance.theme` sa theme picker, binubuksan ng `collie menu toggle system` ang system menu at isinasara itong muli kung nakabukas na ito, at itinatago ito ng `collie menu close`.
