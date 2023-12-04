return {
	settings = {
		Lua = {
			hint = { enable = true, arrayIndex = "Disable" },
			diagnostics = {
				globals = { "vim" },
			},
			format = {
				enable = true,
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
	},
}
