-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()
	local function detect_tmpl_type()
		local shebang = vim.fn.getline(1)
		local filename = vim.fn.expand "%:t"
		-- local ext = vim.fn.expand("%:e")

		if
				shebang == "#!/bin/bash"
				or shebang == "#!/usr/bin/env bash"
				or shebang == "#!/bin/sh"
				or shebang == "#!/usr/bin/env sh"
		then
			vim.cmd "set ft=sh"
		elseif shebang == "#!/bin/zsh" or shebang == "#!/usr/bin/env zsh" then
			vim.cmd "set ft=zsh"
		elseif filename:match "%.toml.tmpl$" then
			vim.cmd "set ft=toml"
		elseif filename:match "%.yaml.tmpl$" or filename:match "%.yml.tmpl$" then
			vim.cmd "set ft=yaml"
		end
	end

	-- add custom filetype
	vim.filetype.add({ extension = { templ = "templ" } })
	vim.filetype.add({ extension = { gohtml = "gohtml" } })

	-- Set up custom filetypes
	vim.filetype.add {
		extension = {
			-- ["toml.tmpl"] = "toml.tmpl",
			-- ["sh.tmpl"] = "sh",
			tmpl = detect_tmpl_type,
		},
		filename = {
			--   ["Foofile"] = "fooscript",
		},
		pattern = {
			-- ["~/%.config/foo/.*"] = "fooscript",
			-- ["%.toml.tmpl$"] = "toml",
		},
	}
	-- hides the tabline when there is only one tab and one buffer in it
	vim.api.nvim_create_augroup("autohidetabline", { clear = true })

	-- create a new autocmd on the "User" event
	vim.api.nvim_create_autocmd("User", {
		desc = "Hide tabline when only one buffer and one tab", -- nice description
		-- triggered when vim.t.bufs is updated
		pattern = "AstroBufsUpdated",                         -- the pattern is the name of our User autocommand events
		group = "autohidetabline",                            -- add the autocmd to the newly created augroup
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

	-- wsl clipboard integration
	if vim.fn.has("wsl") == 1 then
		if vim.fn.executable("wl-copy") == 0 then
			print("wl-clipboard not found, clipboard integration won't work")
		else
			vim.g.clipboard = {
				name = "wl-clipboard (wsl)",
				copy = {
					["+"] = "wl-copy --foreground --type text/plain",
					["*"] = "wl-copy --foreground --primary --type text/plain",
				},
				paste = {
					["+"] = (function()
						return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { "" }, 1) -- '1' keeps empty lines
					end),
					["*"] = (function()
						return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"', { "" }, 1)
					end),
				},
				cache_enabled = true
			}
		end
	end
end
