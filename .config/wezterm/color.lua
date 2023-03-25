local colorConfig = {}
local wezterm = require 'wezterm'

colorConfig = {
  color_scheme = 'PencilDark',
  colors = {
    split = 'violet',
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
