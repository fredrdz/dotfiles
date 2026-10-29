local toggle_key = "<F2>"

-- Size of directional splits (fraction of editor width/height)
local split_size = 0.5

-- Window holding the Claude buffer when docked to a side via <leader>k<Arrow>
local claude_split_win = nil

local function claude_bufnr()
	return require("claudecode.terminal").get_active_terminal_bufnr()
end

local function close_claude_split()
	if claude_split_win and vim.api.nvim_win_is_valid(claude_split_win) then
		vim.api.nvim_win_close(claude_split_win, true)
	end
	claude_split_win = nil
end

-- Float toggle: un-dock a side split back to the float, else show/hide the float
local function toggle_claude_float()
	local terminal = require("claudecode.terminal")
	if claude_split_win and vim.api.nvim_win_is_valid(claude_split_win) then
		close_claude_split()
		terminal.open()
		return
	end
	terminal.simple_toggle()
end

-- Dock the running Claude terminal to a side; starts Claude first if needed
local function dock_claude(side)
	local terminal = require("claudecode.terminal")
	if not claude_bufnr() then
		terminal.open()
	end
	local bufnr = claude_bufnr()
	if not bufnr then
		return
	end

	-- Close the plugin-owned float and any previous dock; the process keeps running.
	-- A config-hidden float still pins the terminal to the float's size, so close it
	-- via Snacks' own hide; the plugin re-creates the float on the next show.
	close_claude_split()
	local term = require("claudecode.terminal.snacks")._get_terminal_for_test()
	if term and term.win and vim.api.nvim_win_is_valid(term.win) and term._cc and term._cc.orig_hide then
		term._cc.kind = "float"
		term._cc.orig_hide(term)
	end

	local horizontal = side == "top" or side == "bottom"
	local lead = (side == "top" or side == "left") and "topleft " or "botright "
	if horizontal then
		vim.cmd(lead .. math.floor(vim.o.lines * split_size) .. "split")
	else
		vim.cmd(lead .. math.floor(vim.o.columns * split_size) .. "vsplit")
	end
	claude_split_win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(claude_split_win, bufnr)
	vim.cmd("startinsert")
end

return {
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = {
			-- Hide tmux from Claude: it otherwise wraps OSC 52/777 in tmux DCS passthrough,
			-- which Neovim's :terminal can't unwrap and prints as text (osc-relay forwards instead)
			terminal_cmd = "env -u TMUX -u TERM_PROGRAM " .. vim.fn.expand("~/.local/bin/claude"),
			-- Send/Focus Behavior
			focus_after_send = true,

			-- Terminal Window Configuration
			terminal = {
				provider = "snacks",
				-- Default window: centered float
				snacks_win_opts = {
					position = "float",
					width = 0.92,
					height = 0.92,
					border = "rounded",
					keys = {
						claude_hide = { toggle_key, toggle_claude_float, mode = "t", desc = "Hide Claude" },
						-- Cmd+V with an image-only clipboard reaches Neovim as <M-v> (Ghostty passes the
						-- key through, tmux re-encodes it); send Ctrl+V so Claude reads the image itself
						claude_image_paste = {
							"<M-v>",
							function()
								vim.fn.chansend(vim.b.terminal_job_id, "\22")
							end,
							mode = "t",
							desc = "Paste image into Claude",
						},
					},
				},
			},

			-- Diff Integration
			diff_opts = {
				auto_close_on_accept = true,
				vertical_split = true,
				open_in_current_tab = true,
				keep_terminal_focus = true,
			},
		},
		config = true,
		keys = {
			{ toggle_key, toggle_claude_float, desc = "Claude Code (float)", mode = { "n", "x" } },
			{ "<leader>kc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>kf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>k<Up>", function() dock_claude("top") end, desc = "Claude: dock top" },
			{ "<leader>k<Down>", function() dock_claude("bottom") end, desc = "Claude: dock bottom" },
			{ "<leader>k<Left>", function() dock_claude("left") end, desc = "Claude: dock left" },
			{ "<leader>k<Right>", function() dock_claude("right") end, desc = "Claude: dock right" },
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
