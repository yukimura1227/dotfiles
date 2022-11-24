local wezterm = require 'wezterm'

wezterm.on('update-right-status', function(window, pane)
  local date = wezterm.strftime '🕰 %H:%M:%S '
  local bat = ''
  for _, b in ipairs(wezterm.battery_info()) do
    bat = '🔋 ' .. string.format('%.0f%%', b.state_of_charge * 100)
  end
  window:set_right_status(wezterm.format {
    { Text = bat .. '   ' .. date },
  })
end)

return {
  font = wezterm.font_with_fallback {
    { family = "HackGen Console NFJ", weight = "Regular" },
    -- NOTE: weztermでは、JetBrains Mono、Noto Color Emojiは同梱されている
    { family = 'JetBrains Mono'     , weight = 'Regular' },
    { family = 'Noto Color Emoji' },
  },
  font_size = 20,
}
