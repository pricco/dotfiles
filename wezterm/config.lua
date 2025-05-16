local wezterm = require('wezterm')
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local custom = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
custom.background = '#11111b'

config = {
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  audible_bell = 'Disabled',
  default_cursor_style = 'SteadyBar',
  automatically_reload_config = true,
  window_close_confirmation = 'NeverPrompt',
  adjust_window_size_when_changing_font_size = false,
  -- native_macos_fullscreen_mode = true,
  -- window_decorations = "RESIZE",
  check_for_updates = false,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  font_size = 13,
  font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular' }),
  enable_tab_bar = false,
  color_schemes = {
    ['CustomMocha'] = custom,
  },
  color_scheme = 'CustomMocha',
  window_padding = {
    left = 0,
    right = 0,
    top = 30, -- below mac camera
    bottom = 0,
  },
  -- from: https://akos.ma/blog/adopting-wezterm/
  hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
      regex = '\\((\\w+://\\S+)\\)',
      format = '$1',
      highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
      regex = '\\[(\\w+://\\S+)\\]',
      format = '$1',
      highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
      regex = '\\{(\\w+://\\S+)\\}',
      format = '$1',
      highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
      regex = '<(\\w+://\\S+)>',
      format = '$1',
      highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
      -- Before
      --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
      --format = '$0',
      -- After
      regex = '[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)',
      format = '$1',
      highlight = 1,
    },
    -- implicit mailto link
    {
      regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
      format = 'mailto:$0',
    },
  },
  keys = {
    {
      key = 'e',
      mods = 'CMD',
      action = wezterm.action.SendString('\x01E'), -- Ctrl-A + E
    },
    {
      key = 'z',
      mods = 'CMD',
      action = wezterm.action.SendString('\x01Z'), -- Ctrl-A + Z
    },
    {
      key = 'm',
      mods = 'CMD',
      action = wezterm.action.SendString('\x01M'), -- Ctrl-A + M
    },
    {
      key = 'w',
      mods = 'CMD',
      action = wezterm.action.SendString('\x01W'), -- Ctrl-A + W
    },
    {
      key = 'p',
      mods = 'CMD',
      action = wezterm.action.SendString('\x01P'), -- Ctrl-A + W
    },
    {
      key = 's',
      mods = 'CMD',
      action = wezterm.action.SendKey({
        key = 's',
        mods = 'ALT',
      }),
    },
    {
      key = 't',
      mods = 'CMD',
      action = wezterm.action.SendKey({
        key = 't',
        mods = 'ALT',
      }),
    },
  },
}
return config
