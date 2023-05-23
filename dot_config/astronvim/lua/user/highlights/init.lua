return function()
	local get_hlgroup = require("astronvim.utils").get_hlgroup
	local nontext = get_hlgroup("NonText")

	return {
		CursorLineFold = { link = "CursorLineNr" },                  -- highlight fold indicator as well as line number
		GitSignsCurrentLineBlame = { fg = nontext.fg, italic = true }, -- italicize git blame virtual text
		HighlightURL = { underline = true },                         -- always underline URLs
		OctoEditable = { fg = "NONE", bg = "NONE" },                 -- use treesitter for octo.nvim highlighting

		-- neotree theme
		NeoTreeTabActive = { bg = "#334756" },          -- string
		NeoTreeTabInactive = { bg = "#082032" },        -- string
		NeoTreeTabSeparatorInactive = { bg = "#082032" }, -- string
		NeoTreeTabSeparatorActive = { bg = "#16B2C3" }, -- string

		-- nvim-notify
		NotifyBackground = { bg = "#16B2C3" },

		-- heirline
		Folded = { bg = "#7af9ff", fg = "#181818" },

		-- whichkey
		WhichkeyFloat = { bg = "#082032" },

		-- matchup
		MatchParen = { fg = "#7af9ff", bold = true, italic = true, underline = true },
		MatchWord = { fg = "#7af9ff", bold = true, italic = true, underline = true },
		MatchParenCur = { fg = "#7af9ff", bold = true, italic = true, underline = true },
		MatchWordCur = { bold = true, underline = true },

		CursorColumn = { bg = "#2C394B" },
		CursorLine = { bg = "#2C394B" },
		Delimiter = { fg = "#16B2C3", bold = true },
	}
end
