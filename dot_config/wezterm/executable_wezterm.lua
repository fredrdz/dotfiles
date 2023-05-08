local wezterm = require("wezterm")

-- Set up keyboard shortcuts
local act = wezterm.action
local mykeys = {
	{
		key = "Enter",
		mods = "SHIFT|CTRL",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{ key = "LeftArrow",  mods = "ALT|CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "ALT|CTRL", action = act.ActivateTabRelative(1) },
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

-- Set up my tab style
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

local config = {
	term = "wezterm",
	audible_bell = "Disabled",
	window_close_confirmation = "NeverPrompt",
	check_for_updates = true,
	automatically_reload_config = true,
	hide_tab_bar_if_only_one_tab = true,
	animation_fps = 60,
	max_fps = 60,
	color_scheme = "kanagawabones",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = true,
	keys = mykeys,
	mouse_bindings = mymouse,
	-- Pad window to avoid the content to be too close to the border,
	-- so it's easier to see and select.
	window_padding = { left = 1, right = 1, top = 1, bottom = 1 },
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	window_background_opacity = 0.98,
	text_background_opacity = 1,
	scrollback_lines = 3500,
	enable_scroll_bar = true,
	harfbuzz_features = {
		"zero", -- Use a slashed zero '0' (instead of dotted)
		"kern", -- (default) kerning (todo check what is really is)
		"liga", -- (default) ligatures
		"clig", -- (default) contextual ligatures
	},
	-- cursor settings
	default_cursor_style = "BlinkingBlock",
	-- font settings
	font = wezterm.font {
		family = 'JetBrains Mono',
		weight = 'Medium',
	},
	font_size = 14,
	freetype_load_target = "Light",
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
		{ regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",    format = "$0" },
		-- linkify email addresses
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{ regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],                format = "mailto:$0" },
		-- file:// URI
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{ regex = [[\bfile://\S*\b]],                           format = "$0" },
		-- Linkify things that look like URLs with numeric addresses as hosts.
		-- E.g. http://127.0.0.1:8000 for a local development server,
		-- or http://192.168.1.1 for the web interface of many routers.
		{ regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]], format = "$0" },
		-- Make task numbers clickable
		-- The first matched regex group is captured in $1.
		{ regex = [[\b[tT](\d+)\b]],                            format = "https://example.com/tasks/?t=$1" },
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
