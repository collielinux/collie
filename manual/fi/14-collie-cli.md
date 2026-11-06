# Collie CLI

Collieä käytetään yleensä pikanäppäimillä ja Collie-valikolla (`Super + Space`). Mutta voit hallita sitä myös `collie` CLI:n kautta. Tämä on erityisen hyödyllistä, kun työskentelet tekoälyagentin kanssa mukautusten tai määritysten parissa.

CLI:llä on pääsy kaikkiin sisäisiin työkaluihin, joita käytetään sekä valikon kautta että muuten. Näet kaiken saatavilla olevan ajamalla `collie` terminaalissa.

Se näyttää suunnilleen tältä:

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

Ja jokaiseen ryhmään voi sukeltaa syvemmälle:

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

Jokainen komento hyväksyy myös `--help`-vivun, kysyitpä sitä koko ryhmältä (`collie capture --help`) tai yksittäiseltä komennolta (`collie capture screenshot --help`).

### Valikon avaaminen terminaalista

Collie-valikko on myös skriptattavissa, mikä on kätevää omia näppäinsidoksiasi varten. `collie menu` avaa sen juuresta, ja voit hypätä suoraan mihin tahansa kohtaan puussa nimeämällä sen: `collie menu summon appearance.theme` menee suoraan teeman valitsimeen, `collie menu toggle system` avaa järjestelmävalikon ja sulkee sen uudelleen, jos se on jo auki, ja `collie menu close` sulkee sen.
