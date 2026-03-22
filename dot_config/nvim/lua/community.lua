-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
---@type LazySpec
return {
	"AstroNvim/astrocommunity",

	-- editing-support
	{ import = "astrocommunity.editing-support.todo-comments-nvim", enabled = true },
	{ import = "astrocommunity.editing-support.mini-splitjoin", enabled = true },
	{ import = "astrocommunity.editing-support.neogen", enabled = true },
	{
		"danymat/neogen", -- for annotations
		dependencies = {
			{
				"AstroNvim/astrocore",
				---@param opts AstroCoreOpts
				opts = function(_, opts)
					local maps = opts.mappings
					if maps and maps.n then
						-- iterate over existing mappings to remap them
						for key, value in pairs(maps.n) do
							if key:match("^<Leader>a") then
								-- create new key by replacing
								local new_key = key:gsub("^<Leader>a", "<Leader>A")
								maps.n[new_key] = value
								-- remove old mapping
								maps.n[key] = nil
							end
						end
					end
				end,
			},
		},
	},

	-- comment
	{ import = "astrocommunity.comment.mini-comment", enabled = true },

	-- completion
	{ import = "astrocommunity.completion.copilot-lua-cmp", enabled = true },

	-- docker
	{ import = "astrocommunity.docker.lazydocker", enabled = true },

	-- recipes
	{ import = "astrocommunity.recipes.auto-session-restore", enabled = true },
	{ import = "astrocommunity.recipes.vscode-icons", enabled = true },

	-- lsp
	{ import = "astrocommunity.lsp.lsp-signature-nvim", enabled = true },

	-- packs
	{ import = "astrocommunity.pack.astro", enabled = true },
	{ import = "astrocommunity.pack.bash", enabled = true },
	{ import = "astrocommunity.pack.cs", enabled = true },
	{ import = "astrocommunity.pack.chezmoi", enabled = true },
	{ import = "astrocommunity.pack.docker", enabled = true },
	{ import = "astrocommunity.pack.go", enabled = true },
	{
		-- Patch nvim-dap-go to fix deprecation warning:
		-- "vim.lsp.buf_get_clients() is deprecated"
		-- Upstream (leoluz/nvim-dap-go) still uses the deprecated API in
		-- dap-go-ts.lua:165. Neovim 0.10+ replaced it with vim.lsp.get_clients().
		-- This override replaces get_root_dir() with the modern equivalent.
		-- TODO: Remove this once upstream merges a fix.
		"leoluz/nvim-dap-go",
		config = function(_, opts)
			require("dap-go").setup(opts)
			local dap_go_ts = require("dap-go-ts")
			dap_go_ts.get_root_dir = function()
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				local client = clients[1]
				if client == nil then
					error({ error_msg = "lsp client not attached" })
				end
				if not client.config.root_dir then
					error({ error_msg = "lsp root_dir not defined" })
				end
				return client.config.root_dir
			end
		end,
	},
	{ import = "astrocommunity.pack.golangci-lint", enabled = true },
	{ import = "astrocommunity.pack.html-css", enabled = true },
	{ import = "astrocommunity.pack.lua", enabled = true },
	{ import = "astrocommunity.pack.markdown", enabled = true },
	{ import = "astrocommunity.pack.python.base", enabled = true },
	{ import = "astrocommunity.pack.python.basedpyright", enabled = true },
	{ import = "astrocommunity.pack.python.ruff", enabled = true },
	{ import = "astrocommunity.pack.svelte", enabled = true },
	{ import = "astrocommunity.pack.tailwindcss", enabled = true },
	{ import = "astrocommunity.pack.toml", enabled = true },
	{ import = "astrocommunity.pack.typescript", enabled = true },
	{ import = "astrocommunity.pack.templ", enabled = true },
	{ import = "astrocommunity.pack.yaml", enabled = true },

	-- diagnostics
	{ import = "astrocommunity.diagnostics.trouble-nvim", enabled = true },

	-- indent
	{ import = "astrocommunity.indent.indent-tools-nvim", enabled = true },

	-- motion
	{ import = "astrocommunity.motion.leap-nvim", enabled = true },
	{ import = "astrocommunity.motion.mini-move", enabled = true },
	{ import = "astrocommunity.motion.mini-surround", enabled = true },
	{
		"echasnovski/mini.surround",
		enabled = true,
		dependencies = {
			{ "AstroNvim/astroui", opts = { icons = { Surround = "󰑤" } } },
			{
				"AstroNvim/astrocore",
				opts = function(_, opts)
					local prefix = "<leader>m"
					local maps = opts.mappings
					local ui = require("astroui")
					maps.n[prefix] = {
						desc = ui.get_icon("Surround", 1, true) .. "Surround",
					}
					maps.x[prefix] = {
						desc = ui.get_icon("Surround", 1, true) .. "Surround",
					}
				end,
			},
		},
		opts = function(_, opts)
			local prefix = "<leader>m"
			opts.mappings = {
				add = prefix .. "a", -- add surrounding in Normal and Visual modes
				delete = prefix .. "d", -- delete surrounding
				find = prefix .. "f", -- find surrounding (to the right)
				find_left = prefix .. "F", -- find surrounding (to the left)
				highlight = prefix .. "h", -- highlight surrounding
				replace = prefix .. "r", -- replace surrounding
				update_n_lines = prefix .. "n", -- update `n_lines`
			}
		end,
	},

	-- scrolling
	{ import = "astrocommunity.scrolling.mini-animate", enabled = true },

	-- search
	{ import = "astrocommunity.search.nvim-spectre", enabled = true },

	-- syntax
	{ import = "astrocommunity.syntax.hlargs-nvim", enabled = true },
	{ import = "astrocommunity.syntax.vim-easy-align", enabled = true },

	-- color
	{ import = "astrocommunity.color.headlines-nvim", enabled = true },
	{ import = "astrocommunity.color.tint-nvim", enabled = true },

	-- utility
	{ import = "astrocommunity.utility.noice-nvim", enabled = true },
	{
		"noice.nvim",
		opts = function(_, opts)
			opts.presets.bottom_search = false
			opts.presets.command_palette = false
			opts.long_message_to_split = true
			opts.presets.lsp_doc_border = true
			opts.presets.inc_rename = true
			opts.lsp.hover = { silent = true }
			opts.lsp.signature = { enabled = false }
			return opts
		end,
	},
}
