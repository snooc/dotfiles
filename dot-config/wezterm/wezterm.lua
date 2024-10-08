local wezterm = require("wezterm")
local config = wezterm.config_builder()

local get_appearance = function()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local scheme_for_appearance = function(appearance)
	if appearance:find("Dark") then
		return "Cyberdream"
	else
		return "Cyberdream Light"
	end
end

config.font = wezterm.font("JetBrainsMono Nerd Font Mono", {
	weight = "Regular",
	italic = false,
})
config.font_size = 14

config.color_scheme = scheme_for_appearance(get_appearance())

config.initial_rows = 50
config.initial_cols = 180
config.window_padding = {
	left = 20,
	right = 20,
	top = 60,
	bottom = 0,
}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
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

local act = wezterm.action
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "d",
		mods = "CMD",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "k",
		mods = "CMD",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			act.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
}

return config
