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
    -- editor
    Vim     = wezterm.nerdfonts.dev_vim,
    -- shell
    bash    = wezterm.nerdfonts.dev_terminal,
    zsh     = wezterm.nerdfonts.dev_terminal,
    -- programming lanuage
    ruby    = wezterm.nerdfonts.dev_ruby,
    node    = wezterm.nerdfonts.md_nodejs,
    -- git
    tig     = wezterm.nerdfonts.md_git,
    lazygit = wezterm.nerdfonts.md_git,

    -- find tool
    fzf     = wezterm.nerdfonts.md_feature_search_outline,
    rg      = wezterm.nerdfonts.md_feature_search_outline,
    grep    = wezterm.nerdfonts.md_feature_search_outline,
    find    = wezterm.nerdfonts.md_feature_search_outline,
    yazi    = wezterm.nerdfonts.md_file_tree_outline,

    -- misc
    ssh     = wezterm.nerdfonts.mdi_server,
    top     = wezterm.nerdfonts.mdi_monitor,
    docker  = wezterm.nerdfonts.dev_docker,
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

