local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.colors = {
  background = '#000000',
  cursor_bg = '#feffff',
  cursor_fg = '#000000',
  foreground = '#c6c8c7',
  selection_bg = '#c2deff',
  selection_fg = '#000000',
  ansi = {
    '#000000',
    '#d91c00',
    '#5da703',
    '#cfae00',
    '#417ab4',
    '#88668e',
    '#00a8ab',
    '#dcddd8',
  },
  brights = {
    '#686a66',
    '#f54036',
    '#9ae344',
    '#fdeb60',
    '#84b0d8',
    '#bb94b6',
    '#3ae5e9',
    '#eee9e5',
  },
}

config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular' })
config.font_size = 13.8
config.allow_square_glyphs_to_overflow_width = "Never"
config.front_end = "WebGpu"

config.window_padding = {
  left = 10,
  right = 16,
  top = 5,
  bottom = 18
}

return config
