return {
	-- Add the community repository of plugin specifications
	"AstroNvim/astrocommunity",
	-- example of imporing a plugin, comment out to use it or add your own
	-- available plugins can be found at https://github.com/AstroNvim/astrocommunity

	-- completion
	{ import = "astrocommunity.completion.copilot-lua-cmp",   enabled = true },
	{ -- further customize the options set by the community
		"copilot.lua",
		event = "InsertEnter",
		opts = {
			panel = {
				enabled = true,
				auto_refresh = true,
				layout = {
					position = "top", -- | top | left | right
					ratio = 0.20,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 300,
			},
		},
	},

	-- lsp
	{ import = "astrocommunity.lsp.garbage-day-nvim",         enabled = true },
	{ import = "astrocommunity.lsp.lsp-signature-nvim",       enabled = true },

	-- packs
	{ import = "astrocommunity.pack.astro",                   enabled = true },
	{ import = "astrocommunity.pack.bash",                    enabled = true },
	{ import = "astrocommunity.pack.go",                      enabled = true },
	{ import = "astrocommunity.pack.html-css",                enabled = true },
	{ import = "astrocommunity.pack.lua",                     enabled = true },
	{ import = "astrocommunity.pack.markdown",                enabled = true },
	{ import = "astrocommunity.pack.svelte",                  enabled = true },
	{ import = "astrocommunity.pack.tailwindcss",             enabled = true },
	{ import = "astrocommunity.pack.toml",                    enabled = true },
	{ import = "astrocommunity.pack.typescript",              enabled = true },
	{ import = "astrocommunity.pack.yaml",                    enabled = true },

	-- diagnostics
	{ import = "astrocommunity.diagnostics.trouble-nvim",     enabled = true },

	-- editing-support
	{ import = "astrocommunity.editing-support.chatgpt-nvim", enabled = true },
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			local cmd = "bws secret get 3fade66a-163f-4419-8566-b0d10166eb0f"
			local bws = vim.fn.system(cmd)
			local api_key = vim.fn.json_decode(bws).value
			-- vim.notify("API Key: " .. api_key, "info", {
			--   title = "OpenAI API Key",
			--   timeout = 5000,
			-- })
			vim.env.OPENAI_API_KEY = api_key
			require("chatgpt").setup({
				edit_with_instructions = {
					diff = false,
					keymaps = {
						close = "<M-c>",
						accept = "<M-y>",
						toggle_diff = "<M-d>",
						toggle_settings = "<M-o>",
						cycle_windows = "<Tab>",
						use_output_as_input = "<M-i>",
					},
				},
				chat = {
					keymaps = {
						close = "<M-c>",
						yank_last = "<M-y>",
						yank_last_code = "<M-a>",
						scroll_up = "<M-u>",
						scroll_down = "<M-d>",
						new_session = "<M-n>",
						cycle_windows = "<Tab>",
						cycle_modes = "<M-m>",
						prev_message = "<M-u>",
						next_message = "<M-d>",
						select_session = "<Enter>",
						rename_session = "r",
						delete_session = "d",
						draft_message = "<M-e>",
						edit_message = "e",
						delete_message = "d",
						toggle_settings = "<M-o>",
						toggle_message_role = "<M-r>",
						toggle_system_role_open = "<M-s>",
						stop_generating = "<M-x>",
					},
				},
				popup_layout = {
					default = "center",
					center = {
						width = "90%",
						height = "90%",
					},
					right = {
						width = "30%",
						width_settings_open = "50%",
					},
				},
				openai_params = {
					model = "gpt-3.5-turbo",
					frequency_penalty = 0,
					presence_penalty = 0,
					max_tokens = 300,
					temperature = 0,
					top_p = 1,
					n = 1,
				},
				openai_edit_params = {
					model = "gpt-3.5-turbo",
					frequency_penalty = 0,
					presence_penalty = 0,
					temperature = 0,
					top_p = 1,
					n = 1,
				},
			})
		end,
	},
	{ import = "astrocommunity.editing-support.neogen",       enabled = true },

	-- indent
	{ import = "astrocommunity.indent.indent-blankline-nvim", enabled = true },
	{ import = "astrocommunity.indent.indent-tools-nvim",     enabled = true },
	{ import = "astrocommunity.indent.mini-indentscope",      enabled = true },

	-- motion
	{ import = "astrocommunity.motion.leap-nvim",             enabled = true },
	{ import = "astrocommunity.motion.mini-move",             enabled = true },

	-- project
	{ import = "astrocommunity.project.project-nvim",         enabled = true },
	{ import = "astrocommunity.project.nvim-spectre",         enabled = true },

	-- syntax
	{ import = "astrocommunity.syntax.hlargs-nvim",           enabled = true },
	{ import = "astrocommunity.syntax.vim-easy-align",        enabled = true },

	-- color
	{ import = "astrocommunity.color.headlines-nvim",         enabled = true },
	{ import = "astrocommunity.color.tint-nvim",              enabled = true },

	-- utility
	{ import = "astrocommunity.utility.noice-nvim",           enabled = true },
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
