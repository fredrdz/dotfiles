-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
---@type LazySpec
return {
	"AstroNvim/astrocommunity",

	-- editing-support
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

	-- completion
	{ import = "astrocommunity.completion.avante-nvim", enabled = true },
	{
		"yetone/avante.nvim",
		dependencies = {
			{
				"AstroNvim/astrocore",
				opts = function(_, opts)
					-- reset prefix for neogen annotations
					opts.mappings.n["<Leader>A"] =
						{ desc = require("astroui").get_icon("Neogen", 1, true) .. "Annotation" }
					-- define the new prefix
					opts.mappings.n["<Leader>a"] = { desc = " Avante" }
				end,
			},
		},
		opts = function(_, opts)
			-- define the new prefix
			local prefix = "<Leader>a"
			-- set the new mappings
			opts.mappings.ask = prefix .. "a"
			opts.mappings.edit = prefix .. "e"
			opts.mappings.refresh = prefix .. "r"
			opts.mappings.focus = prefix .. "f"
			opts.mappings.toggle.default = prefix .. "t"
			opts.mappings.toggle.debug = prefix .. "d"
			opts.mappings.toggle.hint = prefix .. "h"
			opts.mappings.toggle.suggestion = prefix .. "s"
			opts.mappings.toggle.repomap = prefix .. "R"
			opts.mappings.diff.next = "]c"
			opts.mappings.diff.prev = "[c"
			opts.mappings.files.add_current = prefix .. "."
		end,
	},
	{ import = "astrocommunity.completion.codeium-nvim", enabled = true },
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			{
				"AstroNvim/astrocore",
				---@param opts AstroCoreOpts
				opts = function(_, opts)
					local maps = opts.mappings
					if maps and maps.n then
						-- create a temporary table to store new mappings
						local new_mappings = {}
						-- iterate over existing mappings to remap them
						for key, value in pairs(maps.n) do
							if key:match("^<Leader>;") then
								-- create new key by replacing
								local new_key = key:gsub("^<Leader>;", "<Leader>kr")
								new_mappings[new_key] = value
								-- remove old mapping
								maps.n[key] = nil
							end
						end
						-- merge new mappings into the original mappings table
						for new_key, value in pairs(new_mappings) do
							maps.n[new_key] = value
						end
					end
				end,
			},
		},
	},

	-- recipes
	{ import = "astrocommunity.recipes.heirline-nvchad-statusline", enabled = false },
	{ import = "astrocommunity.recipes.auto-session-restore", enabled = true },
	{ import = "astrocommunity.recipes.telescope-lsp-mappings", enabled = true },

	-- lsp
	{ import = "astrocommunity.lsp.garbage-day-nvim", enabled = false },
	{ import = "astrocommunity.lsp.lsp-signature-nvim", enabled = false },

	-- packs
	{ import = "astrocommunity.pack.astro", enabled = true },
	{ import = "astrocommunity.pack.bash", enabled = true },
	{ import = "astrocommunity.pack.cs", enabled = true },
	{ import = "astrocommunity.pack.docker", enabled = true },
	{ import = "astrocommunity.pack.go", enabled = true },
	{ import = "astrocommunity.pack.html-css", enabled = true },
	{ import = "astrocommunity.pack.lua", enabled = true },
	{ import = "astrocommunity.pack.markdown", enabled = true },
	{ import = "astrocommunity.pack.python-ruff", enabled = true },
	{ import = "astrocommunity.pack.svelte", enabled = true },
	{ import = "astrocommunity.pack.tailwindcss", enabled = true },
	{ import = "astrocommunity.pack.toml", enabled = true },
	{ import = "astrocommunity.pack.typescript", enabled = true },
	{ import = "astrocommunity.pack.templ", enabled = false },
	{ import = "astrocommunity.pack.yaml", enabled = true },

	-- diagnostics
	{ import = "astrocommunity.diagnostics.trouble-nvim", enabled = true },

	-- icon
	{ import = "astrocommunity.icon.mini-icons", enabled = true },

	-- indent
	{ import = "astrocommunity.indent.indent-blankline-nvim", enabled = true },
	{ import = "astrocommunity.indent.indent-tools-nvim", enabled = true },
	{ import = "astrocommunity.indent.mini-indentscope", enabled = true },

	-- motion
	{ import = "astrocommunity.motion.leap-nvim", enabled = true },
	{
		"ggandor/leap.nvim",
		dependencies = {
			{
				"AstroNvim/astrocore",
				opts = function(_, opts)
					local new_mappings = {
						n = {
							["m"] = { "<Plug>(leap-forward)", desc = "Leap forward" },
							["M"] = { "<Plug>(leap-backward)", desc = "Leap backward" },
							["gm"] = { "<Plug>(leap-from-window)", desc = "Leap from window" },
						},
						x = {
							["m"] = { "<Plug>(leap-forward)", desc = "Leap forward" },
							["M"] = { "<Plug>(leap-backward)", desc = "Leap backward" },
							["gm"] = { "<Plug>(leap-from-window)", desc = "Leap from window" },
						},
						o = {
							["m"] = { "<Plug>(leap-forward)", desc = "Leap forward" },
							["M"] = { "<Plug>(leap-backward)", desc = "Leap backward" },
							["gm"] = { "<Plug>(leap-from-window)", desc = "Leap from window" },
						},
					}
					-- unbind the default mappings
					local modes = { "n", "x", "o" }
					for _, mode in ipairs(modes) do
						opts.mappings[mode] = opts.mappings[mode] or {}
						opts.mappings[mode]["s"] = nil
						opts.mappings[mode]["S"] = nil
						opts.mappings[mode]["gs"] = nil
					end
					-- merge new mappings into existing ones
					opts.mappings = vim.tbl_deep_extend("force", opts.mappings or {}, new_mappings)
				end,
			},
		},
	},
	{ import = "astrocommunity.motion.mini-move", enabled = true },

	-- project
	{ import = "astrocommunity.project.project-nvim", enabled = true },

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
