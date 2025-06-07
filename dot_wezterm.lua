local wezterm = require 'wezterm';

return {
  -- Set the default font
--   font = wezterm.font("JetBrains Mono"),

  -- Set the font size
  font_size = 12.0,

  -- Set the color scheme
  color_scheme = "catppuccin-mocha",

  -- Enable scrollback
  scrollback_lines = 5000,

  -- Set default window padding
  window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5,
  },

  -- Set default tab bar visibility
  enable_tab_bar = true,


  hide_tab_bar_if_only_one_tab = true,
}