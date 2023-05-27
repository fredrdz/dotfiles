return function(opts)
	opts.filetypes = require("astronvim.utils").list_insert_unique(opts.filetypes, "gohtml")
	return opts
end
