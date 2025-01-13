-- community plugin: copilot-lua-cmp
-- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/completion/copilot-lua-cmp
---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.completion.copilot-lua-cmp", enabled = true },

	-- call in copilot.lua: https://github.com/zbirenbaum/copilot.lua
	-- modify copilot config in copilot-lua-cmp
	{
		"copilot.lua",
		event = "InsertEnter",
		enabled = true,
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
				hide_during_completion = true,
				debounce = 500,
				keymap = {
					accept = "<M-CR>",
					accept_word = "<M-j>",
					accept_line = "<M-l>",
					prev = "<M-k>",
					next = "<M-h>",
					dismiss = "<M-m>",
				},
			},
		},

		-- modify cmp config in copilot-lua-cmp
		{
			"hrsh7th/nvim-cmp",
			dependencies = { "zbirenbaum/copilot.lua" },
			opts = function(_, opts)
				local cmp, copilot = require("cmp"), require("copilot.suggestion")

				-- ensure the mapping table exists
				opts.mapping = opts.mapping or {}

				-- unbind specific default mappings set by copilot-lua-cmp
				opts.mapping["<C-x>"] = nil
				opts.mapping["<C-z>"] = nil
				opts.mapping["<C-right>"] = nil
				opts.mapping["<C-l>"] = nil
				opts.mapping["<C-down>"] = nil
				opts.mapping["<C-j>"] = nil
				opts.mapping["<C-c>"] = nil

				-- define custom mappings with copilot visibility checks
				opts.mapping["<M-CR>"] = cmp.mapping(function(fallback)
					if copilot.is_visible() then
						copilot.accept()
					else
						fallback()
					end
				end, { "i", "s" })

				opts.mapping["<M-j>"] = cmp.mapping(function(fallback)
					if copilot.is_visible() then
						copilot.accept_word()
					else
						fallback()
					end
				end, { "i", "s" })

				opts.mapping["<M-l>"] = cmp.mapping(function(fallback)
					if copilot.is_visible() then
						copilot.accept_line()
					else
						fallback()
					end
				end, { "i", "s" })

				opts.mapping["<M-k>"] = cmp.mapping(function(fallback)
					if copilot.is_visible() then
						copilot.prev()
					else
						fallback()
					end
				end, { "i", "s" })

				opts.mapping["<M-h>"] = cmp.mapping(function(fallback)
					if copilot.is_visible() then
						copilot.next()
					else
						fallback()
					end
				end, { "i", "s" })

				opts.mapping["<M-m>"] = cmp.mapping(function(fallback)
					if copilot.is_visible() then
						copilot.dismiss()
					else
						fallback()
					end
				end, { "i", "s" })

				return opts
			end,
		},
	},
}
