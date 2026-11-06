# Collie CLI

את Collie שולטים בדרך כלל דרך מקשי הקיצור והתפריט של Collie (`Super + Space`). אבל אפשר לשלוט בה גם דרך ה-CLI של `collie`. זה מועיל במיוחד כשסוכן AI עובד איתך על התאמה אישית או על תצורה.

ל-CLI יש גישה לכל הכלים הפנימיים שמשמשים גם דרך התפריט וגם בדרכים אחרות. אפשר לראות את כל מה שזמין על ידי הרצת `collie` בטרמינל.

זה נראה בערך ככה:

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

ואפשר לצלול עמוק יותר לכל קבוצה:

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

כל פקודה מקבלת גם `--help`, בין אם שואלים קבוצה שלמה (`collie capture --help`) או פקודה בודדת (`collie capture screenshot --help`).

### פתיחת התפריט מהטרמינל

גם בתפריט של Collie אפשר לשלוט באמצעות סקריפטים, וזה שימושי עבור מקשי הקיצור שלך. `collie menu` פותח אותו מהשורש, ואפשר לקפוץ ישר לכל נקודה בעץ על ידי ציון שמה: `collie menu summon appearance.theme` הולך ישר לבוחר ערכות הנושא, `collie menu toggle system` פותח את תפריט המערכת וסוגר אותו שוב אם הוא כבר פתוח, ו-`collie menu close` מסתיר אותו.
