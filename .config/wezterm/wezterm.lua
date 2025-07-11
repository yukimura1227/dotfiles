local wezterm = require 'wezterm'

function overrideConfig(original, additional)
  for key, value in pairs(additional) do
    original[key] = value
  end
end
local config = {
  audible_bell = 'Disabled',
  default_cursor_style = 'BlinkingBar',
  animation_fps = 1,
  inactive_pane_hsb = {
    brightness = 0.1
  },
  quick_select_patterns = {
    '[0-9a-zA-Z/_!${}\\-\\.]{7,120}',
  },
  scrollback_lines = 10000,
  window_decorations = "RESIZE",
  window_frame = {
    active_titlebar_bg = 'none',
  },
  window_background_opacity = 0.95,
  macos_window_background_blur = 30,
}
local font = require('font')
overrideConfig(config, font)
local color = require('color')
overrideConfig(config, color)
local rightStatus = require('right-status')
local keys = require('keys')
overrideConfig(config, keys)
local tabs = require('tabs')

return config
