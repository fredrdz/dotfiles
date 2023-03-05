-- AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
	-- Set colorscheme
	--colorscheme = "default_theme",
	colorscheme = "kanagawa-wave",
	-- Configure AstroNvim updates
	updater = {
		remote = "origin",   -- remote to use
		channel = "stable",  -- "stable" or "nightly"
		version = "latest",  -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "main",     -- branch name (NIGHTLY ONLY)
		commit = nil,        -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil,   -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_reload = false, -- automatically reload and sync packer after a successful update
		auto_quit = false,   -- automatically quit the current session after a successful update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		-- },
	},
	-- Add highlight groups in any theme
	highlights = {
		init = {
			-- this table overrides highlights in all themes
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
		},
		-- duskfox = { -- a table of overrides/changes to the duskfox theme
		--   Normal = { bg = "#000000" },
		-- },
	},
	-- set vim options here (vim.<first_key>.<second_key> = value)
	options = {
		opt = {
			-- set to true or false etc.
			-- searching
			hlsearch = true,
			ignorecase = true, -- Ignore case
			smartcase = true,  -- Don't ignore case with capitals
			inccommand = "split", -- Live preview for search and replace
			incsearch = true,  -- Make search behave like modern browsers
			-- splits
			splitbelow = true, -- Put new windows below current
			splitright = true, -- Put new windows right of current
			-- default formatting
			shiftwidth = 2,    -- Size of an indent
			tabstop = 2,       -- Number of spaces tabs count for
			softtabstop = 2,
			expandtab = true,
			autoindent = true,
			smartindent = true, -- Insert indents automatically
			shiftround = true, -- Round indent
			-- treesitter folding
			conceallevel = 2, -- enable conceal
			foldenable = false,
			foldlevel = 99,
			foldmethod = 'expr',
			foldexpr = 'nvim_treesitter#foldexpr()',
			-- appearance
			termguicolors = true, -- True color support
			syntax = "off",
			cursorline = true,
			-- opt.colorcolumn = '80,120'
			cmdheight = 2,      -- More space to display messages
			wrap = true,        -- Enable line wrap
			number = true,      -- Print line number
			relativenumber = true, -- Relative line numbers
			scrolloff = 10,     -- Lines of context
			sidescrolloff = 8,  -- Columns of context
			signcolumn = 'auto',
			laststatus = 3,
			errorbells = false,
			guicursor = { "n-v-c:block", "i-ci-ve:ver25", "r-cr:hor20", "o:hor50",
				"a:blinkwait700-blinkoff400-blinkon250", "sm:block-blinkwait175-blinkoff150-blinkon175" },
			cursorlineopt = { "number", "line" },
			backspace = { "indent", "eol", "start" },
			list = false, -- Show some invisible characters (tabs...)
			showbreak = "↪ ",
			-- menus
			winblend = 8,
			pumblend = 8,
			wildignore = '*.swp,*.bak,*.pyc,*.class',
			wildmode = "list:longest",                -- Command-line completion mode
			wildoptions = "pum",
			wildignorecase = true,                    -- Ignore case command completion menu
			-- misc
			spell = false,                            -- sets vim.opt.spell
			hidden = true,                            -- Enable modified buffers in background
			shada = { "!", "'1000", "<50", "s10", "h" }, -- remember stuff across sessions
			joinspaces = false,                       -- No double spaces with join after a dot
			timeoutlen = 400,                         -- Don't wait more that 400ms for normal mode commands
			undofile = true,
			undodir = "/tmp/undodir",
			swapfile = false, -- I have OCD file saving issues anyway
			backup = false,
			writebackup = false,
			lazyredraw = false,
			ttyfast = true,
			title = true,
			updatetime = 200,
		},
		g = {
			mapleader = " ",                -- sets vim.g.mapleader
			autoformat_enabled = true,      -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
			cmp_enabled = true,             -- enable completion at start
			autopairs_enabled = true,       -- enable autopairs at start
			diagnostics_enabled = true,     -- enable diagnostics at start
			status_diagnostics_enabled = true, -- enable diagnostics in statusline
			icons_enabled = true,           -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
			ui_notifications_enabled = true, -- disable notifications when toggling UI elements
			heirline_bufferline = false,    -- enable new heirline based bufferline (requires :PackerSync after changing)
			-- set vim-matchup options
			matchup_matchparen_offscreen = { method = 'popup' },
			matchup_matchparen_deferred = 1,
			matchup_matchparen_deferred_show_delay = 50,
			matchup_matchparen_deferred_hide_delay = 700,
			matchup_matchparen_hi_surround_always = 1,
			matchup_surround_enabled = 1,
		},
	},
	-- If you need more control, you can use the function()...end notation
	-- options = function(local_vim)
	--   local_vim.opt.relativenumber = true
	--   local_vim.g.mapleader = " "
	--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
	--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
	--
	--   return local_vim
	-- end,

	-- Set dashboard header
	header = {
		" █████  ███████ ████████ ██████   ██████",
		"██   ██ ██         ██    ██   ██ ██    ██",
		"███████ ███████    ██    ██████  ██    ██",
		"██   ██      ██    ██    ██   ██ ██    ██",
		"██   ██ ███████    ██    ██   ██  ██████",
		" ",
		"    ███    ██ ██    ██ ██ ███    ███",
		"    ████   ██ ██    ██ ██ ████  ████",
		"    ██ ██  ██ ██    ██ ██ ██ ████ ██",
		"    ██  ██ ██  ██  ██  ██ ██  ██  ██",
		"    ██   ████   ████   ██ ██      ██",
	},
	-- Default theme configuration
	default_theme = {
		-- Modify the color palette for the default theme
		colors = {
			fg = "#abb2bf",
			bg = "#1e222a",
		},
		highlights = function(hl) -- or a function that returns a new table of colors to set
			local C = require "default_theme.colors"

			hl.Normal = { fg = C.fg, bg = C.bg }

			-- New approach instead of diagnostic_style
			hl.DiagnosticError.italic = true
			hl.DiagnosticHint.italic = true
			hl.DiagnosticInfo.italic = true
			hl.DiagnosticWarn.italic = true

			return hl
		end,
		-- enable or disable highlighting for extra plugins
		plugins = {
			aerial = true,
			beacon = false,
			bufferline = true,
			cmp = true,
			dashboard = true,
			highlighturl = true,
			hop = false,
			indent_blankline = true,
			lightspeed = false,
			["neo-tree"] = true,
			notify = true,
			["nvim-tree"] = false,
			["nvim-web-devicons"] = true,
			rainbow = true,
			symbols_outline = false,
			telescope = true,
			treesitter = true,
			vimwiki = false,
			["which-key"] = true,
		},
	},
	-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
	diagnostics = {
		virtual_text = true,
		underline = true,
	},
	-- Extend LSP configuration
	lsp = {
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright"
		},
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					"html",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- "sumneko_lua",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--   return true
			-- end
		},
		-- easily add or disable built in mappings added during LSP attaching
		mappings = {
			n = {
				-- ["<leader>lf"] = false -- disable formatting keymap
			},
		},
		-- add to the global LSP on_attach function
		-- on_attach = function(client, bufnr)
		-- end,

		-- override the mason server-registration function
		-- server_registration = function(server, opts)
		--   require("lspconfig")[server].setup(opts)
		-- end,

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {
			-- example for addings schemas to yamlls
			-- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
			--   settings = {
			--     yaml = {
			--       schemas = {
			--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
			--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
			--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
			--       },
			--     },
			--   },
			-- },
		},
	},
	-- Mapping data with "desc" stored directly by vim.keymap.set().
	--
	-- Please use this mappings table to set keyboard mapping since this is the
	-- lower level configuration and more robust one. (which-key will
	-- automatically pick-up stored data by this setting.)
	mappings = {
		-- first key is the mode
		n = {
			-- second key is the lefthand side of the map
			-- mappings seen under group name "Buffer"
			["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
			["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
			["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
			["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
			-- quick save
			-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
		},
		t = {
			-- setting a mapping to false will disable it
			-- ["<esc>"] = false,
		},
	},
	-- Configure plugins
	plugins = {
		init = {
			-- You can disable default plugins as follows:
			-- ["goolord/alpha-nvim"] = { disable = true },

			-- You can also add new plugins here as well:
			-- Add plugins, the packer syntax without the "use"
			-- { "andweeb/presence.nvim" },
			-- {
			--   "ray-x/lsp_signature.nvim",
			--   event = "BufRead",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },

			-- We also support a key value style plugin definition similar to NvChad:
			-- ["ray-x/lsp_signature.nvim"] = {
			--   event = "BufRead",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },

			["rebelot/kanagawa.nvim"] = {
				config = function()
					-- Default options:
					require('kanagawa').setup({
						compile = true, -- enable compiling the colorscheme
						undercurl = true, -- enable undercurls
						commentStyle = { italic = true },
						functionStyle = {},
						keywordStyle = { italic = true },
						statementStyle = { bold = true },
						typeStyle = {},
						transparent = false, -- do not set background color
						dimInactive = true, -- dim inactive window `:h hl-NormalNC`
						terminalColors = true, -- define vim.g.terminal_color_{0,17}
						colors = {
							-- add/modify theme and palette colors
							palette = {},
							theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
						},
						overrides = function(colors) -- add/modify highlights
							return {}
						end,
						theme = "wave", -- Load "wave" theme when 'background' option is not set
						background = {
							-- map the value of 'background' option to a theme
							dark = "wave", -- try "dragon" !
							light = "lotus"
						},
					})
				end,
			},
			["phelipetls/vim-hugo"] = {},
			["tiagovla/scope.nvim"] = {},
			["andymass/vim-matchup"] = { after = "nvim-treesitter" },
			["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
		},
		-- All other entries override the require("<key>").setup({...}) call for default plugins
		["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
			-- config variable is the default configuration table for the setup function call
			-- local null_ls = require "null-ls"

			-- Check supported formatters and linters
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			config.sources = {
				-- Set a formatter
				-- null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettier,
			}
			return config  -- return final config table
		end,
		["treesitter"] = { -- overrides `require("treesitter").setup(...)`
			highlight = { disable = { "help" } },
			indent = { enable = true, disable = { "python" } },
			matchup = { enable = true },
		},
		["indent_blankline"] = {
			show_current_context = true,
			show_current_context_start = true,
		},
		["indent-o-matic"] = {
			max_lines = 2048,
			standard_widths = { 2, 4 },
		},
		["neo-tree"] = {
			window = {
				position = "right",
				width = 30,
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						--auto close
						require("neo-tree").close_all()
					end
				},
				{
					event = "neo_tree_window_after_open",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end
				},
				{
					event = "neo_tree_window_after_close",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end
				},
			},
		},
		["bufferline"] = {
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				numbers = function(opts)
					return string.format('%s·%s', opts.raise(opts.id), opts.raise(opts.ordinal))
				end,
				indicator = {
					style = 'underline',
				},
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = true,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "left",
						separator = true
					}
				},
				color_icons = true,          -- whether or not to add the filetype icon highlights
				show_buffer_icons = true,    -- disable filetype icons for buffers
				show_buffer_close_icons = true,
				show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
				show_close_icon = true,
				show_tab_indicators = true,
				show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				separator_style = 'slant',
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { 'close' }
				},
				sort_by = 'tabs',
			},
		},
		-- use mason-lspconfig to configure LSP installations
		["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
			-- ensure_installed = { "sumneko_lua" },
		},
		-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
		["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
			-- ensure_installed = { "prettier", "stylua" },
		},
		["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
			-- ensure_installed = { "python" },
		},
	},
	-- LuaSnip Options
	luasnip = {
		-- Extend filetypes
		filetype_extend = {
			-- javascript = { "javascriptreact" },
		},
		-- Configure luasnip loaders (vscode, lua, and/or snipmate)
		vscode = {
			-- Add paths for including more VS Code style snippets in luasnip
			paths = {},
		},
	},
	-- CMP Source Priorities
	-- modify here the priorities of default cmp sources
	-- higher value == higher priority
	-- The value can also be set to a boolean for disabling default sources:
	-- false == disabled
	-- true == 1000
	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},
	-- Customize Heirline options
	heirline = {
		-- -- Customize different separators between sections
		-- separators = {
		--   tab = { "", "" },
		-- },
		-- -- Customize colors for each element each element has a `_fg` and a `_bg`
		-- colors = function(colors)
		--   colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
		--   return colors
		-- end,
		-- -- Customize attributes of highlighting in Heirline components
		-- attributes = {
		--   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
		--   git_branch = { bold = true }, -- bold the git branch statusline component
		-- },
		-- -- Customize if icons should be highlighted
		-- icon_highlights = {
		--   breadcrumbs = false, -- LSP symbols in the breadcrumbs
		--   file_icon = {
		--     winbar = false, -- Filetype icon in the winbar inactive windows
		--     statusline = true, -- Filetype icon in the statusline
		--   },
		-- },
	},
	-- Modify which-key registration (Use this with mappings table in the above.)
	["which-key"] = {
		-- Add bindings which show up as group name
		register = {
			-- first key is the mode, n == normal mode
			n = {
				-- second key is the prefix, <leader> prefixes
				["<leader>"] = {
					-- third key is the key to bring up next level and its displayed
					-- group name in which-key top level menu
					["b"] = { name = "Buffer" },
				},
			},
		},
	},
	-- This function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
		-- Set up custom filetypes
		-- vim.filetype.add {
		--   extension = {
		--     foo = "fooscript",
		--   },
		--   filename = {
		--     ["Foofile"] = "fooscript",
		--   },
		--   pattern = {
		--     ["~/%.config/foo/.*"] = "fooscript",
		--   },
		-- }
	end,
}

return config
