local toggle_key = "<F2>"

-- Toggle Claude Code tmux pane: hide if visible, show if hidden, launch if none
local claude_hidden_pane_id = nil

-- Kill Claude tmux pane on Neovim exit (hidden or visible)
vim.api.nvim_create_autocmd("VimLeavePre", {
	group = vim.api.nvim_create_augroup("ClaudeCodeTmuxCleanup", { clear = true }),
	callback = function()
		-- Kill hidden pane
		if claude_hidden_pane_id then
			vim.fn.system(string.format("tmux kill-pane -t %s 2>/dev/null", claude_hidden_pane_id))
			claude_hidden_pane_id = nil
			return
		end
		-- Kill visible Claude pane
		local pane_id = vim.trim(
			vim.fn.system(
				"tmux list-panes -F '#{pane_id} #{pane_start_command}' | grep claude-code | head -1 | awk '{print $1}'"
			)
		)
		if pane_id ~= "" then
			vim.fn.system(string.format("tmux kill-pane -t %s 2>/dev/null", pane_id))
		end
	end,
})

local function toggle_claude_tmux()
	-- Check if we have a hidden Claude pane to restore
	if claude_hidden_pane_id then
		-- Verify it still exists (check all windows/sessions)
		local exists = vim.trim(
			vim.fn.system(string.format("tmux list-panes -s -F '#{pane_id}' | grep -x '%s'", claude_hidden_pane_id))
		)
		if exists ~= "" then
			-- Bring it back: join as a top pane at 30%
			vim.fn.system(string.format("tmux join-pane -vb -l 30%% -s %s", claude_hidden_pane_id))
			claude_hidden_pane_id = nil
			return
		else
			claude_hidden_pane_id = nil
		end
	end

	-- Find a visible Claude pane by its start command
	local pane_id = vim.trim(
		vim.fn.system(
			"tmux list-panes -F '#{pane_id} #{pane_start_command}' | grep claude-code | head -1 | awk '{print $1}'"
		)
	)

	if pane_id ~= "" then
		-- Claude pane is visible — hide it by breaking it to a background window
		vim.fn.system(string.format("tmux break-pane -d -s %s", pane_id))
		claude_hidden_pane_id = pane_id
	else
		-- No Claude pane at all — launch a new one
		vim.cmd("ClaudeCode")
	end
end

return {
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = {
			terminal_cmd = vim.fn.expand("~/.local/bin/claude"),
			-- Send/Focus Behavior
			focus_after_send = true,

			-- Terminal Window Configuration
			terminal = {
				provider = "external",
				provider_opts = {
					-- Horizontal split, Claude on top, 30% height
					-- Wraps cmd to set pane title for reliable toggle detection
					external_terminal_cmd = function(cmd, _cwd)
						local wrapped = string.format("tmux select-pane -T claude-code; exec %s", cmd)
						return { "tmux", "split-window", "-vb", "-l", "30%", "sh", "-c", wrapped }
					end,
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
			{ "<leader>kc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ toggle_key, toggle_claude_tmux, desc = "Claude Code", mode = { "n", "x" } },
			{ "<leader>kf", toggle_claude_tmux, desc = "Focus Claude" },
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
