# Collie CLI

Collie er venjulega stjórnað með flýtilyklunum og Collie-valmyndinni (`Super + Space`). En þú getur líka stjórnað því gegnum `collie` CLI. Þetta er sérstaklega gagnlegt þegar þú ert að hafa AI agent að vinna með þér að sérstillingum eða uppsetningu.

CLI hefur aðgang að öllum innri verkfærunum sem eru notuð bæði gegnum valmyndina og annars staðar. Þú getur séð allt sem er í boði með því að keyra `collie` í terminal.

Það lítur einhvern veginn svona út:

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

Og þú getur kafað dýpra í hvern hóp:

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

Sérhver skipun tekur líka `--help`, hvort sem þú spyrð heilan hóp (`collie capture --help`) eða eina skipun (`collie capture screenshot --help`).

### Að opna valmyndina úr terminal

Það er líka hægt að stýra Collie-valmyndinni með forskriftum, sem er þægilegt fyrir þína eigin flýtilykla. `collie menu` opnar hana við rótina og þú getur hoppað beint að hvaða stað sem er í trénu með því að nefna hann: `collie menu summon appearance.theme` fer beint í þemavalið, `collie menu toggle system` opnar kerfisvalmyndina og lokar henni aftur ef hún er þegar opin og `collie menu close` leggur hana í burtu.
