-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		-- Configure core features of AstroNvim
		features = {
			large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
			autopairs = true, -- enable autopairs at start
			cmp = true, -- enable completion at start
			diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
			highlighturl = true, -- highlight URLs at start
			notifications = true, -- enable notifications at start
		},
		-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
		diagnostics = {
			virtual_text = false,
			underline = true,
			virtual_lines = {
				highlight_whole_line = true,
				only_current_line = true,
			},
		},
		-- vim options can be configured here
		options = {
			opt = { -- vim.opt.<key>
				-- set to true or false etc.
				-- searching
				hlsearch = true,
				ignorecase = true, -- Ignore case
				smartcase = true, -- Don't ignore case with capitals
				inccommand = "split", -- Live preview for search and replace
				incsearch = true, -- Make search behave like modern browsers
				-- splits
				splitbelow = true, -- Put new windows below current
				splitright = true, -- Put new windows right of current
				-- default formatting
				shiftwidth = 2, -- Size of an indent
				tabstop = 2, -- Number of spaces tabs count for
				softtabstop = 2,
				expandtab = true,
				autoindent = true,
				smartindent = true, -- Insert indents automatically
				shiftround = true, -- Round indent
				-- treesitter folding
				conceallevel = 2, -- enable conceal
				foldenable = true,
				foldlevel = 99,
				foldmethod = "expr",
				foldexpr = "nvim_treesitter#foldexpr()",
				-- appearance
				termguicolors = true, -- True color support
				syntax = "off",
				cursorline = true,
				-- opt.colorcolumn = '80,120'
				cmdheight = 0, -- More space to display messages
				wrap = false, -- Enable line wrap
				number = true, -- Print line number
				relativenumber = true, -- Relative line numbers
				scrolloff = 10, -- Lines of context
				sidescrolloff = 8, -- Columns of context
				signcolumn = "auto",
				laststatus = 3,
				errorbells = false,
				cursorlineopt = { "number", "line" },
				backspace = { "indent", "eol", "start" },
				list = false, -- Show some invisible characters (tabs...)
				showbreak = "↪ ",
				-- menus
				winblend = 8,
				pumblend = 8,
				wildignore = "*.swp,*.bak,*.pyc,*.class",
				wildmode = "list:longest", -- Command-line completion mode
				wildoptions = "pum",
				wildignorecase = true, -- Ignore case command completion menu
				-- misc
				clipboard = "unnamedplus", -- Copy paste between vim and everything else
				spell = false, -- sets vim.opt.spell
				hidden = true, -- Enable modified buffers in background
				shada = { "!", "'1000", "<50", "s10", "h" }, -- remember stuff across sessions
				joinspaces = false, -- No double spaces with join after a dot
				timeoutlen = 300, -- Don't wait more that 400ms for normal mode commands ie. whichkey
				undofile = true,
				undodir = "/tmp/undodir",
				swapfile = false, -- I have OCD file saving issues anyway
				backup = false,
				writebackup = false,
				lazyredraw = false,
				ttyfast = true,
				title = true,
				updatetime = 300,
			},
			g = { -- vim.g.<key>
				-- configure global vim variables (vim.g)
				-- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
				-- This can be found in the `lua/lazy_setup.lua` file

				autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
				autopairs_enabled = true, -- enable autopairs at start
				status_diagnostics_enabled = true, -- enable diagnostics in statusline
				resession_enabled = true, -- enable or disable session saving
			},
		},
	},
}