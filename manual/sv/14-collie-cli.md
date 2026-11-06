# Collie CLI

Collie styrs vanligtvis via snabbtangenterna och Collie-menyn (`Super + Space`). Men du kan också styra det via `collie` CLI. Det är särskilt hjälpsamt när du låter en AI-agent arbeta tillsammans med dig med anpassning eller konfiguration.

CLI:t har tillgång till alla interna verktyg som används både via menyn och på andra sätt. Du kan se allt som finns tillgängligt genom att köra `collie` i terminalen.

Det ser ut ungefär så här:

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

Och du kan gå djupare i varje grupp:

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

Varje kommando tar också `--help`, vare sig du frågar om en hel grupp (`collie capture --help`) eller ett enda kommando (`collie capture screenshot --help`).

### Öppna menyn från terminalen

Collie-menyn går också att skripta, vilket är praktiskt för dina egna tangentbindningar. `collie menu` öppnar den vid roten, och du kan hoppa direkt till vilken punkt som helst i trädet genom att namnge den: `collie menu summon appearance.theme` går rakt till temaväljaren, `collie menu toggle system` öppnar systemmenyn och stänger den igen om den redan är uppe, och `collie menu close` stänger den.
