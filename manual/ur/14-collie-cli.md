# Collie CLI

Collie کو عام طور پر hotkeys اور Collie menu (`Super + Space`) کے ذریعے کنٹرول کیا جاتا ہے۔ لیکن آپ اسے `collie` CLI کے ذریعے بھی کنٹرول کر سکتے ہیں۔ یہ خاص طور پر اس وقت مددگار ہوتا ہے جب آپ کسی AI agent سے customization یا configuration پر اپنے ساتھ کام کروا رہے ہوں۔

CLI کو ان تمام internal tooling تک رسائی حاصل ہے جو menu کے ذریعے اور اس کے علاوہ بھی استعمال ہوتی ہیں۔ آپ terminal میں `collie` چلا کر ہر دستیاب چیز دیکھ سکتے ہیں۔

یہ کچھ اس طرح نظر آتا ہے:

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

اور آپ ہر group میں مزید گہرائی تک جا سکتے ہیں:

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

ہر command `--help` بھی لیتا ہے، چاہے آپ پورے group سے پوچھیں (`collie capture --help`) یا کسی ایک command سے (`collie capture screenshot --help`)۔

### Terminal سے menu کھولنا

Collie menu کو script بھی کیا جا سکتا ہے، جو آپ کی اپنی keybindings کے لیے کارآمد ہے۔ `collie menu` اسے root پر کھولتا ہے، اور آپ اس کا نام دے کر tree میں سیدھا کسی بھی مقام پر جا سکتے ہیں: `collie menu summon appearance.theme` سیدھا theme picker پر جاتا ہے، `collie menu toggle system` system menu کھولتا ہے اور اگر وہ پہلے سے کھلا ہو تو اسے پھر سے بند کر دیتا ہے، اور `collie menu close` اسے ہٹا دیتا ہے۔
