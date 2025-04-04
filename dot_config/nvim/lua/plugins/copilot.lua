-- community plugin: copilot-lua-cmp
-- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/completion/copilot-lua-cmp
---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.completion.copilot-cmp", enabled = true },

	-- call in copilot.lua: https://github.com/zbirenbaum/copilot.lua
	-- modify copilot config in copilot-lua-cmp
	--
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
					accept = "<M-N>",
					accept_line = "<M-n>",
					accept_word = "<M-o>",
					prev = "<M-e>",
					next = "<M-i>",
					dismiss = "<M-m>",
				},
			},
		},
	},
}
