# Themes, Backgrounds, and Fonts

Read this before changing themes, backgrounds, fonts, or theme colors.

## Theme Commands

```bash
collie theme list              # Show available themes
collie theme current           # Show current theme
collie theme set <name>        # Apply theme ("Tokyo Night" and "tokyo-night" both work)
collie theme bg next           # Cycle background
collie theme install <url>     # Install from git repo
```

## Making a New Theme

1. Create a directory under `~/.config/collie/themes`.
2. See how an existing theme is done via `/usr/share/collie/themes/catppuccin`.
3. Download a matching background (or several) from the internet and put them in `~/.config/collie/themes/<name-of-new-theme>/backgrounds/`.
4. When done with the theme, run `collie theme set "Name of new theme"`.

Additional user backgrounds for any theme (stock or custom) go in
`~/.config/collie/backgrounds/<theme-slug>/`.

## What a Theme Installed From a Repo May Not Contain

A theme the user wrote by hand in `~/.config/collie/themes` is unrestricted, as
are Collie's own themes. From a theme cloned by `collie theme install`, Collie
drops only what runs code: any `*.lua` (Hyprland requires a theme's
`hyprland.lua` and `gum_env.lua` at login, Neovim loads `neovim.lua` at startup),
the terminal configs `alacritty.toml`, `foot.ini`, `ghostty.conf` and
`kitty.conf` (each names the program the terminal launches), and `vscode.json`
(names a VS Code extension to install). Those are regenerated from `colors.toml`
through `$COLLIE_PATH/default/themed/*.tpl`, and named on stderr.

Everything else a cloned theme ships is kept, including `btop.theme`,
`chromium.theme`, `helix.toml`, `icons.theme`, `keyboard.rgb` and `shell.toml`.
Collie tells a cloned theme from the user's own by the `.git` directory a clone
leaves behind.

To change how Collie themes an app for every theme, write the template rather
than the theme: `~/.config/collie/themed/<config-name>.tpl` overrides the
built-in one. See `docs/theming.md` in the Collie repo.

## Customizing a Stock Theme

Never edit stock themes under `/usr/share/collie/themes/` — changes are lost
on update. Two safe options:

Both write into `~/.config/collie/themes`, where a theme the user wrote is
unrestricted — the list above applies only to a theme cloned from a repo.

**Overlay (preferred for small tweaks):** create a user theme directory with
the SAME slug containing only the files you want to change. When the theme is
applied, the stock theme is copied first and your files win on top:

```bash
mkdir -p ~/.config/collie/themes/catppuccin
cp /usr/share/collie/themes/catppuccin/colors.toml ~/.config/collie/themes/catppuccin/
# Edit the copied colors.toml, then re-apply:
collie theme set catppuccin
```

**Fork:** copy the whole stock theme under a new name for a fully independent
variant:

```bash
cp -r /usr/share/collie/themes/catppuccin ~/.config/collie/themes/catppuccin-custom
# Edit ~/.config/collie/themes/catppuccin-custom/, then:
collie theme set catppuccin-custom
```

## Fonts

```bash
collie font list               # Available fonts
collie font current            # Current font
collie font set <name>         # Change font
```
