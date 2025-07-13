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
