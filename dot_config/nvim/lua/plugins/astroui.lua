-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

local get_hlgroup = require("astroui").get_hlgroup
local nontext = get_hlgroup("NonText")

---@type LazySpec
return {
	"AstroNvim/astroui",
	---@type AstroUIOpts
	opts = {
		-- change colorscheme
		colorscheme = "kanagawa",

		-- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
		highlights = {
			init = { -- this table overrides highlights in all themes
				-- highlight fold indicator as well as line number
				CursorLineFold = { link = "CursorLineNr" },
				GitSignsCurrentLineBlame = { fg = nontext.fg, italic = true }, -- italicize git blame virtual text
				HighlightURL = { underline = true }, -- always underline URLs
				OctoEditable = { fg = "NONE", bg = "NONE" }, -- use treesitter for octo.nvim highlighting

				-- neotree theme
				NeoTreeTabActive = { bg = "#334756" }, -- string
				NeoTreeTabInactive = { bg = "#082032" }, -- string
				NeoTreeTabSeparatorInactive = { bg = "#082032" }, -- string
				NeoTreeTabSeparatorActive = { bg = "#16B2C3" }, -- string

				-- heirline
				Folded = { bg = "#082032", fg = "#181818" },
				KanaTabline = { bg = "#16161D" },

				-- matchup
				MatchParen = { fg = "#16B2C3", bold = true, italic = true, underline = true },
				MatchWord = { fg = "#16B2C3", bold = true, italic = true, underline = true },
				MatchParenCur = { fg = "#16B2C3", bold = true, italic = true, underline = true },
				MatchWordCur = { fg = "#16B2C3", bold = true, underline = true, italic = true },

				-- custom branding
				desqueFG = { fg = "#16B2C3" },
				desqueBG = { bg = "#16B2C3" },
			},
		},

		-- Icons can be configured throughout the interface
		icons = {
			-- configure the loading of the lsp in the status line
			LSPLoading1 = "⠋",
			LSPLoading2 = "⠙",
			LSPLoading3 = "⠹",
			LSPLoading4 = "⠸",
			LSPLoading5 = "⠼",
			LSPLoading6 = "⠴",
			LSPLoading7 = "⠦",
			LSPLoading8 = "⠧",
			LSPLoading9 = "⠇",
			LSPLoading10 = "⠏",
		},
	},
}
