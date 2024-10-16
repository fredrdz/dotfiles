return {
	{
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			mappings = {
				-- first key is the mode
				n = {
					-- second key is the lefthand side of the map
					-- mappings seen under group name "Buffer"
					["<leader>bD"] = {
						function()
							require("astroui.status").heirline.buffer_picker(function(bufnr)
								require("astrocore.buffer").close(bufnr)
							end)
						end,
						desc = "Pick to close",
					},
					-- tables with the `name` key will be registered with which-key if it's installed
					-- this is useful for naming menus
					["<leader>b"] = { name = "Buffers" },
					-- quick save
					-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

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
					["<leader>kp"] = { name = "Copilot" },
					["<leader>kpo"] = {
						"<cmd>lua require('copilot.panel').open({postion, ratio})<cr>",
						desc = "Copilot Open",
					},
					["<leader>kpr"] = { "<cmd>lua require('copilot.panel').refresh()<cr>", desc = "Copilot Refresh" },
					["<leader>kc"] = { "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
					["<leader>ke"] = { "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
					["<leader>kg"] = { "<cmdChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
					["<leader>kt"] = { "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
					["<leader>kk"] = { "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
					["<leader>kd"] = { "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
					["<leader>ka"] = { "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
					["<leader>ko"] = { "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
					["<leader>ks"] = { "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
					["<leader>kf"] = { "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
					["<leader>kx"] = { "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
					["<leader>kr"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
					["<leader>kl"] = {
						"<cmd>ChatGPTRun code_readability_analysis<CR>",
						desc = "Code Readability Analysis",
					},

					-- telescope plugin mappings
					["<leader>f<CR>"] = false,
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

					-- disable defaults
					["<F7>"] = false,
					-- pane navigation movements; disable defaults
					["<]b>"] = false,
					["<[b>"] = false,
					["<C-h>"] = false,
					["<C-j>"] = false,
					["<C-k>"] = false,
					["<C-l>"] = false,
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
					["<C-Up>"] = {
						function()
							require("astrocore.buffer").nav(vim.v.count1)
						end,
						desc = "Next buffer",
					},
					["<C-Down>"] = {
						function()
							require("astrocore.buffer").nav(-vim.v.count1)
						end,
						desc = "Previous buffer",
					},
					-- tabs
					["<leader>T"] = { name = "󱋤 Tabs" },
					["<leader>Tn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
					["<leader>Tc"] = { "<cmd>tabclose<cr>", desc = "New close" },
					["<C-Left>"] = { "<cmd>tabprevious<cr>", desc = "Previous tab" },
					["<C-Right>"] = { "<cmd>tabnext<cr>", desc = "Next tab" },

					-- g menu
					ga = { "<Plug>(EasyAlign)", desc = "Easy Align" },
					gk = {
						function()
							require("aerial").toggle()
						end,
						desc = "Symbols outline",
					},
				},

				v = {
					["<leader>s"] = {
						function()
							require("spectre").open_visual()
						end,
						desc = "Spectre",
					},
					["<leader>k"] = {
						function()
							require("chatgpt").edit_with_instructions()
						end,
						desc = "ChatGPT code edit",
					},
				},

				i = {
					-- signature help, fails silently so attach always
					["<C-l>"] = {
						function()
							vim.lsp.buf.signature_help()
						end,
						desc = "Signature help",
					},
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

	{
		"AstroNvim/astrolsp",
		---@type AstroLSPOpts
		opts = {
			mappings = {
				n = {
					-- this mapping will only be set in buffers with an LSP attached
					K = {
						function()
							vim.lsp.buf.hover()
						end,
						desc = "Hover symbol details",
					},
				},
			},
		},
	},
}
