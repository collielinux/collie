# Collie CLI

Collie thường được điều khiển qua các phím tắt và menu Collie (`Super + Space`). Nhưng bạn cũng có thể điều khiển nó qua CLI `collie`. Điều này đặc biệt hữu ích khi bạn đang để một AI agent làm việc cùng bạn về tùy chỉnh hoặc cấu hình.

CLI có quyền truy cập vào toàn bộ công cụ nội bộ được dùng cả qua menu lẫn theo các cách khác. Bạn có thể thấy mọi thứ có sẵn bằng cách chạy `collie` trong terminal.

Nó trông đại khái như thế này:

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

Và bạn có thể đi sâu hơn vào từng nhóm:

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

Mọi lệnh cũng đều nhận `--help`, dù bạn hỏi cả một nhóm (`collie capture --help`) hay một lệnh đơn lẻ (`collie capture screenshot --help`).

### Mở menu từ terminal

Menu Collie cũng có thể được điều khiển bằng script, điều này rất tiện cho các keybinding của riêng bạn. `collie menu` mở nó ở cấp gốc, và bạn có thể nhảy thẳng đến bất kỳ điểm nào trong cây bằng cách gọi tên nó: `collie menu summon appearance.theme` đi thẳng đến trình chọn theme, `collie menu toggle system` mở menu hệ thống và đóng lại nếu nó đang mở, và `collie menu close` đóng nó đi.
