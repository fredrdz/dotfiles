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
			direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
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
	{
		"lukas-reineke/indent-blankline.nvim",
		optional = true,
		enabled = true,
		config = function()
			local highlight = {
				"desque",
			}

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "desque", { fg = "#16B2C3" })
			end)

			require("ibl").setup({
				indent = { char = "" },
				scope = {
					highlight = highlight,
				},
			})
		end,
	},

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
			vim.g.matchup_matchparen_offscreen = { method = "status" } -- "popup" | "status"
			vim.g.matchup_matchparen_hi_surround_always = 1
			vim.g.matchup_matchparen_deferred = 1
			vim.g.matchup_matchparen_deferred_show_delay = 50
			vim.g.matchup_matchparen_deferred_hide_delay = 700
			vim.g.matchup_surround_enabled = 1
			vim.g.matchup_transmute_enabled = 1
		end,
	},
}
