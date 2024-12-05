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
				autoformat = true,  -- enable or disable auto formatting on start
				codelens = true,    -- enable/disable codelens refresh on start
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
				timeout_ms = 1000,    -- default format timeout
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
					gr = { "<cmd>Telescope lsp_references<CR>", desc = "LSP References" },
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
