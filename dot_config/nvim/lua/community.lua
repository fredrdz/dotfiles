-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
---@type LazySpec
return {
	"AstroNvim/astrocommunity",

	-- editing-support
	{ import = "astrocommunity.editing-support.todo-comments-nvim", enabled = true },
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
	},

	-- completion
	{ import = "astrocommunity.completion.avante-nvim", enabled = false },
	{
		"yetone/avante.nvim",
		enabled = false,
		dependencies = {
			{
				"AstroNvim/astrocore",
				opts = function(_, opts)
					local ui = require("astroui")
					-- reset prefix for neogen annotations
					opts.mappings.n["<Leader>A"] = {
						desc = ui.get_icon("Neogen", 1, true) .. "Annotation",
					}
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

			-- behavior
			opts.behaviour = {
				auto_suggestions = false, -- experimental stage
				auto_set_highlight_group = true,
				auto_set_keymaps = true,
				auto_apply_diff_after_generation = false,
				support_paste_from_clipboard = true,
				minimize_diff = false, -- whether to remove unchanged lines when applying a code block
			}

			-- base settings
			---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
			opts.provider = "claude"
			opts.auto_suggestions_provider = "claude"

			-- ai providers
			opts.openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4o",
				timeout = 30000, -- timeout in milliseconds
				temperature = 0,
				max_tokens = 8192,
			}
			opts.copilot = {
				endpoint = "https://api.githubcopilot.com",
				model = "gpt-4o-2024-08-06",
				proxy = nil, -- [protocol://]host[:port] Use this proxy
				allow_insecure = false, -- allow insecure server connections
				timeout = 30000, -- timeout in milliseconds
				temperature = 0,
				max_tokens = 8192,
			}
			opts.claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-3-5-sonnet-20241022",
				timeout = 30000, -- timeout in milliseconds
				temperature = 0,
				max_tokens = 8000,
			}

			-- window settings
			opts.windows = {
				input = {
					prefix = " ",
					height = 10, -- height of the input window in vertical layout
				},
				ask = {
					floating = false, -- open the 'AvanteAsk' prompt in a floating window
				},
			}
		end,
	},

	{ import = "astrocommunity.completion.codeium-nvim", enabled = true },
	{
		"Exafunction/codeium.nvim",
		enabled = true,
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
	{ import = "astrocommunity.recipes.auto-session-restore", enabled = true },
	{ import = "astrocommunity.recipes.telescope-lsp-mappings", enabled = true },

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

	-- icon
	{ import = "astrocommunity.icon.mini-icons", enabled = true },

	-- indent
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

	-- register
	{ import = "astrocommunity.register.nvim-neoclip-lua", enabled = true },

	-- scrolling
	{ import = "astrocommunity.scrolling.mini-animate", enabled = true },

	-- search
	{ import = "astrocommunity.search.nvim-spectre", enabled = true },

	-- syntax
	{ import = "astrocommunity.syntax.hlargs-nvim", enabled = true },
	{ import = "astrocommunity.syntax.vim-easy-align", enabled = true },
	{ import = "astrocommunity.syntax.vim-sandwich", enabled = false },

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
