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
			})
		end,
	},
	{ "fredrdz/vim-hugo",     ft = "gohtml" },
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
