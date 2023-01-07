local wezterm = require 'wezterm'
local act = wezterm.action

function override_config(original, additional)
  for key, value in pairs(additional) do
    original[key] = value
  end
end
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

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local index = ''
  if #tabs > 1 then
    index = string.format('[%d/%d] ', tab.tab_index + 1, #tabs)
  end

  local cwd_full = tab.active_pane.current_working_dir
  return index .. tab.active_pane.title .. '@' .. cwd_full
end)

local function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end
local function detect_icon(foreground_process_name)
  local nerd_icons_mapping = {
    Vim    = wezterm.nerdfonts.custom_vim,
    bash   = wezterm.nerdfonts.dev_terminal,
    ssh    = wezterm.nerdfonts.mdi_server,
    top    = wezterm.nerdfonts.mdi_monitor,
    docker = wezterm.nerdfonts.dev_docker,
    ruby   = wezterm.nerdfonts.dev_ruby,
  }
  local process_name = basename(foreground_process_name)
  icon = nerd_icons_mapping[process_name]
  if icon then
    return icon .. ' '
  else
    return ''
  end
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local icon = detect_icon(tab.active_pane.foreground_process_name)
  local tab_text = (tab.tab_index+1) .. ':  ' .. icon .. '  ' .. tab.active_pane.title
  if tab.is_active then
    local cwd = basename(tab.active_pane.current_working_dir)
    return {
      { Background = { Color = '#4000CF' } },
      { Text = tab_text .. '  ' .. cwd .. '/' },
    }
  end
  return tab_text
end)

local config = {
  audible_bell = 'Disabled',
  default_cursor_style = 'BlinkingBar',
  animation_fps = 1,
  color_scheme = 'PencilDark',
  colors = {
    split = 'violet',
  },
  inactive_pane_hsb = {
    brightness = 0.5
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
  keys = {
    { key = 'D', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
    {
      key  = 'q', -- NOTE: keybind like tmux
      mods = 'CTRL',
      action = act.PaneSelect {
        alphabet = '1234567890'
      }
    },
    {
      key    = 'D', -- NOTE: keybind like iterm2
      mods   = 'CMD',
      action = wezterm.action.SplitVertical {
        domain = 'CurrentPaneDomain'
      },
    },
    {
      key    = 'd', -- NOTE: keybind like iterm2
      mods   = 'CMD',
      action = wezterm.action.SplitHorizontal {
        domain = 'CurrentPaneDomain'
      },
    },
    {
      -- NOTE: keybind like iTerm2
      key = '[',
      mods = 'CMD',
      action = act.ActivatePaneDirection 'Prev',
    },
    {
      -- NOTE: keybind like iTerm2
      key = ']',
      mods = 'CMD',
      action = act.ActivatePaneDirection 'Next',
    },
    {
      -- NOTE: keybind like iTerm2
      key = 'Enter',
      mods = 'CMD',
      action = wezterm.action.ToggleFullScreen,
    },
    { key = 'l', mods = 'CMD', action = wezterm.action.ShowLauncher },
  },
}
local font = require('font')
override_config(config, font)

return config
