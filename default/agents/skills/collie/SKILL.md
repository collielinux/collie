---
name: collie
description: >
  REQUIRED for end-user customization of Linux desktop, window manager, or system config.
  Use when editing ANY file in ~/.config/, ~/.config/hypr/, ~/.config/collie/,
  ~/.config/alacritty/, ~/.config/foot/, ~/.config/kitty/, or ~/.config/ghostty/.
  Triggers: Hyprland, window rules, window behavior, animations, keybindings, monitors, gaps, borders,
  blur, opacity, collie-shell, bar, widgets, terminal config, themes, fonts, background,
  night light, idle, lock screen, screenshots, screen recording, reminders, layer rules, workspace
  settings, display config, appearance changes, and user-facing collie commands. Excludes Collie
  source development through `collie dev link` workflows.
---

# Collie Skill

Manage [Collie](https://github.com/collielinux/collie) Linux systems - a beautiful, fun, agentic Arch Linux distribution with Hyprland.

This skill is for end-user customization on installed systems.
It is not for contributing to Collie source code.

## Topic Guides

Deeper instructions for common areas live next to this file. Read the
matching guide before starting:

- [`hyprland.md`](hyprland.md) - keybindings, monitors, window rules, and other Hyprland config
- [`plugins.md`](plugins.md) - the Collie shell: bar layout, widgets, plugins, idle behavior
- [`theming.md`](theming.md) - themes, backgrounds, and fonts
- [`hooks.md`](hooks.md) - automation hooks that run on system events
- [`capture.md`](capture.md) - screenshots, screen recordings, OCR text capture, and file sharing
- [`contributing.md`](contributing.md) - reporting Collie bugs and submitting fixes upstream

## Critical Safety Rules

For privileged commands, follow the Privilege Escalation rules below: `sudo` when a terminal is available for the password prompt, `pkexec` when it is not. Do not wrap commands that already manage privilege elevation themselves.

**For end-user customization tasks, NEVER modify anything in `/usr/share/collie/`** - but READING is safe and encouraged.

This directory is owned by the collie package. Any local changes will be
overwritten on the next `collie update`.

```
/usr/share/collie/     # READ-ONLY - NEVER EDIT (reading is OK)
├── bin/                    # Command source (packaged binaries are on PATH)
├── config/                 # Default config templates
├── themes/                 # Stock themes
├── default/                # System defaults
├── shell/                  # Collie shell source and defaults
├── migrations/             # Update migrations
└── install/                # Installation scripts
```

**Reading `/usr/share/collie/` is SAFE and useful** - do it freely to:
- Understand how collie commands work: `collie theme set --help` or `cat $(which collie-theme-set)`
- See default configs before customizing: `cat "$COLLIE_PATH/config/collie/shell.json"`
- Check stock theme files to copy for customization
- Reference default hyprland settings: `cat /usr/share/collie/default/hypr/*`

**Always use these safe locations instead:**
- `~/.config/` - User configuration (safe to edit)
- `~/.config/collie/themes/<custom-name>/` - Custom themes
- `~/.config/collie/hooks/` - Custom automation hooks

If the request is to develop Collie itself, this skill is out of scope. Follow repository development instructions instead of this skill.

## Privilege Escalation

For an interactive script or command run in a visible terminal, use `sudo` for
privileged work. Collie may grant passwordless `sudo` access to particular
commands, and the terminal is the appropriate place to request a password
when one is needed.

Use `pkexec` only when the caller cannot interact with a terminal or cannot
enter a password there, such as a command launched by an agent or a graphical
background process. Do not replace `sudo` with `pkexec` merely because a
command changes system state.

## System Architecture

Collie is built on:

| Component | Purpose | Config Location |
|-----------|---------|-----------------|
| **Arch Linux** | Base OS | `/etc/`, `~/.config/` |
| **Hyprland** | Wayland compositor/WM | `~/.config/hypr/` |
| **Collie shell** | Status bar + notifications (Quickshell) | `~/.config/collie/shell.json` |
| **Launcher/menus** | Quickshell menu | `~/.config/collie/extensions/collie-menu.jsonc` |
| **Alacritty/Foot/Kitty/Ghostty** | Terminals | `~/.config/<terminal>/` |
| **Collie OSD** | On-screen display | Quickshell plugin |

## Command Discovery

Collie ships a single `collie` CLI that dispatches to all `collie-*` binaries via `collie <group> <action>`. Always prefer this form — it is self-documenting and stable. The underlying `collie-*` binaries still exist on `PATH` and remain safe to read for source.

```bash
# List every documented command and its summary (--all includes hidden commands)
collie commands

# Show the commands inside a group
collie theme --help
collie refresh --help
collie restart --help

# Show help for a specific command (does not execute it)
collie theme set --help

# Machine-readable listing (binary, route, summary, args, aliases)
collie commands --json

# Read a command's source to understand it
cat $(which collie-theme-set)
```

### Command Groups

Run `collie --help` for the full list. The most common groups:

| Group | Purpose | Example |
|-------|---------|---------|
| `collie refresh` | Reset config to defaults (backs up first) | `collie refresh shell` |
| `collie restart` | Restart a service/app | `collie restart shell` |
| `collie toggle` | Toggle feature on/off | `collie toggle nightlight` |
| `collie theme` | Theme management | `collie theme set <name>` |
| `collie bar` | Bar layout and widgets | `collie bar move collie.clock --section right` |
| `collie plugin` | Manage/clone shell plugins | `collie plugin clone collie.clock` |
| `collie hook` | Install automation hooks | `collie hook install theme-set <script>` |
| `collie install` | Install optional software / packages | `collie install docker dbs` |
| `collie launch` | Launch apps | `collie launch browser` |
| `collie capture` | Screenshots and recordings | `collie capture screenshot` |
| `collie reminder` | Desktop notification reminders | `collie reminder 15 "Pickup Jack"` |
| `collie pkg` | Package management | `collie pkg add <pkg>` |
| `collie setup` | Interactive setup wizards | `collie setup security fingerprint` |
| `collie update` | System updates | `collie update` |

## Configuration Locations

Hyprland config lives in `~/.config/hypr/` — see [`hyprland.md`](hyprland.md).
The Collie shell (bar, notifications, plugins, idle) is configured in
`~/.config/collie/shell.json` — see [`plugins.md`](plugins.md).

### Terminals

```
~/.config/alacritty/alacritty.toml
~/.config/foot/foot.ini
~/.config/kitty/kitty.conf
~/.config/ghostty/config
```

**Command:** `collie restart terminal`

### Other Configs

| App | Location |
|-----|----------|
| btop | `~/.config/btop/btop.conf` |
| fastfetch | `/etc/fastfetch/config.jsonc` default; `~/.config/fastfetch/config.jsonc` user override |
| lazygit | `~/.config/lazygit/config.yml` |
| starship | `~/.config/starship.toml` |
| git | `~/.config/git/config` |

## Safe Customization Patterns

### Edit User Config Directly

For simple changes, edit files in `~/.config/`:

```bash
# 1. Read current config
cat ~/.config/hypr/bindings.lua

# 2. Backup before changes
cp ~/.config/hypr/bindings.lua ~/.config/hypr/bindings.lua.bak.$(date +%s)

# 3. Make changes with Edit tool

# 4. Apply changes
# - Hyprland: auto-reloads on save, but MUST validate with `hyprctl reload` and `hyprctl configerrors`
# - Collie shell: shell.json and user plugin code under ~/.config/collie/plugins/ hot-reload on save
# - Menus/launcher: ~/.config/collie/extensions/collie-menu.jsonc hot-reloads on save
# - Terminals: apply with `collie restart terminal` (reloads running terminals; foot picks changes up in new windows)
```

### Reset to Defaults -- ALWAYS SEEK USER CONFIRMATION BEFORE RUNNING

When customizations go wrong:

```bash
# Reset specific config (creates backup automatically)
collie refresh shell
collie refresh hyprland

# The refresh command:
# 1. Backs up current config with timestamp
# 2. Copies default from $COLLIE_PATH/config/
# 3. Restarts the component where the refresh needs it (e.g. `refresh shell`)
```

## System Commands

```bash
collie update                  # Full system update
collie version                 # Show Collie version
collie debug --no-sudo --print # Debug info (ALWAYS use these flags)
collie system lock             # Lock screen
collie system shutdown         # Shutdown
collie system reboot           # Reboot
```

**IMPORTANT:** Always run `collie debug` with `--no-sudo --print` flags to avoid interactive sudo prompts that will hang the terminal.

## Troubleshooting

```bash
# Get debug information (ALWAYS use these flags to avoid interactive prompts)
collie debug --no-sudo --print

# Reset specific config to defaults
collie refresh <app>

# Refresh specific config file
# config-file path is relative to ~/.config/
# eg. `collie refresh config hypr/hyprland.lua` will refresh ~/.config/hypr/hyprland.lua
collie refresh config <config-file>

# Full reinstall of configs (nuclear option)
collie reinstall
```

## Decision Framework

When user requests system changes:

1. **Is it a stock collie command?** Use it directly
2. **Is it a config edit?** Edit in `~/.config/`, never `/usr/share/collie/`
3. **Is it a theme customization?** Follow [`theming.md`](theming.md); create a NEW custom theme directory
4. **Is it automation?** Follow [`hooks.md`](hooks.md); use `collie hook install` and the hook `.d` directories
5. **Is it a package install?** Use `collie pkg add <pkgs...>` (or `collie pkg aur add <pkgs...>` for AUR-only packages)
6. **Is it built-in shell/plugin code?** Follow [`plugins.md`](plugins.md); clone it with `collie plugin clone`, never edit the packaged copy
7. **Unsure if command exists?** Run `collie commands` (or `collie <group> --help` for one group)

### Reminder Requests

When the user asks to set a reminder, use `collie reminder <minutes> [message]` directly. Convert natural language durations to minutes and title-case short reminder labels when appropriate.

```bash
collie reminder 15 "Pickup Jack"
collie reminder 60 "Check laundry"
collie reminder show
collie reminder clear
```

## Out of Scope

This skill intentionally does not cover Collie source development. Do not use this skill for:
- Editing files in `/usr/share/collie/` (`bin/`, `config/`, `default/`, `shell/`, `themes/`, `migrations/`, etc.)
- Creating or editing migrations
- Running `collie dev ...` commands

## Example Requests

- "Change my theme to catppuccin" -> `collie theme set catppuccin`
- "Add a keybinding for Super+E to open file manager" -> Check existing bindings first, then use `o.rebind` to replace one or `o.bind` to add one in `~/.config/hypr/bindings.lua`
- "Configure my external monitor" -> `collie hyprland monitor scaling|resolution --monitor <name> ...` for scale and resolution; edit `~/.config/hypr/monitors.lua` only for rotation and the other extras in hyprland.md
- "Make the window gaps smaller" -> Edit `~/.config/hypr/looknfeel.lua`
- "Turn on night light" -> `collie toggle nightlight` (for time-based schedules, edit `~/.config/hypr/hyprsunset.conf` profiles, then `collie restart hyprsunset`)
- "Set a reminder to pickup jack in 15 minutes" -> `collie reminder 15 "Pickup Jack"`
- "Show my reminders" -> `collie reminder show`
- "Clear all reminders" -> `collie reminder clear`
- "Customize the catppuccin theme colors" -> Overlay: put an edited `colors.toml` in `~/.config/collie/themes/catppuccin/`, then re-apply the theme (see `theming.md`)
- "Run a script every time I change themes" -> Install it with `collie hook install theme-set <script>`
- "Change how workspace labels are rendered" -> Clone `collie.workspaces`, which switches the bar to `<username>.workspaces`, then edit the clone
- "Lock after ten minutes" -> Set `idle.lock` to `600` in `~/.config/collie/shell.json`
- "Reset shell/bar to defaults" -> `collie refresh shell`
- "Record my screen" -> `collie screenrecord --fullscreen`, then `collie screenrecord --stop-recording` (see `capture.md`)
- "Report this bug to Collie" -> Gather diagnostics and a capture of the problem, then file it (see `contributing.md`)
