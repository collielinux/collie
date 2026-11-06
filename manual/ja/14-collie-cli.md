# Collie CLI

Collie は通常、ホットキーと Collie メニュー（`Super + Space`）で操作します。しかし、`collie` CLI からも操作できます。これは、AI エージェントにカスタマイズや設定を手伝ってもらうときに特に便利です。

CLI からは、メニュー経由などで使われている内部ツールのすべてにアクセスできます。利用可能なものはすべて、ターミナルで `collie` を実行すれば確認できます。

だいたいこんな感じです：

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

さらに、各グループについても詳しく見られます：

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

すべてのコマンドでも `--help` が使えます。グループ全体（`collie capture --help`）でも、個別のコマンド（`collie capture screenshot --help`）でも同様です。

### ターミナルからメニューを開く

Collie メニューはスクリプトからも操作でき、独自のキーバインドを作るときに便利です。`collie menu` でルートから開きます。名前を指定すれば、ツリー内の任意の場所へ直接移動できます：`collie menu summon appearance.theme` はテーマピッカーへ直行し、`collie menu toggle system` はシステムメニューを開き、すでに開いている場合は閉じます。`collie menu close` で閉じます。
