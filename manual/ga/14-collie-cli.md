# Collie CLI

Rialaítear Collie de ghnáth trí na heochracha aicearra agus trí roghchlár Collie (`Super + Space`). Ach is féidir leat é a rialú freisin tríd an CLI `collie`. Tá sé seo an-chabhrach go háirithe nuair a bhíonn gníomhaire AI ag obair in éineacht leat ar shaincheapadh nó ar chumraíocht.

Tá rochtain ag an CLI ar an uirlisiú inmheánach go léir a úsáidtear tríd an roghchlár agus ar bhealaí eile araon. Is féidir leat gach rud atá ar fáil a fheiceáil trí `collie` a rith sa teirminéal.

Breathnaíonn sé rud éigin mar seo:

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

Agus is féidir leat dul níos doimhne isteach i ngach grúpa:

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

Glacann gach ordú le `--help` freisin, cibé acu a iarrann tú grúpa iomlán (`collie capture --help`) nó ordú aonair (`collie capture screenshot --help`).

### An roghchlár a oscailt ón teirminéal

Is féidir roghchlár Collie a scripteáil freisin, rud atá áisiúil do do cheangail eochracha féin. Osclaíonn `collie menu` ag an bhfréamh é, agus is féidir leat léim díreach go dtí pointe ar bith sa chrann trína ainmniú: téann `collie menu summon appearance.theme` díreach chuig an roghnóir téama, osclaíonn `collie menu toggle system` an roghchlár córais agus dúnann sé arís é má tá sé aníos cheana, agus cuireann `collie menu close` ar shiúl é.
