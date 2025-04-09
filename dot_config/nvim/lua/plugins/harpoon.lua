-- community plugin: harpoon
-- https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/motion/harpoon
---@type LazySpec
return {
	{
		"ThePrimeagen/harpoon",
		enabled = true,
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope.nvim", optional = true },
			{ "AstroNvim/astroui", opts = { icons = { Harpoon = "󱡀" } } },
			{
				"AstroNvim/astrocore",
				---@param opts AstroCoreOpts
				opts = function(_, opts)
					local maps = opts.mappings
					local ui = require("astroui")
					local harpoon = require("harpoon")
					local prefix = "<Leader><Leader>"

					if maps and maps.n then
						-- settings via whichkey
						maps.n[prefix] = {
							desc = ui.get_icon("Harpoon", 1, true) .. "Harpoon",
						}
						maps.n[prefix .. "a"] = {
							function()
								harpoon:list():add()
							end,
							desc = "Add file",
						}
						maps.n[prefix .. "m"] = {
							function()
								harpoon.ui:toggle_quick_menu(harpoon:list())
							end,
							desc = "Toggle quick menu",
						}
						maps.n[prefix .. "t"] = {
							function()
								vim.ui.input({ prompt = "Harpoon mark index: " }, function(input)
									local num = tonumber(input)
									if num then
										harpoon:list():select(num)
									end
								end)
							end,
							desc = "Goto index of mark",
						}

						-- selects via whichkey
						maps.n[prefix .. "n"] = {
							function()
								harpoon:list():select(1)
							end,
							desc = "Select mark 1",
						}
						maps.n[prefix .. "e"] = {
							function()
								harpoon:list():select(2)
							end,
							desc = "Select mark 2",
						}
						maps.n[prefix .. "i"] = {
							function()
								harpoon:list():select(3)
							end,
							desc = "Select mark 3",
						}
						maps.n[prefix .. "o"] = {
							function()
								harpoon:list():select(4)
							end,
							desc = "Select mark 4",
						}

						-- quick motions
						maps.n["<M-e>"] = {
							function()
								harpoon:list():prev()
							end,
							desc = "Goto previous mark",
						}
						maps.n["<M-n>"] = {
							function()
								harpoon:list():next()
							end,
							desc = "Goto next mark",
						}
					end
				end,
			},
		},
	},
}
