-- customize mason plugins
return {
	-- use mason-lspconfig to configure LSP installations
	{
		"williamboman/mason-lspconfig.nvim",
		-- overrides `require("mason-lspconfig").setup(...)`
		opts = {
			ensure_installed = {
				"bashls",
				"dockerls",
				"emmet_ls",
				"html",
				"vimls",
			},
		},
	},
	-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
	{
		"jay-babu/mason-null-ls.nvim",
		-- overrides `require("mason-null-ls").setup(...)`
		opts = {
			ensure_installed = {
				"prettier",
				"prettierd",
			},
			handlers = {
				-- for prettier
				prettier = function()
					require("null-ls").register(require("null-ls").builtins.formatting.prettier.with({
						condition = function(utils)
							return utils.root_has_file("package.json")
									or utils.root_has_file(".prettierrc")
									or utils.root_has_file(".prettierrc.json")
									or utils.root_has_file(".prettierrc.js")
						end,
					}))
				end,
				-- for prettierd
				prettierd = function()
					require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with({
						condition = function(utils)
							return utils.root_has_file("package.json")
									or utils.root_has_file(".prettierrc")
									or utils.root_has_file(".prettierrc.json")
									or utils.root_has_file(".prettierrc.js")
						end,
					}))
				end,
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		-- overrides `require("mason-nvim-dap").setup(...)`
		opts = {
			ensure_installed = {
				"bash",
			},
		},
	},
}
