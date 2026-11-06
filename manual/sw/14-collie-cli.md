# Collie CLI

Collie kwa kawaida hudhibitiwa kupitia njia za mkato za kibodi na menyu ya Collie (`Super + Space`). Lakini pia unaweza kuudhibiti kupitia CLI ya `collie`. Hii ni muhimu sana unapokuwa na agent ya AI inayofanya kazi pamoja nawe kwenye ubinafsishaji au usanidi.

CLI ina ufikiaji wa zana zote za ndani zinazotumika kupitia menyu na vinginevyo. Unaweza kuona kila kinachopatikana kwa kuendesha `collie` kwenye terminal.

Inaonekana kitu kama hiki:

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

Na unaweza kuchimba zaidi katika kila kikundi:

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

Kila amri pia inakubali `--help`, iwe unauliza kikundi kizima (`collie capture --help`) au amri moja (`collie capture screenshot --help`).

### Kufungua menyu kutoka kwenye terminal

Menyu ya Collie pia inaweza kuendeshwa kwa script, jambo ambalo ni muhimu kwa keybindings zako mwenyewe. `collie menu` huifungua katika mzizi, na unaweza kuruka moja kwa moja hadi sehemu yoyote kwenye mti kwa kuitaja: `collie menu summon appearance.theme` huenda moja kwa moja hadi kichaguzi cha mandhari, `collie menu toggle system` hufungua menyu ya mfumo na kuifunga tena ikiwa tayari iko wazi, na `collie menu close` huifunga.
