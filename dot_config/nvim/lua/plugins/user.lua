-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
	-- == Overriding Plugins ==
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
			opts.section.buttons.val = {
				opts.button("LDR S f", "  Find Session"),
				opts.button("LDR S l", "  Last Session"),
				opts.button("LDR f '", "  Bookmarks"),
				opts.button("LDR f f", "  Find File"),
				opts.button("LDR f o", "󰈙  Recents"),
				opts.button("LDR f w", "󰈭  Find Word"),
			}
			return opts
		end,
	},

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
			direction = "tab",
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

	{
		"windwp/nvim-autopairs",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom autopairs configuration such as custom rules
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			npairs.add_rules(
				{
					Rule("$", "$", { "tex", "latex" })
						-- don't add a pair if the next character is %
						:with_pair(cond.not_after_regex("%%"))
						-- don't add a pair if  the previous character is xxx
						:with_pair(
							cond.not_before_regex("xxx", 3)
						)
						-- don't move right when repeat character
						:with_move(cond.none())
						-- don't delete if the next character is xx
						:with_del(cond.not_after_regex("xx"))
						-- disable adding a newline when you press <cr>
						:with_cr(cond.none()),
				},
				-- disable for .vim files, but it work for another filetypes
				Rule("a", "a", "-vim")
			)
		end,
	},

	-- == Custom Plugins ==

	{ "fredrdz/vim-hugo", ft = "gohtml" },
	{ "tjdevries/templ.nvim", ft = "templ" },

	{ "andymass/vim-matchup", after = "nvim-treesitter", event = "User AstroFile" },

	{
		"machakann/vim-sandwich",
		event = "User AstroFile",
		config = function()
			vim.g.sandwich_no_default_key_mappings = 1
		end,
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		event = "User AstroFile",
		cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
	},

	{
		"AckslD/nvim-neoclip.lua",
		event = "User AstroFile",
		after = "telescope.nvim",
		config = function()
			require("neoclip").setup()
		end,
	},
}
