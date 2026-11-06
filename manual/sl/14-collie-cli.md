# Collie CLI

Collie se običajno upravlja prek bližnjičnih tipk in menija Collie (`Super + Space`). Lahko pa ga upravljate tudi prek CLI-ja `collie`. To je še posebej uporabno, ko z vami pri prilagajanju ali konfiguriranju sodeluje agent umetne inteligence.

CLI ima dostop do vseh notranjih orodij, ki se uporabljajo tako prek menija kot tudi sicer. Vse, kar je na voljo, si lahko ogledate tako, da v terminalu zaženete `collie`.

Videti je približno tako:

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

V vsako skupino pa se lahko poglobite še bolj:

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

Tudi vsak ukaz sprejema `--help`, ne glede na to, ali vprašate celotno skupino (`collie capture --help`) ali posamezen ukaz (`collie capture screenshot --help`).

### Odpiranje menija iz terminala

Meni Collie je mogoče tudi skriptirati, kar je priročno za vaše lastne bližnjice na tipkovnici. `collie menu` ga odpre v korenu, na katero koli točko v drevesu pa lahko skočite neposredno tako, da jo imenujete: `collie menu summon appearance.theme` gre naravnost do izbirnika tem, `collie menu toggle system` odpre sistemski meni in ga znova zapre, če je že odprt, `collie menu close` pa ga pospravi.
