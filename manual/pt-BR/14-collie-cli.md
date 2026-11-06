# Collie CLI

O Collie geralmente é controlado pelas teclas de atalho e pelo menu do Collie (`Super + Space`). Mas você também pode controlá-lo pela CLI `collie`. Isso é particularmente útil quando você tem um agente de IA trabalhando com você na personalização ou na configuração.

A CLI tem acesso a todas as ferramentas internas usadas tanto pelo menu quanto de outras formas. Você pode ver tudo o que está disponível executando `collie` no terminal.

Ela se parece com algo assim:

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

E você pode se aprofundar em cada grupo:

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

Todo comando também aceita `--help`, seja ao consultar um grupo inteiro (`collie capture --help`) ou um único comando (`collie capture screenshot --help`).

### Abrindo o menu pelo terminal

O menu do Collie também pode ser controlado por script, o que é útil para os seus próprios atalhos de teclado. `collie menu` o abre na raiz, e você pode ir direto para qualquer ponto da árvore ao nomeá-lo: `collie menu summon appearance.theme` vai direto para o seletor de temas, `collie menu toggle system` abre o menu do sistema e o fecha novamente se ele já estiver aberto, e `collie menu close` o fecha.
