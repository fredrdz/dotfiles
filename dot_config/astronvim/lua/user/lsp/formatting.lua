-- customize lsp formatting options
return {
	-- control auto formatting on save
	format_on_save = {
		enabled = true, -- enable or disable format on save globally
		allow_filetypes = { -- enable format on save for specified filetypes only
			-- "go",
		},
		ignore_filetypes = { -- disable format on save for specified filetypes
			-- "markdown",
		},
	},

	disabled = { -- disable formatting capabilities for the listed language servers
		-- "sumneko_lua",
	},

	timeout_ms = 1000, -- default format timeout

	filter = function(client) -- fully override the default formatting function
		-- enable formatting for a specific file on a specific server
		-- if vim.bo.filetype == "lua" then
		--   return client.name == "lua_ls"
		-- end
		-- if vim.bo.filetype == "toml" then
		--   return client.name == "taplo"
		-- end
		if vim.bo.filetype == "yaml" or "json" or "lua" or "toml" then
			return client.name == "null-ls"
		end
		-- enable all other clients
		return true
	end,
}
