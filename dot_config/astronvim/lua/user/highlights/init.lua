return function()
	local get_hlgroup = require("astronvim.utils").get_hlgroup
	local normal = get_hlgroup("Normal")
	local nontext = get_hlgroup("NonText")
	local fg, bg = normal.fg, normal.bg
	local bg_alt = get_hlgroup("Visual").bg
	local green = get_hlgroup("String").fg
	local red = get_hlgroup("Error").fg
	return {
		CursorLineFold = { link = "CursorLineNr" }, -- highlight fold indicator as well as line number
		GitSignsCurrentLineBlame = { fg = nontext.fg, italic = true }, -- italicize git blame virtual text
		HighlightURL = { underline = true }, -- always underline URLs
		OctoEditable = { fg = "NONE", bg = "NONE" }, -- use treesitter for octo.nvim highlighting
		-- telescope theme
		TelescopeBorder = { fg = bg_alt, bg = bg },
		TelescopeNormal = { bg = bg },
		TelescopePreviewBorder = { fg = bg, bg = bg },
		TelescopePreviewNormal = { bg = bg },
		TelescopePreviewTitle = { fg = bg, bg = green },
		TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
		TelescopePromptNormal = { fg = fg, bg = bg_alt },
		TelescopePromptPrefix = { fg = red, bg = bg_alt },
		TelescopePromptTitle = { fg = bg, bg = red },
		TelescopeResultsBorder = { fg = bg, bg = bg },
		TelescopeResultsNormal = { bg = bg },
		TelescopeResultsTitle = { fg = bg, bg = bg },
		-- lobotech theme
		-- highlight default GHListDark guifg=#e0d8f4 guibg=#334756
		-- highlight default GHTextViewDark guifg=#e0d8f4 guibg=#082032
		-- highlight default GHListHl guifg=#181818 guibg=#7af9ff
		CursorColumn = { bg = "#2C394B" },
		CursorLine = { bg = "#2C394B" },
		MatchParen = { fg = "#FFFFFF", bold = true },
		MatchWord = { fg = "#FFFFFF", bold = true },
		MatchParenCur = { bold = true },
		MatchWordCur = { bold = true },
		WhichkeyFloat = { bg = "#334756" },
		Pmenu = { bg = "#082032" },
		PmenuSel = { bg = "#7af9ff", fg = "#181818" },
		PmenuSbar = { bg = "#EEEEEE" },
		PmenuThumb = { bg = "#16B2C3" },
		FloatBorder = { fg = "#16B2C3" },
		NormalFloat = { bg = "#082032" },
		Terminal = { bg = "#082032" },
		KeywordFunction = { fg = "#FF4C29", italic = true },
	}
end
