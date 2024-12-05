return {
	{
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			mappings = {
				-- first key is the mode
				n = {
					-- disable some defaults key mappings
					["<F7>"] = false, -- toggleterm
					-- lsp bindings
					["grr"] = false,
					["gra"] = false,
					["grn"] = false,
					-- pane navigation movements
					["<]b>"] = false,
					["<[b>"] = false,
					["<C-h>"] = false,
					["<C-j>"] = false,
					["<C-k>"] = false,
					["<C-l>"] = false,

					-- better increment/decrement
					["-"] = { "<c-x>", desc = "Descrement number" },
					["+"] = { "<c-a>", desc = "Increment number" },

					-- buffer switching
					["<Tab>"] = {
						function()
							if #vim.t.bufs > 1 then
								require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })
							else
								require("notify")("No other buffers open")
							end
						end,
						desc = "Switch Buffers",
					},

					-- trouble
					["<leader>x"] = { desc = "󰒡 Trouble" },
					["<leader>xX"] = {
						"<cmd>TroubleToggle document_diagnostics<cr>",
						desc = "Document Diagnostics (Trouble)",
					},
					["<leader>xx"] = {
						"<cmd>TroubleToggle workspace_diagnostics<cr>",
						desc = "Workspace Diagnostics (Trouble)",
					},
					["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
					["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
					["<leader>xT"] = { "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble)" },

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
					["<leader>mr"] = { "<Plug>(sandwich-replace)", desc = "Replace" },
					["<leader>ms"] = { "<Plug>(sandwich-replace-auto)", desc = "Replace Auto" },
					["<leader>mt"] = { "<Plug>(sandwich-delete)", desc = "Delete" },
					["<leader>mg"] = { "<Plug>(sandwich-delete-auto)", desc = "Delete Auto" },

					-- copilot
					["<leader>k"] = { name = "󰙘 AI" },
					["<leader>ka"] = { name = " Copilot" },
					["<leader>kao"] = {
						"<cmd>lua require('copilot.panel').open({postion, ratio})<cr>",
						desc = "Copilot Open",
					},
					["<leader>kar"] = { "<cmd>lua require('copilot.panel').refresh()<cr>", desc = "Copilot Refresh" },

					-- telescope plugin mappings
					["<leader>f<Tab>"] = {
						function()
							require("telescope.builtin").resume()
						end,
						desc = "Resume previous search",
					},
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
					["<M-Left>"] = { "<cmd>SmartCursorMoveLeft<cr>", desc = "Navigate pane left" },
					["<M-Right>"] = { "<cmd>SmartCursorMoveRight<cr>", desc = "Navigate pane right" },
					["<M-Up>"] = { "<cmd>SmartCursorMoveUp<cr>", desc = "Navigate pane up" },
					["<M-Down>"] = { "<cmd>SmartCursorMoveDown<cr>", desc = "Navigate pane down" },

					-- pane resizing
					["<S-Left>"] = { "<cmd>SmartResizeLeft<cr>", desc = "Resize pane left" },
					["<S-Right>"] = { "<cmd>SmartResizeRight<cr>", desc = "Resize pane right" },
					["<S-Up>"] = { "<cmd>SmartResizeUp<cr>", desc = "Resize pane up" },
					["<S-Down>"] = { "<cmd>SmartResizeDown<cr>", desc = "Resize pane down" },

					-- better buffer navigation
					["<C-Down>"] = {
						function()
							require("astrocore.buffer").nav(-vim.v.count1)
						end,
						desc = "Previous buffer",
					},
					["<C-Up>"] = {
						function()
							require("astrocore.buffer").nav(vim.v.count1)
						end,
						desc = "Next buffer",
					},

					-- tabs
					["<leader>T"] = { name = "󱋤 Tabs" },
					["<leader>Tn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
					["<leader>Tc"] = { "<cmd>tabclose<cr>", desc = "New close" },
					["<C-Left>"] = { "<cmd>tabprevious<cr>", desc = "Previous tab" },
					["<C-Right>"] = { "<cmd>tabnext<cr>", desc = "Next tab" },
				},

				v = {},

				i = {
					["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
				},

				t = {
					-- to normal mode
					["<esc>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
					["<S-esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
					-- pane navigation movements
					["<M-Left>"] = { "<cmd>SmartCursorMoveLeft<cr>", desc = "Navigate pane left" },
					["<M-Right>"] = { "<cmd>SmartCursorMoveRight<cr>", desc = "Navigate pane right" },
					["<M-Up>"] = { "<cmd>SmartCursorMoveUp<cr>", desc = "Navigate pane up" },
					["<M-Down>"] = { "<cmd>SmartCursorMoveDown<cr>", desc = "Navigate pane down" },
					-- pane resizing
					["<S-Left>"] = { "<cmd>SmartResizeLeft<cr>", desc = "Resize pane left" },
					["<S-Right>"] = { "<cmd>SmartResizeRight<cr>", desc = "Resize pane right" },
					["<S-Up>"] = { "<cmd>SmartResizeUp<cr>", desc = "Resize pane up" },
					["<S-Down>"] = { "<cmd>SmartResizeDown<cr>", desc = "Resize pane down" },
					-- tab navigation
					["<C-Left>"] = { "<cmd>tabprevious<cr>", desc = "Previous tab" },
					["<C-Right>"] = { "<cmd>tabnext<cr>", desc = "Next tab" },
				},

				o = {
					-- better increment/decrement
					["+"] = { "g<C-a>", desc = "Increment number" },
					["-"] = { "g<C-x>", desc = "Descrement number" },
					-- Easy-Align
					ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
					-- vim-sandwich
					["<leader>m"] = { name = "󰉚 Sandwich" },
					["<leader>ma"] = { "<Plug>(sandwich-add)", desc = "Add" },
					["<leader>mq"] = {
						"<Plug>(textobj-sandwich-auto-i)",
						desc = "Search/Select auto inner block",
					},
					["<leader>mw"] = {
						"<Plug>(textobj-sandwich-query-i)",
						desc = "Search/Select query inner sandwich",
					},
					["<leader>mf"] = {
						"<Plug>(textobj-sandwich-auto-a)",
						desc = "Search/Select auto around block",
					},
					["<leader>mp"] = {
						"<Plug>(textobj-sandwich-query-a)",
						desc = "Search/Select query around sandwich",
					},
				},

				x = {
					-- vim-sandwich
					["<leader>m"] = { name = "󰉚 Sandwich" },
					["<leader>ma"] = { "<Plug>(sandwich-add)", desc = "Add" },
					["<leader>mr"] = { "<Plug>(sandwich-replace)", desc = "Replace" },
					["<leader>ms"] = { "<Plug>(sandwich-delete)", desc = "Delete" },
					["<leader>mq"] = {
						"<Plug>(textobj-sandwich-auto-i)",
						desc = "Search/Select auto inner block",
					},
					["<leader>mw"] = {
						"<Plug>(textobj-sandwich-query-i)",
						desc = "Search/Select query inner sandwich",
					},
					["<leader>mf"] = {
						"<Plug>(textobj-sandwich-auto-a)",
						desc = "Search/Select auto around block",
					},
					["<leader>mp"] = {
						"<Plug>(textobj-sandwich-query-a)",
						desc = "Search/Select query around sandwich",
					},
				},
			},
		},
	},
}
