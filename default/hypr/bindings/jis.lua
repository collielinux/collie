-- Defaults for Japanese (JIS) keyboards, which only apply when the installed
-- layout is jp. See default/hypr/keyboard.lua.

local keyboard = require("default.hypr.keyboard")

if not keyboard.jis() then
  return
end

-- Same down/up split as the universal clipboard shortcuts in clipboard.lua.
local function send_shortcut_once(mods, key)
  hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))

  hl.timer(function()
    hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
  end, { timeout = 50, type = "oneshot" })
end

-- On JIS, + is Shift + ;, so apps see Ctrl + Shift + semicolon and never zoom
-- in. Hand them Ctrl + keypad plus instead, which Chromium, Electron apps,
-- VS Code, and Firefox read as zoom in.
o.bind("CTRL + SHIFT + semicolon", "Zoom in (JIS + key)", function()
  send_shortcut_once("CTRL", "KP_Add")
end)
