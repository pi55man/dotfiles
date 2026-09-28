local wezterm = require 'wezterm'
local config = wezterm.config_builder()


config.window_background_opacity = 0.85
config.color_scheme = 'Apathy (base 16)'
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"

return config
