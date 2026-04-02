-- Customize Treesitter
-- Treesitter config is handled through AstroCore in v6
-- (nvim-treesitter is now just a parser download utility)

-- Register gotmpl parser for additional filetypes (gohtml, etc.)
vim.treesitter.language.register("gotmpl", { "gohtml", "gohtmltmpl", "gotexttmpl", "htmlhugo" })

---@type LazySpec
return {
	-- Treesitter configuration through AstroCore
	{
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			treesitter = {
				highlight = true,
				indent = true,
				auto_install = true,
				ensure_installed = {
					"lua",
					"vim",
					"go",
					"gotmpl",
				},

				textobjects = {
					select = {
						select_textobject = {
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
							["[?s"] = { query = "@conditional.outer", desc = "Previous conditional start" },
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
							["[?e"] = { query = "@conditional.outer", desc = "Previous conditional end" },
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
					},
					swap = {
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
				},
			},
		},
	},

	-- Configure textobjects plugin options (lookahead, set_jumps)
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		opts = {
			select = { lookahead = true },
			move = { set_jumps = true },
		},
	},
}
