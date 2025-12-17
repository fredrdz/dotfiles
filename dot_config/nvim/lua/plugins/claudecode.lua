local toggle_key = "<F2>"
return {
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = {
			terminal_cmd = vim.fn.expand("~/.local/bin/claude"),
			-- Send/Focus Behavior
			-- When true, successful sends will focus the Claude terminal if already connected
			focus_after_send = true,

			-- Terminal Window Configuration
			terminal = {
				---@module "snacks"
				---@type snacks.win.Config|{}
				---@class snacks_win_opts
				---@field position? "bottom" | "right" | "left" | "top" | "float"
				---@field border? "none"|"top"|"right"|"bottom"|"left"|"hpad"|"vpad"|"rounded"|"single"|"double"|"solid"|"shadow"|string[]|false
				snacks_win_opts = {
					position = "float",
					border = "rounded",
					backdrop = 85,
					width = 0.95,
					height = 0.95,
					keys = {
						claude_hide = {
							toggle_key,
							function(self)
								self:hide()
							end,
							mode = "t",
							desc = "Hide",
						},
					},
				},
			},

			-- Diff Integration
			diff_opts = {
				auto_close_on_accept = true,
				vertical_split = false,
				open_in_current_tab = true,
				keep_terminal_focus = true, -- If true, moves focus back to terminal after diff opens
			},
		},
		config = true,
		keys = {
			-- { "<leader>k", nil, desc = "AI/Claude Code" },
			{ "<leader>kc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code", mode = { "n", "x" } },
			{ "<leader>kf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>kr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>kC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>km", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>kb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>ks", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>ks",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
			},
			-- Diff management
			{ "<leader>ka", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>kd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},
}
