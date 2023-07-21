return {

	-- customize alpha options
	{
		"goolord/alpha-nvim",
		opts = function(_, opts)
			-- customize the dashboard header
			opts.section.header.val = {
				"                       I>. idjrxxnjU@_        ",
				"                      .1({-X(     |b}         ",
				"                      .1||8(|/([i~a[          ",
				"                      ')|\\/ttf/uWU[]i,.      ",
				"                       |f/tffj/v&Ufnnnnj(-l^  ",
				"                      _ki:~]||cWUfunnuvvccccj)",
				"                  <l!fMi     +#1-8jnvvccczzXYY",
				"             `;<]18{vMt   . ~hi   ^<(vzzXXYYYY",
				"        .,>?)/t//t)zWj{'   <o-,_{tnczXXXXYUJJJ",
				"    _!-)trjjjjftf(UWx|/`<!-UcjccczzzzXYUUJJzj{",
				"I_1fnnnnnxrrrrrr/JW/_<I/nuunvccccXXYUUXx(_;'  ",
				"ccccvvuuuunnnf(<na;   .nvuucczXXYYu/]!^       ",
				"zzzzccccn(+;'  ]b:   . xcczzXvf{<:.           ",
				"UYXXXXXzcj)->,{k`     -Yvr(_I`                ",
				"cJUUUUYXXXXzzcUj[_I^ ]p<8                     ",
				".:+)xXJUUUUXzXczzzzxU&)                       ",
				"     `l?|vcUUUUYXXvm&Yu`                      ",
				"          v0{rXJJzw8Ucv'                      ",
				"       . tO    ,<0#YYUY`                      ",
				"        ($urnxrtjw,^>}t`                      ",
			}
			return opts
		end,
	},

	-- You can disable default plugins as follows:
	-- { "max397574/better-escape.nvim", enabled = false },
	--
	-- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
	-- {
	--   "L3MON4D3/LuaSnip",
	-- config = function(plugin, opts)
	--   require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
	--   -- add more custom luasnip configuration such as filetype extend or custom snippets
	--   local luasnip = require "luasnip"
	--   luasnip.filetype_extend("javascript", { "javascriptreact" })
	-- end,
	-- },

	{
		"which-key.nvim",
		opts = {
			window = {
				border = "none", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 0, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
				winblend = 6, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},
		},
	},

	{
		"neo-tree.nvim",
		opts = {
			close_if_last_window = true,
			popup_border_style = "rounded",
			filesystem = {
				filtered_items = {
					always_show = { ".gitignore" },
				},
			},
			window = {
				position = "float",
			},
			highlight_tab = "NeoTreeTabInactive", -- string
			highlight_tab_active = "NeoTreeTabActive", -- string
			highlight_background = "NeoTreeTabInactive", -- string
			highlight_separator = "NeoTreeTabSeparatorInactive", -- string
			highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
		},
	},

	{
		"nvim-notify",
		opts = {
			background_colour = "NotifyBackground",
			fps = 60,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			minimum_width = 50,
			render = "compact", -- allowed: default, minimal, simple, compact
			stages = "fade_in_slide_out",
			timeout = 2000,
			top_down = false,
		},
	},

	{
		"nvim-colorizer.lua",
		opts = {
			user_default_options = {
				-- Available modes for `mode`: foreground, background,  virtualtext
				mode = "background", -- Set the display mode.
				-- Available methods are false / true / "normal" / "lsp" / "both"
				-- True is same as normal
				tailwind = "normal", -- Enable tailwind colors
			},
		},
	},
	{
		"smart-splits.nvim",
		event = "VeryLazy",
		opts = {
			resize_mode = {
				-- key to exit persistent resize mode
				quit_key = "<ESC>",
				-- keys to use for moving in resize mode
				-- in order of left, down, up' right
				resize_keys = { "Left", "Down", "Up", "Right" },
				-- set to true to silence the notifications
				-- when entering/exiting persistent resize mode
				silent = false,
			},
		},
	},
	{
		"toggleterm.nvim",
		keys = { "<F4>" },
		opts = {
			size = 30,
			open_mapping = [[<F4>]],
			shading_factor = 2,
			direction = "horizontal",
		},
	},
}
