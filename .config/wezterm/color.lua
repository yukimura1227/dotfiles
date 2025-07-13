local wezterm = require 'wezterm'

local colorConfig = wezterm.config_builder()

colorConfig.color_scheme = 'Catppuccin Mocha'
colorConfig.colors = {
  split = 'violet',
  tab_bar = {
    inactive_tab_edge = "none",
  },
}
colorConfig.window_background_gradient = {
  orientation = { Linear = { angle = 45.0 } },
  colors = {
    '#10001A',
    '#10001A',
    '#10002A',
    '#10003A',
    '#18003F',
  },
  interpolation = 'Linear',
  blend = 'Rgb',
}

return colorConfig
