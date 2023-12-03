return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-emoji",
		"jc-doyle/cmp-pandoc-references",
		"kdheepak/cmp-latex-symbols",
	},
	opts = function(_, opts)
		local cmp = require "cmp"
		local compare = require "cmp.config.compare"
		local luasnip = require "luasnip"

		local function has_words_before()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
		end

		return require("astronvim.utils").extend_tbl(opts, {
			window = {
				completion = {
					border = "rounded",
					col_offset = -1,
					side_padding = 0,
				},
			},
			sources = cmp.config.sources {
				{ name = "nvim_lsp",          priority = 1000 },
				{ name = "luasnip",           priority = 750 },
				{ name = "pandoc_references", priority = 725 },
				{ name = "latex_symbols",     priority = 700 },
				{ name = "emoji",             priority = 700 },
				{ name = "calc",              priority = 650 },
				{ name = "path",              priority = 500 },
				{ name = "buffer",            priority = 250 },
			},
			sorting = {
				comparators = {
					compare.locality,
					compare.recently_used,
					compare.score,
					compare.offset,
					compare.order,
				},
			},
			mapping = {
				-- tab complete
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.confirm { select = true }
					else
						fallback()
					end
				end, { "i", "s" }),
				-- <C-n> and <C-p> for navigating snippets
				["<C-n>"] = cmp.mapping(function()
					if luasnip.jumpable(1) then luasnip.jump(1) end
				end, { "i", "s" }),
				["<C-p>"] = cmp.mapping(function()
					if luasnip.jumpable(-1) then luasnip.jump(-1) end
				end, { "i", "s" }),
				-- <C-j> for starting completion
				["<C-j>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
					else
						cmp.complete()
					end
				end, { "i", "s" }),
			},
			experimental = { ghost_text = true },
		})
	end,
}
