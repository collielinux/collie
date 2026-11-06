-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Collie's bootstrap keeps path setup out of this user config.
dofile((os.getenv("COLLIE_PATH") or "/usr/share/collie") .. "/default/hypr/bootstrap.lua")

-- Disable all Collie default bindings. Add your own in hypr/bindings.lua.
-- collie_default_bindings = false
--
-- Or disable only bindings for Collie's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- collie_preinstalled_bindings = false
--
-- Disable Collie's default touchpad gestures. Add your own in hypr/input.lua.
-- collie_default_gestures = false

-- Load Collie defaults.
require("default.hypr.collie")

-- Put your personal overrides in these files. They're loaded after Collie's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })
