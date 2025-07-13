local wezterm = require 'wezterm'

local config = wezterm.config_builder()

function overrideConfig(original, additional)
  for key, value in pairs(additional) do
    original[key] = value
  end
end
config.audible_bell = 'Disabled'
config.default_cursor_style = 'BlinkingBar'
config.animation_fps = 1
config.inactive_pane_hsb = {
  brightness = 0.1
}
config.quick_select_patterns = {
  '[0-9a-zA-Z/_!${}\\-\\.]{7,120}',
}
config.scrollback_lines = 10000
config.window_decorations = "RESIZE"
config.window_frame = {
  active_titlebar_bg = 'none',
}
config.window_background_opacity = 0.95
config.macos_window_background_blur = 30

local font = require('font')
overrideConfig(config, font)
local color = require('color')
overrideConfig(config, color)
local rightStatus = require('right-status')
local keys = require('keys')
overrideConfig(config, keys)
local tabs = require('tabs')

return config
