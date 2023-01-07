local font_config = {}
local wezterm = require 'wezterm'

font_config = {
  font = wezterm.font_with_fallback {
    { family = "HackGen Console NFJ", weight = "Regular" },
    -- NOTE: weztermでは、JetBrains Mono、Noto Color Emojiは同梱されている
    { family = 'JetBrains Mono'     , weight = 'Regular' },
    { family = 'Noto Color Emoji' },
  },
  font_size = 20,
}

return font_config
