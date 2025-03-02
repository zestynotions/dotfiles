local wezterm = require("wezterm")
return {
	--color_scheme = "termnial.sexy",
	--color_scheme = "nord",
	--color_scheme = "Dracula (Official)",
	color_scheme = "Dracula+",
	max_fps = 120,
	enable_wayland = true,
	enable_tab_bar = false,
	font_size = 16.0,
	font = wezterm.font("JetBrains Mono"),
	macos_window_background_blur = 20,
	--window_background_opacity = 0.92,
	window_close_confirmation = "NeverPrompt",

	-- Leader is the same as my old tmux prefix
	leader = { key = "b", mods = "CMD", timeout_milliseconds = 1000 },

	initial_rows = 40,
	initial_cols = 110,
	window_background_opacity = 0.75,
	window_decorations = "RESIZE",
	keys = {
		{
			mods = "LEADER",
			key = "m",
			action = wezterm.action.TogglePaneZoomState,
		},
		{
			mods = "LEADER",
			key = "f",
			action = wezterm.action.ToggleFullScreen,
		},
		{
			mods = "LEADER",
			key = "j",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "LEADER",
			key = "l",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			mods = "CTRL",
			key = "h",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
		},
		{
			mods = "CTRL",
			key = "j",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
		},
		{
			mods = "CTRL",
			key = "k",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
		},
		{
			mods = "CTRL",
			key = "l",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
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
