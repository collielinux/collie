# Collie CLI

O Collie é normalmente controlado através das teclas de atalho e do menu Collie (`Super + Space`). Mas também pode controlá-lo através da CLI `collie`. Isto é particularmente útil quando tem um agente de IA a trabalhar consigo na personalização ou na configuração.

A CLI tem acesso a todas as ferramentas internas utilizadas tanto através do menu como de outras formas. Pode ver tudo o que está disponível executando `collie` no terminal.

Tem um aspeto semelhante a este:

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

E pode aprofundar cada grupo:

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

Todos os comandos também aceitam `--help`, quer pergunte a um grupo inteiro (`collie capture --help`) quer a um único comando (`collie capture screenshot --help`).

### Abrir o menu a partir do terminal

O menu Collie também pode ser controlado por script, o que é útil para os seus próprios atalhos de teclado. `collie menu` abre-o na raiz, e pode saltar diretamente para qualquer ponto da árvore indicando o respetivo nome: `collie menu summon appearance.theme` vai diretamente para o seletor de temas, `collie menu toggle system` abre o menu do sistema e volta a fechá-lo se já estiver aberto, e `collie menu close` fecha-o.
