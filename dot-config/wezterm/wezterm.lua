local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font Mono", {
	weight = "Regular",
	italic = false,
})
config.font_size = 14

config.color_scheme = "Cyberdream"

config.initial_rows = 50
config.initial_cols = 180
config.window_padding = {
	left = 20,
	right = 20,
	top = 60,
	bottom = 0,
}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = 0.85
config.text_background_opacity = 0.85
config.macos_window_background_blur = 20
config.window_close_confirmation = "NeverPrompt"
config.max_fps = 144
config.animation_fps = 60
config.cursor_blink_rate = 250

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

return config
