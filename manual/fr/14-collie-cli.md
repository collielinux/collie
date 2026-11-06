# Collie CLI

Collie se contrôle habituellement via les raccourcis clavier et le menu Collie (`Super + Space`). Mais vous pouvez aussi le contrôler via la CLI `collie`. C'est particulièrement utile lorsque vous faites travailler un agent IA avec vous sur la personnalisation ou la configuration.

La CLI a accès à tous les outils internes utilisés à la fois via le menu et autrement. Vous pouvez voir tout ce qui est disponible en exécutant `collie` dans le terminal.

Cela ressemble à quelque chose comme ceci :

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

Et vous pouvez explorer chaque groupe plus en détail :

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

Chaque commande accepte aussi `--help`, que vous interrogiez un groupe entier (`collie capture --help`) ou une seule commande (`collie capture screenshot --help`).

### Ouvrir le menu depuis le terminal

Le menu Collie est également scriptable, ce qui est pratique pour vos propres raccourcis clavier. `collie menu` l'ouvre à la racine, et vous pouvez sauter directement à n'importe quel point de l'arborescence en le nommant : `collie menu summon appearance.theme` va directement au sélecteur de thème, `collie menu toggle system` ouvre le menu système et le referme s'il est déjà affiché, et `collie menu close` le masque.
