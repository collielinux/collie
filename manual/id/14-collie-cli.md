# Collie CLI

Collie biasanya dikendalikan melalui hotkey dan menu Collie (`Super + Space`). Tapi kamu juga bisa mengendalikannya melalui CLI `collie`. Ini sangat membantu saat kamu meminta agen AI bekerja bersamamu dalam kustomisasi atau konfigurasi.

CLI ini punya akses ke semua perkakas internal yang digunakan baik melalui menu maupun cara lain. Kamu bisa melihat semua yang tersedia dengan menjalankan `collie` di terminal.

Tampilannya kurang lebih seperti ini:

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

Dan kamu bisa menyelami setiap grup lebih dalam:

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

Setiap perintah juga menerima `--help`, baik saat kamu menanyakan seluruh grup (`collie capture --help`) maupun satu perintah saja (`collie capture screenshot --help`).

### Membuka menu dari terminal

Menu Collie juga bisa diskrip, yang berguna untuk keybinding kamu sendiri. `collie menu` membukanya di root, dan kamu bisa langsung lompat ke titik mana pun di pohonnya dengan menyebut namanya: `collie menu summon appearance.theme` langsung menuju pemilih tema, `collie menu toggle system` membuka menu sistem dan menutupnya lagi jika sudah terbuka, dan `collie menu close` menyingkirkannya.
