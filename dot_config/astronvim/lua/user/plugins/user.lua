return {

	-- You can also add new plugins here as well:
	-- Add plugins, the lazy syntax
	-- "andweeb/presence.nvim",
	-- {
	--   "ray-x/lsp_signature.nvim",
	--   event = "BufRead",
	--   config = function()
	--     require("lsp_signature").setup()
	--   end,
	-- },

	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- Default options:
			require("kanagawa").setup({
				compile = true, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				theme = "wave",    -- Load "wave" theme when 'background' option is not set
				background = {
					-- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						-- transparent floating windows
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						NormalDark = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						NeoTreeNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

						-- block-like modern telescope	
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopeNormal = { bg = "none" },
						TelescopeBorder = { fg = "#16B2C3" },

						TelescopePromptTitle = { bg = theme.diff.delete, fg = theme.ui.fg_dim },
						TelescopePromptPrefix = { bg = theme.diff.delete, fg = theme.ui.fg_dim },
						TelescopePromptNormal = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
						TelescopePromptBorder = { bg = "none" },

						TelescopeResultsTitle = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						TelescopeResultsNormal = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
						TelescopeResultsBorder = { bg = "none" },

						TelescopePreviewTitle = { bg = theme.diff.add, fg = theme.ui.fg_dim },
						TelescopePreviewNormal = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
						TelescopePreviewBorder = { bg = "none" },

						-- dark completion menu
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = "#082032" },
					}
				end,
			})
		end,
	},

	{ "phelipetls/vim-hugo",  ft = "htmlhugo" },
	{ "andymass/vim-matchup", after = "nvim-treesitter", event = "User AstroFile" },

	{
		"machakann/vim-sandwich",
		event = "User AstroFile",
		config = function()
			vim.g.sandwich_no_default_key_mappings = 1
		end,
		opts = {}
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
			require('neoclip').setup()
		end,
	},

}
