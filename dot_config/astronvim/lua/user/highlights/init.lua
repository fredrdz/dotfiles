return function()
	local get_hlgroup = require("astronvim.utils").get_hlgroup
	local normal = get_hlgroup("Normal")
	local nontext = get_hlgroup("NonText")
	local fg, bg = normal.fg, normal.bg
	local bg_alt = get_hlgroup("Visual").bg
	local green = get_hlgroup("String").fg
	local red = get_hlgroup("Error").fg

	return {
		CursorLineFold = { link = "CursorLineNr" },                  -- highlight fold indicator as well as line number
		GitSignsCurrentLineBlame = { fg = nontext.fg, italic = true }, -- italicize git blame virtual text
		HighlightURL = { underline = true },                         -- always underline URLs
		OctoEditable = { fg = "NONE", bg = "NONE" },                 -- use treesitter for octo.nvim highlighting

		-- telescope theme
		TelescopeBorder = { fg = "#16B2C3" },
		TelescopeNormal = { bg = "#1F1F28" },
		TelescopePreviewBorder = { fg = "#16B2C3" },
		TelescopePreviewNormal = { bg = "#1F1F28" },
		TelescopePreviewTitle = { fg = "#DCD7BA", bg = "#2B3328" },
		TelescopePromptBorder = { fg = "#16B2C3" },
		TelescopePromptNormal = { fg = "#DCD7BA", bg = "#1F1F28" },
		TelescopePromptPrefix = { fg = "#DCD7BA", bg = "#43242B" },
		TelescopePromptTitle = { fg = "#DCD7BA", bg = "#43242B" },
		TelescopeResultsBorder = { fg = "#16B2C3" },
		TelescopeResultsNormal = { bg = "#1F1F28" },
		TelescopeResultsTitle = { fg = "#DCD7BA", bg = "#1F1F28" },

		-- neotree theme
		NeoTreeTabActive = { bg = "#16B2C3" },          -- string
		NeoTreeTabInactive = { bg = "#082032" },        -- string
		NeoTreeTabSeparatorInactive = { bg = "#082032" }, -- string
		NeoTreeTabSeparatorActive = { bg = "#7af9ff" }, -- string

		-- nvim-notify
		NotifyBackground = { bg = "#16B2C3" },

		-- heirline
		Folded = { bg = "#7af9ff", fg = "#181818" },

		-- lobotech theme
		-- highlight default GHListDark guifg=#e0d8f4 guibg=#334756
		-- highlight default GHTextViewDark guifg=#e0d8f4 guibg=#082032
		-- highlight default GHListHl guifg=#181818 guibg=#7af9ff
		--
		MatchParen = { fg = "#7af9ff", bold = true, italic = true, underline = true },
		MatchWord = { fg = "#7af9ff", bold = true, italic = true, underline = true },
		MatchParenCur = { fg = "#7af9ff", bold = true, italic = true, underline = true },
		MatchWordCur = { fg = "#7af9ff", bold = true, italic = true, underline = true },

		CursorColumn = { bg = "#2C394B" },
		CursorLine = { bg = "#2C394B" },
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
