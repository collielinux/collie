# Collie CLI

Collie සාමාන්‍යයෙන් පාලනය කරනු ලබන්නේ hotkeys සහ Collie menu එක (`Super + Space`) හරහාය. නමුත් ඔබට එය `collie` CLI එක හරහා ද පාලනය කළ හැකිය. ඔබ අභිරුචිකරණය හෝ වින්‍යාසය පිළිබඳව AI agent කෙනෙකු සමඟ වැඩ කරන විට මෙය විශේෂයෙන්ම ප්‍රයෝජනවත් වේ.

CLI එකට menu එක හරහා සහ වෙනත් ආකාරවලින් භාවිතා වන සියලුම අභ්‍යන්තර මෙවලම් වෙත ප්‍රවේශය ඇත. terminal එක තුළ `collie` ධාවනය කිරීමෙන් ලබා ගත හැකි සියල්ල ඔබට දැක ගත හැකිය.

එය දිස්වන්නේ මෙවැනි ආකාරයකටය:

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

ඔබට සෑම group එකක්ම වඩාත් ගැඹුරින් ද බැලිය හැකිය:

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

ඔබ සම්පූර්ණ group එකක් (`collie capture --help`) හෝ තනි command එකක් (`collie capture screenshot --help`) ගැන ඇසුවත්, සෑම command එකක්ම `--help` ද ලබා ගනී.

### terminal එකෙන් menu එක විවෘත කිරීම

Collie menu එක script කළ හැකි අතර, එය ඔබේම keybindings සඳහා ප්‍රයෝජනවත් වේ. `collie menu` මඟින් එය root එකේ විවෘත වන අතර, ඔබට එහි නම සඳහන් කිරීමෙන් ගසේ ඕනෑම ස්ථානයකට කෙලින්ම යා හැකිය: `collie menu summon appearance.theme` මඟින් කෙලින්ම theme picker එක වෙත යයි, `collie menu toggle system` මඟින් system menu එක විවෘත වන අතර එය දැනටමත් විවෘතව තිබේ නම් නැවත එය වසා දමයි, තවද `collie menu close` මඟින් එය ඉවත් කරයි.
