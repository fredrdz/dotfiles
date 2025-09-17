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

	{ import = "astrocommunity.editing-support.copilotchat-nvim", enabled = true },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		enabled = true,
		dependencies = {
			{
				"AstroNvim/astrocore",
				---@param opts AstroCoreOpts
				opts = function(_, opts)
					local maps = opts.mappings
					if maps and maps.n then
						-- iterate over existing mappings to remap them
						for key, value in pairs(maps.n) do
							if key:match("^<Leader>P") then
								-- create new key by replacing
								local new_key = key:gsub("^<Leader>P", "<Leader>a")
								maps.n[new_key] = value
								-- remove old mapping
								maps.n[key] = nil
							end
						end
					end
				end,
			},
		},
		opts = {
			model = "gpt-5", -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
			temperature = 0.1, -- GPT result temperature
			prompts = {
				GODRY = {
					description = "Refactor Go code to eliminate duplication and enforce separation of concerns.",
					prompt = "Refactor the following Go code to eliminate duplication and enforce separation of concerns, while strictly following Go idioms (naming conventions, package structure, error handling, minimal interfaces, etc.). Group related logic into well-named functions, types, or packages; remove repeated code by extracting common behavior; ensure comments and exports follow Go style guidelines with the exception that comments within funcs should start with a lowercase; and return only the refactored Go source.",
					system_prompt = "COPILOT_INSTRUCTIONS",
					context = "buffers:go",
				},
			},
		},
	},

	-- comment
	{ import = "astrocommunity.comment.mini-comment", enabled = true },

	-- completion
	{ import = "astrocommunity.completion.copilot-lua-cmp", enabled = true },

	-- FIX: codeium uses nvim-cmp instead of blink-cmp
	--
	-- { import = "astrocommunity.completion.codeium-nvim", enabled = true },
	-- {
	-- 	"Exafunction/codeium.nvim",
	-- 	enabled = true,
	-- 	dependencies = {
	-- 		{
	-- 			"AstroNvim/astrocore",
	-- 			---@param opts AstroCoreOpts
	-- 			opts = function(_, opts)
	-- 				local maps = opts.mappings
	-- 				if maps and maps.n then
	-- 					-- create a temporary table to store new mappings
	-- 					local new_mappings = {}
	-- 					-- iterate over existing mappings to remap them
	-- 					for key, value in pairs(maps.n) do
	-- 						if key:match("^<Leader>;") then
	-- 							-- create new key by replacing
	-- 							local new_key = key:gsub("^<Leader>;", "<Leader>kr")
	-- 							new_mappings[new_key] = value
	-- 							-- remove old mapping
	-- 							maps.n[key] = nil
	-- 						end
	-- 					end
	-- 					-- merge new mappings into the original mappings table
	-- 					for new_key, value in pairs(new_mappings) do
	-- 						maps.n[new_key] = value
	-- 					end
	-- 				end
	-- 			end,
	-- 		},
	-- 	},
	-- },

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

	-- project
	{ import = "astrocommunity.project.project-nvim", enabled = true },

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
