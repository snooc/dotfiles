local wezterm = require("wezterm")
local config = wezterm.config_builder()

local padding = "20"
local opacity = 0.85
local transparent_bg = "rgba(22, 24, 26, " .. opacity .. ")"

config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular", italic = false })
config.font_size = 14

config.initial_rows = 45
config.initial_cols = 180
config.window_padding = { left = padding, right = padding, top = padding, bottom = padding }
config.window_decorations = "RESIZE"
config.window_background_opacity = opacity
config.macos_window_background_blur = 20
config.window_close_confirmation = "NeverPrompt"
config.max_fps = 144
config.animation_fps = 60
config.cursor_blink_rate = 250

config.colors = require("cyberdream")

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.colors.tab_bar = {
	background = transparent_bg,
	active_tab = {
		bg_color = transparent_bg,
		fg_color = "#ffffff",
	},
	inactive_tab = {
		bg_color = transparent_bg,
		fg_color = "#7b8496",
	},
	inactive_tab_hover = {
		bg_color = transparent_bg,
		fg_color = "#ffffff",
	},
	new_tab = {
		bg_color = transparent_bg,
		fg_color = "#ffffff",
	},
}

return config
