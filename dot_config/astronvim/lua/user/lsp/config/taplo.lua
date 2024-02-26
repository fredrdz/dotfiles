return function(opts)
	-- opts.settings = {
	-- }
	opts.evenBetterToml = {
		schema = {
			catalogs = { "https://www.schemastore.org/api/json/catalog.json" },
		},
	}
	return opts
end
