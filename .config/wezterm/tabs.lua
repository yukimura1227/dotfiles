local wezterm = require 'wezterm'

local function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

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

function tabTitle(tab)
  local icon = detectIcon(tab.active_pane.foreground_process_name)
  local processName = basename(tab.active_pane.foreground_process_name)
  local tabText = (tab.tab_index+1) .. ':  ' .. icon .. '  ' .. processName
  return tabText
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, maxWidth)
    local background      = '#100030'
    local foreground      = '#808080'
    local edge_foreground = 'none'
    local edge_background = 'none'

    if tab.is_active then
      background      = '#400070'
      edge_foreground = background
      foreground      = '#FFFFFF'
    end

    local tabTitle = tabTitle(tab)
    tabTitle = wezterm.truncate_right(tabTitle, maxWidth)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = tabTitle },
    }
  end
)
