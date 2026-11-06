# Collie CLI

عادةً ما يتم التحكّم في Collie عبر مفاتيح الاختصار وقائمة Collie ‏(`Super + Space`). لكن يمكنك أيضًا التحكّم فيه عبر واجهة سطر الأوامر `collie` CLI. وهذا مفيد بشكل خاص عندما تجعل وكيل ذكاء اصطناعي يعمل معك على التخصيص أو الإعداد.

تتمتّع واجهة سطر الأوامر بإمكانية الوصول إلى جميع الأدوات الداخلية المستخدمة سواء عبر القائمة أو بغير ذلك. يمكنك رؤية كل ما هو متاح بتشغيل `collie` في الطرفية.

يبدو الأمر على نحو شبيه بهذا:

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

ويمكنك التعمّق أكثر في كل مجموعة:

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

يقبل كل أمر أيضًا `--help`، سواء طلبت مجموعة كاملة (`collie capture --help`) أو أمرًا واحدًا (`collie capture screenshot --help`).

### فتح القائمة من الطرفية

قائمة Collie قابلة للبرمجة النصية أيضًا، وهو أمر مفيد لاختصارات لوحة المفاتيح الخاصة بك. يفتح `collie menu` القائمة من الجذر، ويمكنك الانتقال مباشرة إلى أي نقطة في الشجرة بتسميتها: ينقلك `collie menu summon appearance.theme` مباشرة إلى منتقي السمات، ويفتح `collie menu toggle system` قائمة النظام ويغلقها مجددًا إذا كانت مفتوحة بالفعل، ويغلق `collie menu close` القائمة ويخفيها.
