local colorConfig = {}
local wezterm = require 'wezterm'

colorConfig = {
  color_scheme = 'Catppuccin Mocha',
  colors = {
    split = 'violet',
    tab_bar = {
      inactive_tab_edge = "none",
    },
  },
  window_background_gradient = {
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
  },
}

return colorConfig
