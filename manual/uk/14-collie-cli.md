# Collie CLI

Collie зазвичай керують за допомогою гарячих клавіш і меню Collie (`Super + Space`). Але керувати нею можна також через CLI `collie`. Це особливо корисно, коли агент ШІ працює з вами над кастомізацією чи конфігурацією.

CLI має доступ до всіх внутрішніх інструментів, які використовуються як через меню, так і в інший спосіб. Ви можете побачити все доступне, запустивши `collie` у терміналі.

Виглядає це приблизно так:

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

І ви можете заглибитися в кожну групу:

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

Кожна команда також приймає `--help`, незалежно від того, чи запитуєте ви цілу групу (`collie capture --help`), чи окрему команду (`collie capture screenshot --help`).

### Відкриття меню з термінала

Меню Collie також можна скриптувати, що зручно для ваших власних прив'язок клавіш. `collie menu` відкриває його в корені, і ви можете переходити прямо до будь-якої точки дерева, назвавши її: `collie menu summon appearance.theme` веде прямо до вибору теми, `collie menu toggle system` відкриває системне меню і знову закриває його, якщо воно вже відкрите, а `collie menu close` прибирає його.
