local keyConfig = {}
local wezterm = require 'wezterm'
local act = wezterm.action

keyConfig = {
  keys = {
    { key = 'D', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
    {
      key  = 'q', -- NOTE: keybind like tmux <- CTRL+q is conflict to docker detach(Ctrl+p,Ctrl+q) so using CMD+q
      mods = 'CMD',
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

return keyConfig
