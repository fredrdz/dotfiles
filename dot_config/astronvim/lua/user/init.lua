return {
	-- Configure AstroNvim updates
	updater = {
		remote = "origin",   -- remote to use
		channel = "nightly", -- "stable" or "nightly"
		version = "latest",  -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "nightly",  -- branch name (NIGHTLY ONLY)
		commit = nil,        -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil,   -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_quit = false,   -- automatically quit the current session after a successful update
		remotes = {          -- easily add new remotes to track
			--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
			--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
			--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		},
	},
	-- Set colorscheme to use
	colorscheme = "kanagawa-wave",
	-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
	diagnostics = {
		virtual_text = false,
		underline = true,
	},
	lsp = {
		-- customize lsp formatting options
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					"html",
					-- "markdown",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- "sumneko_lua",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--   return true
			-- end
		},
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright"
		},
	},
	-- Configure require("lazy").setup() options
	lazy = {
		defaults = { lazy = true },
		performance = {
			rtp = {
				-- customize default disabled vim plugins
				disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
			},
		},
	},
	-- This function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
		-- Set up custom filetypes
		-- vim.filetype.add {
		--   extension = {
		--     foo = "fooscript",
		--   },
		--   filename = {
		--     ["Foofile"] = "fooscript",
		--   },
		--   pattern = {
		--     ["~/%.config/foo/.*"] = "fooscript",
		--   },
		-- }
		-- create an augroup to easily manage autocommands

		vim.api.nvim_create_augroup("autohidetabline", { clear = true })
		-- create a new autocmd on the "User" event
		vim.api.nvim_create_autocmd("User", {
			desc = "Hide tabline when only one buffer and one tab", -- nice description
			-- triggered when vim.t.bufs is updated
			pattern = "AstroBufsUpdated",                        -- the pattern is the name of our User autocommand events
			group = "autohidetabline",                           -- add the autocmd to the newly created augroup
			callback = function()
				-- if there is more than one buffer in the tab, show the tabline
				-- if there are 0 or 1 buffers in the tab, only show the tabline if there is more than one vim tab
				local new_showtabline = #vim.t.bufs > 1 and 2 or 1
				-- check if the new value is the same as the current value
				if new_showtabline ~= vim.opt.showtabline:get() then
					-- if it is different, then set the new `showtabline` value
					vim.opt.showtabline = new_showtabline
				end
			end,
		})
	end,
}
