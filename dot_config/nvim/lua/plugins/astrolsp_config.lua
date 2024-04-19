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
		optional = true,
		---@param opts AstroLSPOpts
		opts = function(_, opts)
			opts.config = {
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
			}
		end,
	},
}
