-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Wezterm action
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }

config.tab_bar_at_bottom = true

-- Make it look like tabs, with better GUI controls
config.use_fancy_tab_bar = true

-- config.keys = {
--   {
--     key = '|',
--     mods = 'LEADER|SHIFT',
--     action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
--   },
--   -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
--   {
--     key = 'a',
--     mods = 'LEADER|CTRL',
--     action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
--   },
-- }

config.keys = {
  {
    key = "s",
    mods = "CMD",
    action = act.SendString ":w\n"
  },
  -- Pane Navigation
  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentTab { confirm = true },
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Down',
  },
  -- {
  --   key = 'j',
  --   mods = 'LEADER',
  --   action = act.ActivatePaneDirection 'Left',
  -- },
  -- {
  --   key = 'k',
  --   mods = 'LEADER',
  --   action = act.ActivatePaneDirection 'Right',
  -- },
  -- {
  --   key = 'j',
  --   mods = 'LEADER',
  --   action = act.ActivatePaneDirection 'Up',
  -- },
  -- {
  --   key = 'l',
  --   mods = 'LEADER',
  --   action = act.ActivatePaneDirection 'Down',
  -- },
  {
    key = "h",
    mods = "ALT",
    action = act.ActivatePaneDirection "Prev",
  },
  {
    key = "l",
    mods = "ALT",
    action = act.ActivatePaneDirection "Next",
  },
  {
    key = "k",
    mods = "ALT",
    action = act.ActivatePaneDirection "Prev",
  },
  {
    key = "j",
    mods = "ALT",
    action = act.ActivatePaneDirection "Next",
  },
  -- End of pane navigation
  -- Split pane vertically
  {
    key = 'i',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'H',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize { 'Left', 2 },
  },
  {
    key = 'J',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize { 'Down', 2 },
  },
  { key = 'K',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize { 'Up', 2 }
  },
  {
    key = 'L',
    mods = 'CTRL|SHIFT',
    action = act.AdjustPaneSize { 'Right', 2 },
  },
  {
    key = 'z',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState,
  },
  -- Set tab title
  {
    key = ',',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(
        function(window, _, line)
          if line then
            window:active_tab():set_title(line)
          end
        end
      ),
    },
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = act.ShowTabNavigator,
  },
  {
    key = '8',
    mods = 'CTRL',
    action = act.PaneSelect {
      alphabet = '1234567890',
    },
  },
}

-- For example, changing the color scheme:
config.color_scheme = 'Batman'
config.font = wezterm.font("MesloLGS NF")
config.font_size = 16.0

-- Close confirmation
config.window_close_confirmation = 'AlwaysPrompt'

-- and finally, return the configuration to wezterm
return config
