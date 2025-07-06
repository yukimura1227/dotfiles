local wezterm = require 'wezterm'

local function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local index = ''
  if #tabs > 1 then
    index = string.format('[%d/%d] ', tab.tab_index + 1, #tabs)
  end

  local cwdFull = tab.active_pane.current_working_dir
  return index .. tab.active_pane.title .. '@' .. cwdFull
end)

local function detectIcon(foregroundProcessName)
  local nerdIconsMapping = {
    Vim    = wezterm.nerdfonts.custom_vim,
    bash   = wezterm.nerdfonts.dev_terminal,
    ssh    = wezterm.nerdfonts.mdi_server,
    top    = wezterm.nerdfonts.mdi_monitor,
    docker = wezterm.nerdfonts.dev_docker,
    ruby   = wezterm.nerdfonts.dev_ruby,
  }
  local processName = basename(foregroundProcessName)
  icon = nerdIconsMapping[processName]
  if icon then
    return icon .. ' '
  else
    return ''
  end
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, maxWidth)
  local icon = detectIcon(tab.active_pane.foreground_process_name)
  local tabText = (tab.tab_index+1) .. ':  ' .. icon .. '  ' .. tab.active_pane.title
  if tab.is_active then
    local cwd = basename(tab.active_pane.current_working_dir)
    return {
      { Background = { Color = '#4000CF' } },
      { Text = tabText .. '  ' .. cwd .. '/' },
    }
  end
  return tabText
end)

