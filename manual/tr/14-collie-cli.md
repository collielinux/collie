# Collie CLI

Collie genellikle kısayol tuşları ve Collie menüsü (`Super + Space`) aracılığıyla kontrol edilir. Ancak onu `collie` CLI aracılığıyla da kontrol edebilirsiniz. Bu, özellikle bir AI agent ile birlikte özelleştirme veya yapılandırma üzerinde çalışırken faydalıdır.

CLI, hem menü aracılığıyla hem de başka yollarla kullanılan tüm dahili araçlara erişebilir. Terminalde `collie` çalıştırarak mevcut olan her şeyi görebilirsiniz.

Görünümü aşağı yukarı şöyledir:

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

Ve her grubun derinliklerine de inebilirsiniz:

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

Her komut `--help` de kabul eder; ister bütün bir grubu (`collie capture --help`) ister tek bir komutu (`collie capture screenshot --help`) sorgulayın.

### Terminalden menüyü açma

Collie menüsü de scriptlenebilir; bu, kendi tuş atamalarınız için kullanışlıdır. `collie menu` onu kök düzeyde açar ve adını belirterek ağacın herhangi bir noktasına doğrudan atlayabilirsiniz: `collie menu summon appearance.theme` doğrudan tema seçiciye gider, `collie menu toggle system` sistem menüsünü açar ve zaten açıksa tekrar kapatır, `collie menu close` ise onu ortadan kaldırır.
