-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
return {
	virtual_text = true,
	underline = true,
	virtual_lines = {
		highlight_whole_line = true,
		only_current_line = true,
	},
}
