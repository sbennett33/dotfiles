-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

local act = wezterm.action

-- This is where you actually apply your config choices

config.color_scheme = 'Catppuccin Mocha'
-- config.color_scheme = 'Cyberdream'

config.enable_tab_bar = false

config.font_size = 14.0

config.default_prog = { '/opt/homebrew/bin/tmux', 'attach' }

config.window_decorations = 'RESIZE'

config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

config.keys = {
  -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'b',
      mods = 'ALT',
    },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey { key = 'f', mods = 'ALT' },
  },
}

-- and finally, return the configuration to wezterm
return config
