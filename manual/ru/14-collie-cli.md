# Collie CLI

Collie обычно управляется через горячие клавиши и меню Collie (`Super + Space`). Но им также можно управлять через `collie` CLI. Это особенно полезно, когда вы работаете с AI-агентом над кастомизацией или конфигурацией.

CLI имеет доступ ко всему внутреннему инструментарию, который используется как через меню, так и иным образом. Вы можете увидеть всё, что доступно, запустив `collie` в терминале.

Выглядит это примерно так:

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

И по каждой группе можно углубиться:

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

Каждая команда тоже принимает `--help`, независимо от того, спрашиваете ли вы целую группу (`collie capture --help`) или отдельную команду (`collie capture screenshot --help`).

### Открытие меню из терминала

Меню Collie также можно вызывать из скриптов, что удобно для ваших собственных привязок клавиш. `collie menu` открывает его в корне, и вы можете перейти сразу к любому пункту дерева, назвав его: `collie menu summon appearance.theme` сразу переходит к выбору темы, `collie menu toggle system` открывает системное меню и снова закрывает его, если оно уже открыто, а `collie menu close` убирает его.
