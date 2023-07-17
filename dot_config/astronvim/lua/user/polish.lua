-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()
	-- Set up custom filetypes
	-- vim.filetype.add {
	--   extension = {
	--     foo = "fooscript",
	--   },
	--   filename = {
	--     ["Foofile"] = "fooscript",
	--   },
	--   pattern = {
	--     ["~/%.config/foo/.*"] = "fooscript",
	--   },
	-- }
	-- create an augroup to easily manage autocommands

	-- The search function checks for '#!/bin/bash' or '#!/usr/bin/env bash' at the beginning of the file
	function detect_shell_script()
		local shebang = vim.fn.getline(1)
		if shebang == "#!/bin/bash" or shebang == "#!/usr/bin/env bash" then
			vim.cmd("set ft=sh")
		elseif shebang == "#!/bin/zsh" or shebang == "#!/usr/bin/env zsh" then
			vim.cmd("set ft=zsh")
		end
	end

	vim.cmd([[
		augroup DetectShellScript
  		autocmd!
  		autocmd BufNewFile,BufRead *.tmpl lua detect_shell_script()
		augroup END
	]])

	vim.api.nvim_create_augroup("autohidetabline", { clear = true })
	-- create a new autocmd on the "User" event
	vim.api.nvim_create_autocmd("User", {
		desc = "Hide tabline when only one buffer and one tab", -- nice description
		-- triggered when vim.t.bufs is updated
		pattern = "AstroBufsUpdated", -- the pattern is the name of our User autocommand events
		group = "autohidetabline", -- add the autocmd to the newly created augroup
		callback = function()
			-- if there is more than one buffer in the tab, show the tabline
			-- if there are 0 or 1 buffers in the tab, only show the tabline if there is more than one vim tab
			local new_showtabline = #vim.t.bufs > 1 and 2 or 1
			-- check if the new value is the same as the current value
			if new_showtabline ~= vim.opt.showtabline:get() then
				-- if it is different, then set the new `showtabline` value
				vim.opt.showtabline = new_showtabline
			end
		end,
	})
end
