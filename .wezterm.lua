local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback {
    { family = "HackGen Console NFJ", weight = "Regular" },
    -- NOTE: weztermでは、JetBrains Mono、Noto Color Emojiは同梱されている
    { family = 'JetBrains Mono'     , weight = 'Regular' },
    { family = 'Noto Color Emoji' },
  },
}
