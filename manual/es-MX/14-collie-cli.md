# Collie CLI

Normalmente, Collie se controla mediante las teclas de acceso rápido y el menú de Collie (`Super + Space`). Pero también puedes controlarlo mediante la CLI `collie`. Esto es especialmente útil cuando tienes a un agente de IA trabajando contigo en la personalización o la configuración.

La CLI tiene acceso a todas las herramientas internas que se usan tanto desde el menú como por otros medios. Puedes ver todo lo que está disponible ejecutando `collie` en la terminal.

Se ve más o menos así:

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

Y puedes profundizar en cada grupo:

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

Todo comando también admite `--help`, ya sea que consultes un grupo completo (`collie capture --help`) o un solo comando (`collie capture screenshot --help`).

### Abrir el menú desde la terminal

El menú de Collie también se puede controlar mediante comandos, lo que viene bien para tus propios atajos de teclado. `collie menu` lo abre en la raíz, y puedes saltar directamente a cualquier punto del árbol nombrándolo: `collie menu summon appearance.theme` va directo al selector de temas, `collie menu toggle system` abre el menú del sistema y lo vuelve a cerrar si ya está abierto, y `collie menu close` lo oculta.
