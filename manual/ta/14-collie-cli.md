# Collie CLI

Collie பொதுவாக ஹாட்கீகள் மற்றும் Collie மெனு (`Super + Space`) வழியாகக் கட்டுப்படுத்தப்படுகிறது. ஆனால் `collie` CLI வழியாகவும் அதைக் கட்டுப்படுத்தலாம். தனிப்பயனாக்கம் அல்லது உள்ளமைவில் ஒரு AI agent உங்களுடன் இணைந்து பணியாற்றும்போது இது குறிப்பாகப் பயனுள்ளதாக இருக்கும்.

மெனு வழியாகவும் மற்றபடியும் பயன்படுத்தப்படும் அனைத்து உள் கருவிகளுக்கும் CLI அணுகலைக் கொண்டுள்ளது. டெர்மினலில் `collie` என இயக்குவதன் மூலம் கிடைக்கக்கூடிய அனைத்தையும் நீங்கள் காணலாம்.

இது இப்படி ஏதோ தோற்றமளிக்கும்:

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

மேலும் ஒவ்வொரு குழுவிலும் நீங்கள் ஆழமாகச் செல்லலாம்:

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

ஒட்டுமொத்த குழுவிடம் (`collie capture --help`) கேட்டாலும் சரி, ஒரே ஒரு கட்டளையிடம் (`collie capture screenshot --help`) கேட்டாலும் சரி, ஒவ்வொரு கட்டளையும் `--help` ஐயும் ஏற்கும்.

### டெர்மினலில் இருந்து மெனுவைத் திறத்தல்

Collie மெனுவையும் ஸ்கிரிப்ட் செய்யலாம்; உங்கள் சொந்த கீபைண்டிங்குகளுக்கு இது வசதியாக இருக்கும். `collie menu` அதை ரூட்டில் திறக்கும், மேலும் அதைப் பெயரிடுவதன் மூலம் மரத்தின் எந்தப் புள்ளிக்கும் நேரடியாகச் செல்லலாம்: `collie menu summon appearance.theme` நேராக தீம் பிக்கருக்குச் செல்கிறது, `collie menu toggle system` சிஸ்டம் மெனுவைத் திறக்கிறது, ஏற்கனவே அது திறந்திருந்தால் அதை மீண்டும் மூடுகிறது, மேலும் `collie menu close` அதை மூடி வைக்கிறது.
