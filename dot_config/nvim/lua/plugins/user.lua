-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
	{
		"andweeb/presence.nvim",
		{
			"ray-x/lsp_signature.nvim",
			event = "BufRead",
			config = function()
				require("lsp_signature").setup()
			end,
		},
	},

	{
		"stevearc/aerial.nvim",
		opts = {
			layout = {
				default_direction = "float",
				resize_to_content = true,
				min_width = 10,
				max_width = { 50, 0.50 },
				width = nil,
			},
			close_on_select = true,
			-- folding
			manage_folds = true,
			link_folds_to_tree = true,
			link_tree_to_folds = true,
		},
	},

	{
		"folke/snacks.nvim",
		lazy = false,
		opts = {
			dashboard = {
				preset = {
					header = table.concat({
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
					}, "\n"),
				},
			},
			---@class snacks.indent.Config
			---@field enabled? boolean
			indent = {
				indent = {
					enabled = true, -- enable indent guides
					char = "",
					only_scope = true, -- only show indent guides of the scope
					only_current = true, -- only show indent guides in the current window
					hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
				},

				-- animate scopes. Enabled by default for Neovim >= 0.10
				-- Works on older versions but has to trigger redraws during animation.
				---@class snacks.indent.animate
				---@field enabled? boolean
				--- * out: animate outwards from the cursor
				--- * up: animate upwards from the cursor
				--- * down: animate downwards from the cursor
				--- * up_down: animate up or down based on the cursor position
				---@field style? "out"|"up_down"|"down"|"up"
				animate = {
					enabled = true,
					style = "down",
					easing = "linear",
					duration = {
						step = 20, -- ms per step
						total = 500, -- maximum duration
					},
				},
				---@class snacks.indent.Scope.Config
				scope = {
					enabled = true, -- enable highlighting the current scope
					priority = 200,
					char = "│",
					underline = false, -- underline the start of the scope
					only_current = true, -- only show scope in the current window
					hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
				},
				chunk = {
					-- when enabled, scopes will be rendered as chunks, except for the
					-- top-level scope which will be rendered as a scope.
					enabled = true,
					-- only show chunk scopes in the current window
					only_current = true,
					priority = 200,
					hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
					char = {
						-- corner_top = "┌",
						-- corner_bottom = "└",
						corner_top = "╭",
						corner_bottom = "╰",
						horizontal = "─",
						vertical = "│",
						arrow = ">",
					},
				},
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
					always_show = {
						".gitattributes",
						".gitignore",
						".luacheckrc",
						".prettierignore",
						".prettierrc.json",
						".stylua.toml",
						".taplo.toml",
					},
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

	-- TODO: update to snacks
	-- https://github.com/folke/snacks.nvim/blob/main/docs/notify.md
	--
	-- {
	-- 	"nvim-notify",
	-- 	opts = {
	-- 		background_colour = "NotifyBackground",
	-- 		fps = 60,
	-- 		icons = {
	-- 			DEBUG = "",
	-- 			ERROR = "",
	-- 			INFO = "",
	-- 			TRACE = "✎",
	-- 			WARN = "",
	-- 		},
	-- 		level = 2,
	-- 		max_height = function()
	-- 			return math.floor(vim.o.lines * 0.75)
	-- 		end,
	-- 		max_width = function()
	-- 			return math.floor(vim.o.columns * 0.75)
	-- 		end,
	-- 		minimum_width = 50,
	-- 		render = "compact", -- allowed: default, minimal, simple, compact
	-- 		stages = "fade_in_slide_out",
	-- 		timeout = 2000,
	-- 		top_down = false,
	-- 	},
	-- },

	-- TODO: update to nvim-highlight-colors
	-- https://github.com/brenoprata10/nvim-highlight-colors
	--
	-- {
	-- 	"nvim-colorizer.lua",
	-- 	opts = {
	-- 		user_default_options = {
	-- 			-- Available modes for `mode`: foreground, background,  virtualtext
	-- 			mode = "background", -- Set the display mode.
	-- 			-- Available methods are false / true / "normal" / "lsp" / "both"
	-- 			-- True is same as normal
	-- 			tailwind = "normal", -- Enable tailwind colors
	-- 		},
	-- 	},
	-- },

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
		---@class toggleterm.opts
		---@field direction? "vertical" | "horizontal" | "tab" | "float"
		opts = {
			size = 30,
			open_mapping = [[<F4>]],
			shading_factor = 2,
			direction = "float",
		},
	},

	-- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
	{
		"L3MON4D3/LuaSnip",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.luasnip")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom luasnip configuration such as filetype extend or custom snippets
			local luasnip = require("luasnip")
			luasnip.filetype_extend("javascript", { "javascriptreact" })
		end,
	},

	{ "windwp/nvim-autopairs", optional = true, enabled = false },

	-- == Custom Plugins ==
	{
		"echasnovski/mini.jump",
		event = "User",
		version = false,
		enabled = true,
		config = function()
			require("mini.jump").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		version = false,
		enabled = true,
		config = function()
			require("mini.pairs").setup()
		end,
	},

	{ "fredrdz/vim-hugo", ft = "gohtml" },
	{ "tjdevries/templ.nvim", ft = "templ" },

	{
		"andymass/vim-matchup",
		after = "nvim-treesitter",
		event = "User AstroFile",
		init = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" } -- "popup" | "status"
			vim.g.matchup_matchparen_hi_surround_always = 1
			vim.g.matchup_matchparen_deferred = 1
			vim.g.matchup_matchparen_deferred_show_delay = 50
			vim.g.matchup_matchparen_deferred_hide_delay = 700
			vim.g.matchup_surround_enabled = 1
			vim.g.matchup_transmute_enabled = 1
		end,
	},
}
