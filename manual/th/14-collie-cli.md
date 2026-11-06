# Collie CLI

โดยปกติแล้ว Collie จะควบคุมผ่านปุ่มลัดและเมนู Collie (`Super + Space`) แต่คุณก็ควบคุมมันผ่าน `collie` CLI ได้เช่นกัน วิธีนี้มีประโยชน์เป็นพิเศษเมื่อคุณให้ AI agent มาช่วยปรับแต่งหรือตั้งค่าต่าง ๆ ไปพร้อมกับคุณ

CLI เข้าถึงเครื่องมือภายในทั้งหมดที่ใช้ทั้งผ่านเมนูและช่องทางอื่น ๆ ได้ คุณดูทุกอย่างที่มีให้ใช้ได้ด้วยการรัน `collie` ในเทอร์มินัล

หน้าตาของมันจะเป็นประมาณนี้:

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

และคุณยังเจาะลึกลงไปได้ในทุกกลุ่ม:

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

ทุกคำสั่งยังใช้ `--help` ได้เช่นกัน ไม่ว่าคุณจะถามทั้งกลุ่ม (`collie capture --help`) หรือถามคำสั่งเดียว (`collie capture screenshot --help`)

### การเปิดเมนูจากเทอร์มินัล

เมนู Collie ก็สั่งงานด้วยสคริปต์ได้เช่นกัน ซึ่งสะดวกมากสำหรับ keybindings ของคุณเอง `collie menu` จะเปิดเมนูที่จุดเริ่มต้น และคุณก็ข้ามตรงไปยังจุดใดก็ได้ในโครงสร้างเมนูด้วยการระบุชื่อจุดนั้น: `collie menu summon appearance.theme` จะพาคุณตรงไปยังตัวเลือกธีมทันที `collie menu toggle system` จะเปิดเมนูระบบ และปิดมันอีกครั้งหากเปิดอยู่แล้ว และ `collie menu close` จะปิดเมนูทิ้งไป
