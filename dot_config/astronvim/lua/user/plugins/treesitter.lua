return {
	"nvim-treesitter/nvim-treesitter",

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"ngalaiko/tree-sitter-go-template",
			config = function()
				local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
				parser_config.gotmpl = {
					install_info = {
						url = "https://github.com/ngalaiko/tree-sitter-go-template",
						files = { "src/parser.c" },
					},
					filetype = "gotmpl",
					used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "gohtml", "htmlhugo" },
				}
			end,
		},
		{
			"andymass/vim-matchup",
			init = function()
				vim.g.matchup_matchparen_offscreen = { method = "status" }
				vim.g.matchup_matchparen_hi_surround_always = 1
				vim.g.matchup_matchparen_deferred = 1
				vim.g.matchup_matchparen_deferred_show_delay = 50
				vim.g.matchup_matchparen_deferred_hide_delay = 700
				vim.g.matchup_surround_enabled = 1
				vim.g.matchup_transmute_enabled = 1
			end,
		},
	},

	opts = {
		auto_install = vim.fn.executable("tree-sitter") == 1,
		highlight = {
			additional_vim_regex_highlighting = false,
			disable = { "help" },
		},
		matchup = {
			enable = true,
		},
		rainbow = {
			enable = true,
		},

		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					aA = "@attribute.outer",
					iA = "@attribute.inner",
					aB = "@block.outer",
					iB = "@block.inner",
					aD = "@conditional.outer",
					iD = "@conditional.inner",
					aF = "@function.outer",
					iF = "@function.inner",
					aL = "@loop.outer",
					iL = "@loop.inner",
					aP = "@parameter.outer",
					iP = "@parameter.inner",
					aR = "@regex.outer",
					iR = "@regex.inner",
					aX = "@class.outer",
					iX = "@class.inner",
					aS = "@statement.outer",
					iS = "@statement.outer",
					aN = "@number.inner",
					iN = "@number.inner",
					aC = "@comment.outer",
					iC = "@comment.outer",
				},
			},

			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]b"] = { query = "@block.outer", desc = "Next block start" },
					["]f"] = { query = "@function.outer", desc = "Next function start" },
					["]p"] = { query = "@parameter.outer", desc = "Next parameter start" },
					["]x"] = { query = "@class.outer", desc = "Next class start" },
					["]c"] = { query = "@comment.outer", desc = "Next comment start" },
				},

				goto_next_end = {
					["]B"] = { query = "@block.outer", desc = "Next block end" },
					["]F"] = { query = "@function.outer", desc = "Next function end" },
					["]P"] = { query = "@parameter.outer", desc = "Next parameter end" },
					["]X"] = { query = "@class.outer", desc = "Next class end" },
					["]C"] = { query = "@comment.outer", desc = "Next comment end" },
				},

				goto_previous_start = {
					["[b"] = { query = "@block.outer", desc = "Previous block start" },
					["[f"] = { query = "@function.outer", desc = "Previous function start" },
					["[p"] = { query = "@parameter.outer", desc = "Previous parameter start" },
					["[x"] = { query = "@class.outer", desc = "Previous class start" },
					["[c"] = { query = "@comment.outer", desc = "Previous comment start" },
				},

				goto_previous_end = {
					["[B"] = { query = "@block.outer", desc = "Previous block end" },
					["[F"] = { query = "@function.outer", desc = "Previous function end" },
					["[P"] = { query = "@parameter.outer", desc = "Previous parameter end" },
					["[X"] = { query = "@class.outer", desc = "Previous class end" },
					["[C"] = { query = "@comment.outer", desc = "Previous comment end" },
				},
			},

			swap = {
				enable = true,
				swap_next = {
					[">B"] = { query = "@block.outer", desc = "Swap next block" },
					[">F"] = { query = "@function.outer", desc = "Swap next function" },
					[">P"] = { query = "@parameter.inner", desc = "Swap next parameter" },
				},
				swap_previous = {
					["<B"] = { query = "@block.outer", desc = "Swap previous block" },
					["<F"] = { query = "@function.outer", desc = "Swap previous function" },
					["<P"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
				},
			},

			lsp_interop = {
				enable = true,
				border = "single",
				peek_definition_code = {
					["<leader>lp"] = { query = "@function.outer", desc = "Peek function definition" },
					["<leader>lP"] = { query = "@class.outer", desc = "Peek class definition" },
				},
			},
		},
	},
}
