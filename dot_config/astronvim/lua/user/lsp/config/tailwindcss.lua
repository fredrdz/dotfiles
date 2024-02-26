return function(opts)
	opts.filetypes = require("astronvim.utils").list_insert_unique(opts.filetypes, { "gohtml", "templ" })
	opts.init_options = { userLanguages = { templ = "html" } }
	opts.root_dir = require("lspconfig.util").root_pattern("tailwind.config.js", "tailwind.config.cjs",
		"tailwind.config.ts", "tailwind.config.tsx", "tailwind.config.jsx", "tailwind.config.json", "tailwind.config.yaml",
		"tailwind.config.yml", "tailwind.config.json5")
	return opts
end
