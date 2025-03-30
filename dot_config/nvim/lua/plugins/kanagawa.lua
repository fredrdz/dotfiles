return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			-- Default options:
			require("kanagawa").setup({
				compile = true, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = { bold = true },
				keywordStyle = { bold = true, italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = true, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
								float = {
									{ bg = "none" },
								},
							},
						},
					},
				},
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				background = {
					-- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
				overrides = function(colors)
					local theme = colors.theme
					local makeDiagnosticColor = function(color)
						local c = require("kanagawa.lib.color")
						return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
					end

					return {
						-- floating windows
						NormalFloat = { bg = theme.ui.bg },
						FloatBorder = { bg = theme.ui.bg },
						FloatTitle = { bg = theme.ui.bg, bold = true },

						-- leap
						LeapLabelPrimary = { bg = theme.ui.shade0, fg = "#16B2C3", bold = true },

						-- noice
						NoiceCmdline = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
						NoiceCmdlinePopupBorder = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
						NoiceCmdlinePopupBorderSearch = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
						NoiceCmdlinePopup = { bg = theme.ui.bg, fg = theme.ui.fg_dim },

						-- nvim-notify
						NotifyBackground = { bg = theme.ui.bg, fg = theme.ui.fg_dim },

						-- diagnostics
						DiagnosticSignInfo = { bg = theme.ui.bg, fg = theme.ui.fg },
						DiagnosticInfo = { bg = theme.ui.bg, fg = theme.ui.fg },

						-- lsp
						LspInfoBorder = { bg = theme.ui.bg, fg = theme.ui.fg },

						-- Save an hlgroup with dark background and dimmed foreground
						-- so that you can use it where your still want darker windows.
						-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						-- NormalDark = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						NormalDark = { bg = theme.ui.bg, fg = theme.ui.fg_dim },

						-- Popular plugins that open floats will link to NormalFloat by default;
						-- set their background accordingly if you wish to keep them dark and borderless
						LazyNormal = { bg = theme.ui.bg, fg = theme.ui.fg },
						MasonNormal = { bg = theme.ui.bg, fg = theme.ui.fg },
						NeoTreeNormal = { bg = theme.ui.bg, fg = theme.ui.fg },

						-- block-like modern telescope
						TelescopeTitle = { fg = theme.ui.fg, bold = true },
						TelescopeNormal = { bg = theme.ui.bg },
						TelescopeBorder = { bg = theme.ui.bg, fg = theme.ui.fg },

						TelescopePromptTitle = { bg = "none", fg = theme.ui.fg },
						TelescopePromptPrefix = { bg = "none", fg = theme.ui.fg },
						TelescopePromptNormal = { bg = "none", fg = theme.ui.fg },
						TelescopePromptBorder = { bg = "none" },

						TelescopeResultsTitle = { bg = "none", fg = theme.ui.fg },
						TelescopeResultsNormal = { bg = "none", fg = theme.ui.fg },
						TelescopeResultsBorder = { bg = "none" },

						TelescopePreviewTitle = { bg = "none", fg = theme.ui.fg },
						TelescopePreviewNormal = { bg = theme.ui.bg },
						TelescopePreviewBorder = { bg = theme.ui.bg, fg = theme.ui.bg_dim },

						-- dark completion menu
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = "#082032" },

						-- diagnostics
						DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
						DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
						DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
						DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

						-- ts rainbow
						TSRainbowRed = { fg = colors.palette.autumnRed },
						TSRainbowYellow = { fg = colors.palette.carpYellow },
						TSRainbowBlue = { fg = colors.palette.dragonBlue },
						TSRainbowOrange = { fg = colors.palette.surimiOrange },
						TSRainbowGreen = { fg = colors.palette.springGreen },
						TSRainbowViolet = { fg = colors.palette.oniViolet },
						TSRainbowCyan = { fg = colors.palette.waveAqua1 },

						-- hugo
						HugoDelimiters = { fg = "#03506F", bold = true },
						htmlHugoBlock = { fg = "#545B77" },
						htmlHugoInclude = { fg = "#C88EA7" },
						htmlHugoStatement = { fg = "#D36B00" },
						htmlHugoRepeat = { fg = "#C06014" },
						htmlHugoConditional = { fg = "#C06014" },
						htmlHugoOperator = { fg = theme.syn.operator },
						htmlHugoFunction = { fg = "#F69E7B" },
						htmlHugoAssignment = { fg = theme.syn.special1 },
						htmlHugoPipe = { fg = theme.syn.special2 },
						htmlHugoNumber = { fg = "#85586F" },
						htmlHugoMethod = { fg = "#EEDAD1" },
						htmlHugoString = { fg = theme.syn.string },
						htmlHugoRawString = { fg = theme.syn.string },
						htmlHugoComment = { fg = theme.syn.comment },
						htmlHugoDelimiters = { fg = theme.syn.punct },
						htmlHugoIdentifier = { fg = theme.syn.identifier },
					}
				end,
			})
		end,
	},
}
