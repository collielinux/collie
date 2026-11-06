# Collie CLI

Collie को आमतौर पर हॉटकीज़ और Collie मेनू (`Super + Space`) के ज़रिए नियंत्रित किया जाता है। लेकिन आप इसे `collie` CLI के ज़रिए भी नियंत्रित कर सकते हैं। यह खास तौर पर तब उपयोगी होता है जब आप किसी AI agent से अपने साथ कस्टमाइज़ेशन या कॉन्फ़िगरेशन पर काम करवा रहे हों।

CLI के पास उस सारी आंतरिक टूलिंग तक पहुँच है जिसका इस्तेमाल मेनू के ज़रिए और अन्य तरीकों से भी किया जाता है। टर्मिनल में `collie` चलाकर आप देख सकते हैं कि क्या-क्या उपलब्ध है।

यह कुछ इस तरह दिखता है:

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

और आप हर ग्रुप में और गहराई तक जा सकते हैं:

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

हर कमांड `--help` भी लेता है, चाहे आप पूरा ग्रुप पूछें (`collie capture --help`) या कोई एक कमांड (`collie capture screenshot --help`)।

### टर्मिनल से मेनू खोलना

Collie मेनू भी स्क्रिप्टेबल है, जो आपकी अपनी कीबाइंडिंग के लिए उपयोगी है। `collie menu` इसे रूट पर खोलता है, और आप इसका नाम बताकर ट्री के किसी भी बिंदु पर सीधे जा सकते हैं: `collie menu summon appearance.theme` सीधे थीम पिकर पर जाता है, `collie menu toggle system` सिस्टम मेनू खोलता है और अगर यह पहले से खुला हो तो इसे फिर से बंद कर देता है, और `collie menu close` इसे हटा देता है।
