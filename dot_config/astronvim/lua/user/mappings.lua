local astro_utils = require("astronvim.utils")

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
	-- first key is the mode
	n = {
		-- second key is the lefthand side of the map
		-- mappings seen under group name "Buffer"
		["<leader>bD"] = {
			function()
				require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
					require("astronvim.utils.buffer").close(bufnr)
				end)
			end,
			desc = "Pick to close",
		},
		-- tables with the `name` key will be registered with which-key if it's installed
		-- this is useful for naming menus
		["<leader>b"] = { name = "Buffers" },
		-- quick save
		-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

		-- Easy-Align
		ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },

		-- buffer switching
		["<leader><Tab>"] = {
			function()
				if #vim.t.bufs > 1 then
					require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })
				else
					astro_utils.notify("No other buffers open")
				end
			end,
			desc = "Switch Buffers",
		},

		-- neoclip (registers)
		["<leader>r"] = { name = "󰳴 Neoclip Registers" },
		["<leader>rN"] = { "<cmd>Telescope neoclip<cr>", desc = 'Default register (")' },
		["<leader>ra"] = { "<cmd>Telescope neoclip a<cr>", desc = "a" },
		["<leader>rr"] = { "<cmd>Telescope neoclip r<cr>", desc = "r" },
		["<leader>rs"] = { "<cmd>Telescope neoclip s<cr>", desc = "s" },
		["<leader>rt"] = { "<cmd>Telescope neoclip t<cr>", desc = "t" },
		["<leader>rn"] = { "<cmd>Telescope neoclip n<cr>", desc = "n" },
		["<leader>re"] = { "<cmd>Telescope neoclip e<cr>", desc = "e" },
		["<leader>ri"] = { "<cmd>Telescope neoclip i<cr>", desc = "i" },
		["<leader>ro"] = { "<cmd>Telescope neoclip o<cr>", desc = "o" },

		-- vim-sandwich
		["<leader>m"] = { name = "󰉚 Sandwich" },
		["<leader>ma"] = { "<Plug>(sandwich-add)", desc = "Add" },
		["<leader>md"] = { "<Plug>(sandwich-delete)", desc = "Delete" },
		["<leader>mdb"] = { "<Plug>(sandwich-delete-auto)", desc = "Delete Auto" },
		["<leader>mr"] = { "<Plug>(sandwich-replace)", desc = "Replace" },
		["<leader>mrb"] = { "<Plug>(sandwich-replace-auto)", desc = "Replace Auto" },

		-- telescope plugin mappings
		["<leader>fB"] = { "<cmd>Telescope bibtex<cr>", desc = "Find BibTeX" },
		["<leader>fe"] = { "<cmd>Telescope file_browser<cr>", desc = "File explorer" },
		["<leader>fp"] = {
			function()
				require("telescope").extensions.projects.projects({})
			end,
			desc = "Find projects",
		},
		["<leader>fT"] = { "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },

		-- misc
		["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },

		-- pane navigation movements
		["C-Left"] = false,
		["C-Right"] = false,
		["C-Up"] = false,
		["C-Down"] = false,
		["C-h"] = false,
		["C-j"] = false,
		["C-k"] = false,
		["C-l"] = false,
		["<C-Left>"] = { "<cmd>SmartCursorMoveLeft<cr>", desc = "Navigate pane left" },
		["<C-Right>"] = { "<cmd>SmartCursorMoveRight<cr>", desc = "Navigate pane right" },
		["<C-Up>"] = { "<cmd>SmartCursorMoveUp<cr>", desc = "Navigate pane up" },
		["<C-Down>"] = { "<cmd>SmartCursorMoveDown<cr>", desc = "Navigate pane down" },
		-- pane resizing
		["C-M-Left"] = false,
		["C-M-Right"] = false,
		["C-M-Up"] = false,
		["C-M-Down"] = false,
		["<C-M-Left>"] = { "<cmd>SmartResizeLeft<cr>", desc = "Resize pane left" },
		["<C-M-Right>"] = { "<cmd>SmartResizeRight<cr>", desc = "Resize pane right" },
		["<C-M-Up>"] = { "<cmd>SmartResizeUp<cr>", desc = "Resize pane up" },
		["<C-M-Down>"] = { "<cmd>SmartResizeDown<cr>", desc = "Resize pane down" },
		-- better buffer navigation
		["]b"] = false,
		["[b"] = false,
		["S-Left"] = false,
		["S-Right"] = false,
		["S-Up"] = false,
		["S-Down"] = false,
		["<S-Up>"] = {
			function()
				require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
			end,
			desc = "Next buffer",
		},
		["<S-Down>"] = {
			function()
				require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
			end,
			desc = "Previous buffer",
		},
		-- tabs
		["<leader>j"] = { name = "󱋤 Tabs" },
		["<leader>jn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
		["<leader>jc"] = { "<cmd>tabclose<cr>", desc = "New close" },
		["<S-Left>"] = { "<cmd>tabprevious<cr>", desc = "Previous tab" },
		["<S-Right>"] = { "<cmd>tabnext<cr>", desc = "Next tab" },
		-- disabling due conflicts -- using on tmux for tab switching
		["M-Left"] = false,
		["M-Right"] = false,
		["M-Up"] = false,
		["M-Down"] = false,
	},

	t = {
		-- setting a mapping to false will disable it
		-- ["<esc>"] = false,
	},

	o = {
		-- vim-sandwich
		["<leader>m"] = { name = "󰉚 Sandwich" },
		["<leader>ma"] = { "<Plug>(sandwich-add)", desc = "Add" },
		["<leader>mib"] = { "<Plug>(textobj-sandwich-auto-i)", desc = "Search/Select auto inner block" },
		["<leader>mis"] = { "<Plug>(textobj-sandwich-query-i)", desc = "Search/Select query inner sandwich" },
		["<leader>mab"] = { "<Plug>(textobj-sandwich-auto-a)", desc = "Search/Select auto around block" },
		["<leader>mas"] = { "<Plug>(textobj-sandwich-query-a)", desc = "Search/Select query around sandwich" },
	},

	x = {
		-- vim-sandwich
		["<leader>m"] = { name = "󰉚 Sandwich" },
		["<leader>ma"] = { "<Plug>(sandwich-add)", desc = "Add" },
		["<leader>md"] = { "<Plug>(sandwich-delete)", desc = "Delete" },
		["<leader>mr"] = { "<Plug>(sandwich-replace)", desc = "Replace" },
		["<leader>mib"] = { "<Plug>(textobj-sandwich-auto-i)", desc = "Search/Select auto inner block" },
		["<leader>mis"] = { "<Plug>(textobj-sandwich-query-i)", desc = "Search/Select query inner sandwich" },
		["<leader>mab"] = { "<Plug>(textobj-sandwich-auto-a)", desc = "Search/Select auto around block" },
		["<leader>mas"] = { "<Plug>(textobj-sandwich-query-a)", desc = "Search/Select query around sandwich" },
	},
}
