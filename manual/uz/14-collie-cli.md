# Collie CLI

Collie odatda tezkor tugmalar va Collie menyusi (`Super + Space`) orqali boshqariladi. Lekin uni `collie` CLI orqali ham boshqarishingiz mumkin. Bu, ayniqsa, moslashtirish yoki konfiguratsiya ustida siz bilan birga AI agent ishlayotganda juda qo‘l keladi.

CLI menyu orqali ham, boshqa yo‘llar bilan ham ishlatiladigan barcha ichki vositalarga kirish imkoniga ega. Mavjud barcha narsani terminalda `collie` ni ishga tushirib ko‘rishingiz mumkin.

Bu taxminan shunday ko‘rinadi:

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

Va har bir guruhga yanada chuqurroq kirishingiz mumkin:

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

Har bir buyruq `--help` ni ham qabul qiladi, xoh butun guruhni so‘rasangiz (`collie capture --help`), xoh bitta buyruqni so‘rasangiz (`collie capture screenshot --help`).

### Menyuni terminaldan ochish

Collie menyusini skript orqali ham boshqarish mumkin, bu o‘z tugmalar birikmalaringiz uchun qulay. `collie menu` uni ildizidan ochadi va uni nomlash orqali daraxtning istalgan nuqtasiga to‘g‘ridan-to‘g‘ri o‘tishingiz mumkin: `collie menu summon appearance.theme` to‘g‘ridan-to‘g‘ri mavzu tanlagichga o‘tadi, `collie menu toggle system` tizim menyusini ochadi va agar u allaqachon ochiq bo‘lsa, uni yana yopadi, `collie menu close` esa uni yopib qo‘yadi.
