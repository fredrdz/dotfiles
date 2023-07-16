return {
	breadcrumbs = false,
	file_icon = {
		tabline = function(self)
			return self.is_active or self.is_visible
		end,
		statusline = false,
		winbar = false,
	},
}
