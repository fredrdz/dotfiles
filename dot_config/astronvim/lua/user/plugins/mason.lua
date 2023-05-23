-- customize mason plugins
return {
	-- use mason-lspconfig to configure LSP installations
	{
		"williamboman/mason-lspconfig.nvim",
		-- overrides `require("mason-lspconfig").setup(...)`
		opts = {
			ensure_installed = {
				"astro",
				"bashls",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"emmet_ls",
				"gopls",
				"jsonls",
				"lua_ls",
				"marksman",
				"svelte",
				"tailwindcss",
				"html",
				"taplo",
				"tsserver",
				"vimls",
				"yamlls"
			},
		},
	},
	-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
	{
		"jay-babu/mason-null-ls.nvim",
		-- overrides `require("mason-null-ls").setup(...)`
		opts = {
			ensure_installed = {
				"gofumpt",
				"goimports",
				"gomodifytags",
				"iferr",
				"impl",
				"prettierd",
				"rustywind",
				"shellcheck",
				"shfmt"
			},
			handlers = {
				-- for prettierd
				prettierd = function()
					local null_ls = require "null-ls"
					null_ls.register(null_ls.builtins.formatting.prettierd.with {
						filetypes = {
							"gohtml",
							"htmlhugo",
							"json",
							"yaml",
						},
						condition = function(utils)
							return utils.root_has_file("package.json")
									or utils.root_has_file(".prettierrc")
									or utils.root_has_file(".prettierrc.config.js")
									or utils.root_has_file(".prettierrc.js")
									or utils.root_has_file(".prettierrc.json")
									or utils.root_has_file(".prettierrc.toml")
									or utils.root_has_file(".prettierrc.yaml")
									or utils.root_has_file(".prettierrc.yml")
						end,
					})
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
				"delve",
				"js"
			},
		},
	},
}
