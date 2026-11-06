# Collie CLI

Collie paprastai valdoma sparčiaisiais klavišais ir Collie meniu (`Super + Space`). Tačiau ją taip pat galima valdyti per `collie` CLI. Tai ypač naudinga, kai kartu su jumis pritaikymo ar konfigūravimo darbus atlieka AI agentas.

CLI turi prieigą prie visų vidinių įrankių, kurie naudojami tiek per meniu, tiek kitais būdais. Viską, kas prieinama, galite pamatyti terminale paleidę `collie`.

Tai atrodo maždaug taip:

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

Ir galite gilintis į kiekvieną grupę:

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

Kiekviena komanda taip pat priima `--help`, nesvarbu, ar klausiate visos grupės (`collie capture --help`), ar vienos komandos (`collie capture screenshot --help`).

### Meniu atidarymas iš terminalo

Collie meniu taip pat galima valdyti scenarijais, o tai patogu jūsų pačių klavišų susiejimams. `collie menu` atidaro jį nuo šaknies, o jūs galite pereiti tiesiai į bet kurią medžio vietą ją įvardydami: `collie menu summon appearance.theme` nukelia tiesiai į temų pasirinkimą, `collie menu toggle system` atidaro sistemos meniu ir vėl jį uždaro, jei jis jau atidarytas, o `collie menu close` jį paslepia.
