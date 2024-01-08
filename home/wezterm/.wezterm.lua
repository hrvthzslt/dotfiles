-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.term = "wezterm"
config.window_close_confirmation = "NeverPrompt"

-- Hide tabs
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- For example, changing the color scheme:
config.color_scheme = "Gruvbox light, hard (base16)"
config.window_background_opacity = 0.9
config.window_decorations = "NONE"

-- Font
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 13

config.adjust_window_size_when_changing_font_size = false
config.keys = {
	{
		key = ".",
		mods = "CTRL",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = ",",
		mods = "CTRL",
		action = wezterm.action.ResetFontSize,
	},
}

-- Psssst!
config.audible_bell = "Disabled"

-- Cursor
config.default_cursor_style = "SteadyBlock"

-- and finally, return the configuration to wezterm
return config
