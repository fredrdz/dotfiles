local wezterm = require("wezterm")

-- Set up keyboard shortcuts
local act = wezterm.action
local mykeys = {
	{ key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "SHIFT|CTRL", action = act.ResetFontSize },
	{ key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
	{ key = "R", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
	{ key = "T", mods = "SHIFT|CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "Z", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },
	{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "LeftArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "RightArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "UpArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "DownArrow", mods = "SHIFT|ALT|CTRL", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "Enter", mods = "SHIFT|CTRL", action = act.ToggleFullScreen },
	{ key = "Backspace", mods = "SHIFT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "Space", mods = "SHIFT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "Insert", mods = "CTRL", action = act.CopyTo("PrimarySelection") },
	{ key = "Insert", mods = "CTRL", action = act.CopyTo("Clipboard") },
	{ key = "Insert", mods = "SHIFT", action = act.PasteFrom("PrimarySelection") },
	{ key = "Insert", mods = "SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "V", mods = "CTRL", action = act.PasteFrom("PrimarySelection") },
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "C", mods = "CTRL", action = act.CopyTo("PrimarySelection") },
	{ key = "C", mods = "CTRL", action = act.CopyTo("Clipboard") },
	{ key = "Paste", mods = "NONE", action = act.PasteFrom("PrimarySelection") },
	{ key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },
	{ key = "Copy", mods = "NONE", action = act.CopyTo("PrimarySelection") },
	{ key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
}

-- Set up mouse binds
local mymouse = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = NONE,
		action = act.CompleteSelection("PrimarySelection"),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
}

-- A helper function for my fallback fonts
local function font_with_fallback(name, params)
	local names = {
		name,
		"JetBrains Mono",
		"Source Code Pro",
	}
	return wezterm.font_with_fallback(names, params)
end

local config = {
	term = "wezterm",
	enable_wayland = true,
	front_end = "WebGpu",
	audible_bell = "Disabled",
	check_for_updates = true,
	check_for_updates_interval_seconds = 86400,
	automatically_reload_config = true,
	animation_fps = 60,
	max_fps = 60,
	color_scheme = "kanagawabones",

	-- keys
	disable_default_key_bindings = true,
	keys = mykeys,
	mouse_bindings = mymouse,

	scrollback_lines = 3500,
	enable_scroll_bar = true,
	harfbuzz_features = {
		"zero", -- Use a slashed zero '0' (instead of dotted)
		"kern", -- (default) kerning (todo check what is really is)
		"liga", -- (default) ligatures
		"clig", -- (default) contextual ligatures
	},

	-- wsl
	default_domain = "WSL:fedora",

	-- tab_bar
	enable_tab_bar = true,
	use_fancy_tab_bar = true,
	tab_max_width = 50,
	hide_tab_bar_if_only_one_tab = false,
	tab_bar_at_bottom = true,

	-- window settings
	window_frame = {
		font = wezterm.font({ family = "JetBrains Mono", weight = "Light" }),
		font_size = 9,
		active_titlebar_bg = "#202123",
		inactive_titlebar_bg = "#202123",
		border_left_width = "0cell",
		border_right_width = "0cell",
		border_bottom_height = "0cell",
		border_top_height = "0cell",
		border_left_color = "None",
		border_right_color = "None",
		border_bottom_color = "None",
		border_top_color = "None",
	},
	-- Pad window to avoid the content to be too close to the border,
	-- so it's easier to see and select.
	window_padding = { left = 1, right = 1, top = 1, bottom = 1 },
	window_decorations = "INTEGRATED_BUTTONS",
	window_background_opacity = 1,
	macos_window_background_blur = 50,
	text_background_opacity = 1,
	window_close_confirmation = "NeverPrompt",
	use_resize_increments = false,

	-- cursor settings
	default_cursor_style = "BlinkingBlock",
	force_reverse_video_cursor = true,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 700,
	cursor_thickness = 2,

	-- font settings
	font = wezterm.font({
		family = "JetBrains Mono",
		weight = "Regular",
	}),
	font_rules = {
		{
			italic = true,
			intensity = "Bold",
			underline = "Single",
			font = font_with_fallback("JetBrainsMono Nerd Font", { style = "Italic", weight = "ExtraBlack" }),
		},
		{
			italic = true,
			intensity = "Bold",
			underline = "None",
			font = font_with_fallback("JetBrainsMono Nerd Font", { style = "Italic", weight = "ExtraBold" }),
		},
		{
			intensity = "Bold",
			italic = false,
			underline = "None",
			font = font_with_fallback("JetBrainsMono Nerd Font", { style = "Normal", weight = "Bold" }),
		},
		{
			intensity = "Normal",
			italic = true,
			underline = "None",
			font = font_with_fallback("JetBrainsMono Nerd Font", { style = "Italic", weight = "DemiBold" }),
		},
		{
			intensity = "Half",
			italic = true,
			underline = "None",
			font = font_with_fallback("JetBrainsMono Nerd Font", { style = "Italic", weight = "Medium" }),
		},
		{
			intensity = "Normal",
			italic = false,
			underline = "Single",
			font = font_with_fallback("JetBrainsMono Nerd Font", { style = "Italic", weight = "Light" }),
		},
	},
	font_size = 14,
	freetype_load_target = "Light",
	freetype_load_flags = "NO_HINTING",
	foreground_text_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	underline_position = "110%",
	underline_thickness = "200%",
	line_height = 1.0,
	cell_width = 0.9,
	bold_brightens_ansi_colors = "BrightOnly",
	inactive_pane_hsb = { hue = 1.0, saturation = 0.7, brightness = 0.8 },

	-- Disable annoying default behaviors
	adjust_window_size_when_changing_font_size = false,
	-- that one was opening a separate win on first unknown glyph, stealing windows focus (!!)
	warn_about_missing_glyphs = false,
	-- Makes FontAwesome's double-width glyphs display properly!
	allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
	-- FIXME (<- this is an example of bolded text)
	-- 0 1 2 3 4 5 6 7 8 9
	-- Some ligatures: != <-> <-  -> ----> => ==> ===> -- --- /../;;/ #{}
	--  <> <!-- --> ->> --> <= >= ++ == === := a::b::c a&&b a||b

	hyperlink_rules = {
		-- Linkify things that look like URLs and the host has a TLD name.
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{ regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b", format = "$0" },
		-- linkify email addresses
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{ regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]], format = "mailto:$0" },
		-- file:// URI
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{ regex = [[\bfile://\S*\b]], format = "$0" },
		-- Linkify things that look like URLs with numeric addresses as hosts.
		-- E.g. http://127.0.0.1:8000 for a local development server,
		-- or http://192.168.1.1 for the web interface of many routers.
		{ regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]], format = "$0" },
		-- Make task numbers clickable
		-- The first matched regex group is captured in $1.
		{ regex = [[\b[tT](\d+)\b]], format = "https://example.com/tasks/?t=$1" },
		-- Make username/project paths clickable. This implies paths like the following are for GitHub.
		-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
		-- As long as a full URL hyperlink regex exists above this it should not match a full URL to
		-- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
		{
			regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
			format = "https://www.github.com/$1/$3",
		},
	},
	enable_kitty_keyboard = true,
}

return config
