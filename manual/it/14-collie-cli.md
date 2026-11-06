# Collie CLI

Collie viene di solito controllato tramite i tasti di scelta rapida e il menu di Collie (`Super + Space`). Ma puoi controllarlo anche tramite la CLI `collie`. Questo è particolarmente utile quando fai lavorare un agente AI insieme a te sulla personalizzazione o sulla configurazione.

La CLI ha accesso a tutta la strumentazione interna usata sia tramite il menu sia in altro modo. Puoi vedere tutto ciò che è disponibile eseguendo `collie` nel terminale.

Ha un aspetto simile a questo:

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

E puoi approfondire ogni singolo gruppo:

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

Ogni comando accetta anche `--help`, sia che tu lo chieda a un intero gruppo (`collie capture --help`) sia a un singolo comando (`collie capture screenshot --help`).

### Aprire il menu dal terminale

Il menu di Collie è anche scriptabile, il che è comodo per le tue associazioni di tasti personalizzate. `collie menu` lo apre alla radice, e puoi saltare direttamente a qualsiasi punto dell'albero nominandolo: `collie menu summon appearance.theme` va dritto al selettore del tema, `collie menu toggle system` apre il menu di sistema e lo richiude se è già aperto, e `collie menu close` lo mette via.
