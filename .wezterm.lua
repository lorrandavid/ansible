local wezterm = require("wezterm")
local mux = wezterm.mux
local wsl_domains = wezterm.default_wsl_domains()
local default_domain = wsl_domains[1]

wezterm.on("gui-startup", function(cmd)
	local window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	default_domain = default_domain.name,
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Catppuccin Mocha",
	font = wezterm.font({ -- Normal text
		family = "JetBrainsMono Nerd Font",
		weight = "Regular",
	}),
	font_rules = {
		{ -- Italic
			intensity = "Normal",
			italic = true,
			font = wezterm.font({
				-- family="Monaspace Radon",  -- script style
				family = "Monaspace Xenon", -- courier-like
				style = "Italic",
			}),
		},

		{ -- Bold Italic
			intensity = "Bold",
			italic = true,
			font = wezterm.font({
				family = "Monaspace Xenon",
				style = "Italic",
				weight = "Bold",
			}),
		},
	},
	font_size = 11,
	window_close_confirmation = "NeverPrompt",
	leader = { key = "a", mods = "CTRL" },
	keys = {
		{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{
			key = "\\",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = {
				domain = "CurrentPaneDomain",
			} }),
		},
		{
			key = "s",
			mods = "LEADER",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{
			key = "v",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = {
				domain = "CurrentPaneDomain",
			} }),
		},
		{ key = "o", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "LeftArrow", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
		{ key = "DownArrow", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
		{ key = "UpArrow", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
		{ key = "RightArrow", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
		{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
		{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		{
			key = "d",
			mods = "LEADER",
			action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
		},
		{
			key = "x",
			mods = "LEADER",
			action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
		},
	},
}
