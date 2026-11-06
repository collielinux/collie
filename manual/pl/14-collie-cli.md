# Collie CLI

Collie zwykle obsługuje się za pomocą skrótów klawiszowych i menu Collie (`Super + Space`). Można nią jednak sterować także przez CLI `collie`. Jest to szczególnie pomocne, gdy agent AI współpracuje z Tobą nad dostosowywaniem lub konfiguracją.

CLI ma dostęp do wszystkich wewnętrznych narzędzi używanych zarówno przez menu, jak i w inny sposób. Wszystko, co jest dostępne, zobaczysz po uruchomieniu `collie` w terminalu.

Wygląda to mniej więcej tak:

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

Możesz też zajrzeć głębiej do każdej grupy:

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

Każde polecenie przyjmuje też `--help`, niezależnie od tego, czy zapytasz o całą grupę (`collie capture --help`), czy o pojedyncze polecenie (`collie capture screenshot --help`).

### Otwieranie menu z terminala

Menu Collie można też obsługiwać skryptami, co przydaje się przy własnych skrótach klawiszowych. `collie menu` otwiera je na poziomie głównym, a podając nazwę, możesz przejść od razu do dowolnego miejsca w drzewie: `collie menu summon appearance.theme` prowadzi prosto do wyboru motywu, `collie menu toggle system` otwiera menu systemowe i zamyka je ponownie, jeśli jest już otwarte, a `collie menu close` je chowa.
