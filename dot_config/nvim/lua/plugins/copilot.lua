-- community plugin: copilot-cmp
-- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/completion/copilot-lua-cmp
---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.completion.copilot-cmp", enabled = true },
	-- modify copilot.lua: https://github.com/zbirenbaum/copilot.lua
	{
		"copilot.lua",
		event = "InsertEnter",
		enabled = true,
		opts = {
			panel = {
				enabled = false,
				auto_refresh = true,
				---@class copilot.panel
				---@field position? "top"|"bot"|"left"|"right"|"horizontal"|"vertical"
				layout = {
					position = "bot",
					ratio = 0.20, -- 20% of the screen
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 500,
				keymap = {
					accept = "<CM-a>", -- [a]ccept
					accept_line = "<CM-l>", -- [l]ine
					accept_word = "<CM-w>", -- [w]ord
					prev = "<CM-e>", -- pr[e]v
					next = "<CM-n>", -- [n]ext
					dismiss = "<CM-m>", -- dis[m]iss
				},
			},
		},
	},
}
