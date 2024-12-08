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
		return "rose-pine"
	else
		return "rose-pine-dawn"
	end
end

-- local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm")
-- local rose_pine_theme_for_appearance = function(appearance)
-- 	if appearance:find("Dark") then
-- 		return theme.main
-- 	else
-- 		return theme.dawn
-- 	end
-- end
-- config.colors = rose_pine_theme_for_appearance(get_appearance()).colors()

config.color_scheme = scheme_for_appearance(get_appearance())

config.font = wezterm.font("JetBrainsMono Nerd Font Mono", {
	weight = "Regular",
	italic = false,
})
-- config.font = wezterm.font("CaskaydiaCove Nerd Font", {
-- 	weight = "Regular",
-- })
config.font_size = 14

config.initial_rows = 50
config.initial_cols = 180
config.window_padding = {
	left = 10,
	right = 10,
	top = 60,
	bottom = 0,
}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE|MACOS_FORCE_ENABLE_SHADOW"
config.window_close_confirmation = "NeverPrompt"
config.max_fps = 144
config.animation_fps = 60
config.cursor_blink_rate = 250

config.enable_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = false
-- config.use_fancy_tab_bar = false
-- config.tab_bar_at_bottom = true

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
	{ key = "F9", mods = "ALT", action = wezterm.action.ShowTabNavigator },
}

return config
