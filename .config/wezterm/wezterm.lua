local wezterm = require("wezterm")
return {
	--color_scheme = "termnial.sexy",
	--color_scheme = "nord",
	enable_wayland = true,
	color_scheme = "Dracula (Official)",
	--color_scheme = "Dracula+",
	enable_tab_bar = false,
	font_size = 14.0,
	font = wezterm.font("JetBrains Mono"),
	-- macos_window_background_blur = 40,
	macos_window_background_blur = 10,
	--window_background_opacity = 0.92,
	--	window_background_opacity = 1.0,
	initial_rows = 40,
	initial_cols = 110,
	window_background_opacity = 0.72,
	-- window_background_opacity = 0.20,
	window_decorations = "RESIZE",
	keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	},
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
