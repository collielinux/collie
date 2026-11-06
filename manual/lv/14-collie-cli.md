# Collie CLI

Collie parasti kontrolē ar karstajiem taustiņiem un Collie izvēlni (`Super + Space`). Bet to var kontrolēt arī ar `collie` CLI. Tas ir īpaši noderīgi, kad kopā ar tevi pie pielāgošanas vai konfigurēšanas strādā AI aģents.

CLI ir piekļuve visiem iekšējiem rīkiem, kas tiek izmantoti gan caur izvēlni, gan citādi. Visu pieejamo vari apskatīt, terminālī palaižot `collie`.

Tas izskatās apmēram šādi:

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

Un vari iedziļināties katrā grupā:

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

Katrai komandai ir arī `--help`, neatkarīgi no tā, vai jautā veselai grupai (`collie capture --help`) vai vienai komandai (`collie capture screenshot --help`).

### Izvēlnes atvēršana no termināļa

Collie izvēlne ir arī skriptējama, kas noder tavām paša taustiņu kombinācijām. `collie menu` to atver saknē, un vari pāriet tieši uz jebkuru vietu kokā, to nosaucot: `collie menu summon appearance.theme` aizved tieši uz motīvu izvēli, `collie menu toggle system` atver sistēmas izvēlni un aizver to atkal, ja tā jau ir atvērta, un `collie menu close` to aizver.
