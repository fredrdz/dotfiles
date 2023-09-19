return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
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

	opts = function(_, opts)
		opts.textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["aa"] = { query = "@attribute.outer", desc = "around attribute" },
					["ia"] = { query = "@attribute.inner", desc = "inside attribute" },
					["ar"] = { query = "@regex.outer", desc = "around regex" },
					["ir"] = { query = "@regex.inner", desc = "inside regex" },
					["as"] = { query = "@statement.outer", desc = "around statement" },
					["in"] = { query = "@number.inner", desc = "inside number" },
					["a/"] = { query = "@comment.outer", desc = "around comment" },
					["i/"] = { query = "@comment.inner", desc = "inside comment" },
					["ab"] = { query = "@block.outer", desc = "around block" },
					["ib"] = { query = "@block.inner", desc = "inside block" },
					["ac"] = { query = "@class.outer", desc = "around class" },
					["ic"] = { query = "@class.inner", desc = "inside class" },
					["a?"] = { query = "@conditional.outer", desc = "around conditional" },
					["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
					["af"] = { query = "@function.outer", desc = "around function" },
					["if"] = { query = "@function.inner", desc = "inside function" },
					["al"] = { query = "@loop.outer", desc = "around loop" },
					["il"] = { query = "@loop.inner", desc = "inside loop" },
					["ap"] = { query = "@parameter.outer", desc = "around parameter" },
					["ip"] = { query = "@parameter.inner", desc = "inside parameter" },
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_previous_start = {
					["[["] = { query = "@function.outer", desc = "Goto previous start @function.outer" },
					["[A"] = { query = "@attribute.outer", desc = "Previous attribute start" },
					["[B"] = { query = "@block.outer", desc = "Previous block start" },
					["[F"] = { query = "@function.outer", desc = "Previous function start" },
					["[P"] = { query = "@parameter.outer", desc = "Previous parameter start" },
					["[C"] = { query = "@class.outer", desc = "Previous class start" },
					["[S"] = { query = "@statement.outer", desc = "Previous statement start" },
					["[M"] = { query = "@call.outer", desc = "Previous method start" },
					["[L"] = { query = "@loop.outer", desc = "Previous loop start" },
					["[??"] = { query = "@conditional.outer", desc = "Previous conditional start" },
					["[/"] = { query = "@comment.outer", desc = "Goto previous comment" },
					["[R"] = { query = "@regex.outer", desc = "Previous regex start" },
				},
				goto_previous_end = {
					["[]"] = { query = "@function.outer", desc = "Goto previous end @function.outer" },
					["[a"] = { query = "@attribute.outer", desc = "Previous attribute end" },
					["[b"] = { query = "@block.outer", desc = "Previous block end" },
					["[f"] = { query = "@function.outer", desc = "Previous function end" },
					["[p"] = { query = "@parameter.outer", desc = "Previous parameter end" },
					["[c"] = { query = "@class.outer", desc = "Previous class end" },
					["[s"] = { query = "@statement.outer", desc = "Previous statement end" },
					["[m"] = { query = "@call.outer", desc = "Previous method end" },
					["[l"] = { query = "@loop.outer", desc = "Previous loop end" },
					["[?"] = { query = "@conditional.outer", desc = "Previous conditional end" },
					["[r"] = { query = "@regex.outer", desc = "Previous regex end" },
				},
				goto_next_start = {
					["]["] = { query = "@function.outer", desc = "Goto next start @function.outer" },
					["]A"] = { query = "@attribute.outer", desc = "Next attribute start" },
					["]B"] = { query = "@block.outer", desc = "Next block start" },
					["]F"] = { query = "@function.outer", desc = "Next function start" },
					["]P"] = { query = "@parameter.outer", desc = "Next parameter start" },
					["]C"] = { query = "@class.outer", desc = "Next class start" },
					["]Ss"] = { query = "@statement.outer", desc = "Next statement start" },
					["]M"] = { query = "@call.outer", desc = "Next method start" },
					["]L"] = { query = "@loop.outer", desc = "Next loop start" },
					["]?s"] = { query = "@conditional.outer", desc = "Next conditional start" },
					["]/"] = { query = "@comment.outer", desc = "Goto next comment" },
					["]R"] = { query = "@regex.outer", desc = "Next regex start" },
				},
				goto_next_end = {
					["]]"] = { query = "@function.outer", desc = "Goto next end @function.outer" },
					["]a"] = { query = "@attribute.outer", desc = "Next attribute end" },
					["]b"] = { query = "@block.outer", desc = "Next block end" },
					["]f"] = { query = "@function.outer", desc = "Next function end" },
					["]p"] = { query = "@parameter.outer", desc = "Next parameter end" },
					["]c"] = { query = "@class.outer", desc = "Next class end" },
					["]Se"] = { query = "@statement.outer", desc = "Next statement end" },
					["]m"] = { query = "@call.outer", desc = "Next method end" },
					["]l"] = { query = "@loop.outer", desc = "Next loop end" },
					["]?e"] = { query = "@conditional.outer", desc = "Next conditional end" },
					["]r"] = { query = "@regex.outer", desc = "Next regex end" },
				},
				goto_previous = {
					["[n"] = { query = "@number.inner", desc = "Goto previous number" },
				},
				goto_next = {
					["]n"] = { query = "@number.inner", desc = "Goto next number" },
				},
			},
			swap = {
				enable = true,
				swap_next = {
					[">b"] = { query = "@block.outer", desc = "Swap next block" },
					[">f"] = { query = "@function.outer", desc = "Swap next function" },
					[">p"] = { query = "@parameter.inner", desc = "Swap next parameter" },
				},
				swap_previous = {
					["<b"] = { query = "@block.outer", desc = "Swap previous block" },
					["<f"] = { query = "@function.outer", desc = "Swap previous function" },
					["<p"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
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
		}
	end,
}
