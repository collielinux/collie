# Collie CLI

Normalment, Collie es controla amb les tecles d'accés ràpid i el menú d'Collie (`Super + Space`). Però també el pots controlar amb la CLI `collie`. Això és especialment útil quan tens un agent d'IA treballant amb tu en la personalització o la configuració.

La CLI té accés a totes les eines internes que s'utilitzen tant des del menú com d'altres maneres. Pots veure tot el que hi ha disponible executant `collie` al terminal.

Té un aspecte semblant a aquest:

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

I pots aprofundir en cada grup:

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

Cada comanda també accepta `--help`, tant si preguntes per un grup sencer (`collie capture --help`) com per una sola comanda (`collie capture screenshot --help`).

### Obrir el menú des del terminal

El menú d'Collie també es pot controlar amb scripts, cosa que va molt bé per a les teves pròpies assignacions de tecles. `collie menu` l'obre a l'arrel, i pots anar directament a qualsevol punt de l'arbre anomenant-lo: `collie menu summon appearance.theme` va directe al selector de temes, `collie menu toggle system` obre el menú del sistema i el torna a tancar si ja és obert, i `collie menu close` el tanca.
