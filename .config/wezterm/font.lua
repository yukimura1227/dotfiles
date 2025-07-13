local wezterm = require 'wezterm'
local fontConfig = wezterm.config_builder()

fontConfig.font = wezterm.font_with_fallback {
  { family = "UDEV Gothic NF", weight = "Regular" },
  -- NOTE: weztermでは、JetBrains Mono、Noto Color Emojiは同梱されている
  { family = 'JetBrains Mono'     , weight = 'Regular' },
  { family = 'Noto Color Emoji' },
}
fontConfig.font_size = 25

return fontConfig
