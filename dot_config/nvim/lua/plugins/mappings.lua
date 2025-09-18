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

					-- quicker explorer bind outside leader key
					["<F3>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle File Explorer" },

					-- better increment/decrement
					["-"] = { "<c-x>", desc = "Descrement number" },
					["+"] = { "<c-a>", desc = "Increment number" },

					-- snacks pickers
					--
					-- buffer switching
					["<Tab>"] = {
						function()
							if #vim.t.bufs > 1 then
								require("snacks").picker.buffers({
									current = false,
									sort_lastused = true,
									nofile = true,
								})
							else
								vim.notify("No other buffers open", vim.log.levels.INFO, { title = "Buffer Switch" })
							end
						end,
						desc = "Switch Buffers",
					},

					-- buffer refresh
					["<leader>bR"] = { "<cmd>e<cr>", desc = "Refresh Current Buffer" },

					-- copilot
					["<leader>k"] = { name = "󰙘 AI" },
					["<leader>ko"] = { name = " Copilot" },
					["<leader>koo"] = {
						"<cmd>lua require('copilot.panel').open({postion, ratio})<cr>",
						desc = "Copilot Open",
					},
					["<leader>kor"] = { "<cmd>lua require('copilot.panel').refresh()<cr>", desc = "Copilot Refresh" },

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

					-- easy align
					ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
				},

				x = {},
			},
		},
	},
}
