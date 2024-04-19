-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
	"AstroNvim/astrolsp",
	---@type AstroLSPOpts
	opts = {
		-- Configuration table of features provided by AstroLSP
		features = {
			autoformat = true, -- enable or disable auto formatting on start
			codelens = true, -- enable/disable codelens refresh on start
			inlay_hints = true, -- enable/disable inlay hints on start
			semantic_tokens = true, -- enable/disable semantic token highlighting
		},
		-- customize lsp formatting options
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					-- "python",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- disable lua_ls formatting capability if you want to use StyLua to format your lua code
				"lua_ls",
			},
			timeout_ms = 1000, -- default format timeout
			filter = function(client) -- fully override the default formatting function
				local filetypes = {
					toml = "taplo",
					yaml = "null-ls",
					json = "null-ls",
					css = "null-ls",
					markdown = "null-ls",
					scss = "null-ls",
					javascript = "null-ls",
					typescript = "null-ls",
					lua_ls = "stylua",
				}
				local filetype = vim.bo.filetype
				return filetypes[filetype] == client.name or true
			end,
		},
		-- customize language server configuration options passed to `lspconfig`
		---@diagnostic disable: missing-fields
		config = {},
		-- Configure buffer local auto commands to add when attaching a language server
		autocmds = {},
		-- mappings to be set up on attaching of a language server
		mappings = {
			-- n = {
			-- 	gl = {
			-- 		function()
			-- 			vim.diagnostic.open_float()
			-- 		end,
			-- 		desc = "Hover diagnostics",
			-- 	},
			-- },
		},
	},
}
