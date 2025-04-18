-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

vim.filetype.add({
	extension = {
		gohtml = "gohtml",
		templ = "templ",
	},
})

---@type LazySpec
return {
	{
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			filetypes = {
				pattern = {
					[".*.gohtml"] = "gohtml",
					[".*.templ"] = "templ",
				},
			},
		},
	},

	{
		"AstroNvim/astrolsp",
		---@type AstroLSPOpts
		opts = {
			-- Configuration table of features provided by AstroLSP
			features = {
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
				timeout_ms = 5000, -- default format timeout
				filter = function(client) -- fully override the default formatting function
					if vim.bo.filetype == "astro" then
						return client.name == "astro"
					end
					if vim.bo.filetype == "typescript" then
						return client.name == "vtsls"
					end
					if vim.bo.filetype == "toml" then
						return client.name == "taplo"
					end

					-- enable all other clients
					return true
				end,
				-- filter = function(client) -- fully override the default formatting function
				--   return true
				-- end
			},

			-- customize language server configuration options passed to `lspconfig`
			---@diagnostic disable: missing-fields
			config = {
				emmet_ls = {
					filetypes = {
						"astro",
						"css",
						"eruby",
						"gohtml",
						"html",
						"htmldjango",
						"javascriptreact",
						"less",
						"pug",
						"sass",
						"scss",
						"svelte",
						"templ",
						"typescriptreact",
						"vue",
					},
				},
				html = {
					filetypes = { "gohtml", "html", "templ" },
				},
				htmx = {
					filetypes = { "gohtml", "html", "templ" },
				},
				tailwindcss = {
					init_options = { userLanguages = { templ = "html" } },
				},
				css = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				scss = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				less = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				Lua = {
					hint = { enable = true, arrayIndex = "Disable" },
					diagnostics = {
						globals = { "vim" },
					},
					format = {
						-- NOTE: the values should be a string!
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
							quote_style = "double",
							max_line_length = "120",
							end_of_line = "lf",
						},
					},
				},
				taplo = {
					evenBetterToml = {
						schema = {
							catalogs = { "https://www.schemastore.org/api/json/catalog.json" },
						},
					},
				},
			},

			autocmds = {},

			mappings = {

				n = {
					gd = {
						function()
							require("snacks").picker.lsp_definitions()
						end,
						desc = "Goto Definition",
					},
					gD = {
						function()
							require("snacks").picker.lsp_declarations()
						end,
						desc = "Goto Declaration",
					},
					gr = {
						function()
							require("snacks").picker.lsp_references()
						end,
						nowait = true,
						desc = "References",
					},
					gI = {
						function()
							require("snacks").picker.lsp_implementations()
						end,
						desc = "Goto Implementation",
					},
					gy = {
						function()
							require("snacks").picker.lsp_type_definitions()
						end,
						desc = "Goto T[y]pe Definition",
					},
					-- {
					-- 	"<leader>ss",
					-- 	function()
					-- 		require("snacks").picker.lsp_symbols()
					-- 	end,
					-- 	desc = "LSP Symbols",
					-- },
					-- {
					-- 	"<leader>sS",
					-- 	function()
					-- 		require("snacks").picker.lsp_workspace_symbols()
					-- 	end,
					-- 	desc = "LSP Workspace Symbols",
					-- },
					ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
					gk = {
						function()
							require("aerial").toggle()
						end,
						desc = "Symbols Outline",
					},
				},
			},
		},
	},
}
