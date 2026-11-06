# Collie CLI

Collie biasanya dikawal melalui kekunci pintas dan menu Collie (`Super + Space`). Tetapi anda juga boleh mengawalnya melalui CLI `collie`. Ini amat membantu apabila anda meminta ejen AI bekerjasama dengan anda untuk penyesuaian atau konfigurasi.

CLI ini mempunyai akses kepada semua perkakas dalaman yang digunakan melalui menu dan juga sebaliknya. Anda boleh melihat semua yang tersedia dengan menjalankan `collie` dalam terminal.

Ia kelihatan lebih kurang seperti ini:

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

Dan anda boleh menyelami setiap kumpulan dengan lebih mendalam:

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

Setiap arahan juga menerima `--help`, sama ada anda bertanya kepada keseluruhan kumpulan (`collie capture --help`) atau satu arahan sahaja (`collie capture screenshot --help`).

### Membuka menu dari terminal

Menu Collie juga boleh diskrip, yang berguna untuk ikatan kekunci anda sendiri. `collie menu` membukanya pada peringkat akar, dan anda boleh melompat terus ke mana-mana titik dalam pepohon dengan menamakannya: `collie menu summon appearance.theme` terus pergi ke pemilih tema, `collie menu toggle system` membuka menu sistem dan menutupnya semula jika ia sudah terbuka, dan `collie menu close` menyimpannya.
