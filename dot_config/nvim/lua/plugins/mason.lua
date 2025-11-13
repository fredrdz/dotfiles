-- Customize Mason

---@type LazySpec
return {
	-- use mason-tool-installer for automatically installing Mason packages
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- overrides `require("mason-tool-installer").setup(...)`
		opts = {
			-- Make sure to use the names found in `:Mason`
			ensure_installed = {
				-- install language servers
				"astro-language-server",
				"bash-language-server",
				"css-lsp",
				"csharp-language-server",
				"docker-compose-language-service",
				"dockerfile-language-server",
				"emmet-language-server",
				"gopls",
				"html-lsp",
				"htmx-lsp",
				"json-lsp",
				"jsonld-lsp",
				"lua-language-server",
				"marksman",
				"svelte-language-server",
				"tailwindcss-language-server",
				"taplo",
				"templ",
				"vim-language-server",
				"vtsls",
				"yaml-language-server",

				-- install formatters
				"golines",
				"goimports",
				"gomodifytags",
				"iferr",
				"impl",
				"jq",
				"luacheck",
				"prettierd",
				"rustywind",
				"shellcheck",
				"shfmt",

				-- install debuggers
				"bash-debug-adapter",
				"delve",

				-- install any other package
				"tree-sitter-cli",
			},
		},
	},
}
