# Collie CLI

Collie обикновено се управлява чрез клавишните комбинации и менюто на Collie (`Super + Space`). Но можете да го управлявате и чрез `collie` CLI. Това е особено полезно, когато AI агент работи с вас по персонализиране или конфигуриране.

CLI има достъп до всички вътрешни инструменти, които се използват както чрез менюто, така и по друг начин. Можете да видите всичко налично, като изпълните `collie` в терминала.

Изглежда приблизително така:

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

И можете да навлезете по-дълбоко във всяка група:

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

Всяка команда приема и `--help`, независимо дали питате цяла група (`collie capture --help`) или отделна команда (`collie capture screenshot --help`).

### Отваряне на менюто от терминала

Менюто на Collie също може да се скриптира, което е удобно за вашите собствени клавишни комбинации. `collie menu` го отваря в основата, а можете да прескочите директно до всяка точка от дървото, като я назовете: `collie menu summon appearance.theme` отива директно до избора на тема, `collie menu toggle system` отваря системното меню и го затваря отново, ако вече е отворено, а `collie menu close` го прибира.
