# Collie CLI

Collie معمولاً از طریق کلیدهای میانبر و منوی Collie (`Super + Space`) کنترل می‌شود. اما می‌توانید آن را از طریق CLI `collie` هم کنترل کنید. این به‌ویژه زمانی مفید است که یک عامل هوش مصنوعی را برای همکاری با خودتان در سفارشی‌سازی یا پیکربندی به کار می‌گیرید.

CLI به همه ابزارهای داخلی‌ای دسترسی دارد که هم از طریق منو و هم به روش‌های دیگر استفاده می‌شوند. با اجرای `collie` در ترمینال می‌توانید همه چیزهای در دسترس را ببینید.

چیزی شبیه این است:

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

و می‌توانید در هر گروه عمیق‌تر هم بشوید:

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

هر فرمان `--help` را هم می‌پذیرد، چه از یک گروه کامل بپرسید (`collie capture --help`) و چه از یک فرمان منفرد (`collie capture screenshot --help`).

### باز کردن منو از ترمینال

منوی Collie قابل اسکریپت‌نویسی هم هست، که برای میانبرهای صفحه‌کلید خودتان به کار می‌آید. `collie menu` آن را از ریشه باز می‌کند، و می‌توانید با نام بردن از آن مستقیم به هر نقطه‌ای از درخت بروید: `collie menu summon appearance.theme` مستقیم به انتخاب‌گر تم می‌رود، `collie menu toggle system` منوی سیستم را باز می‌کند و اگر از قبل باز باشد دوباره آن را می‌بندد، و `collie menu close` آن را کنار می‌گذارد.
