-- set vim options here (vim.<first_key>.<second_key> = value)
return {
	opt = {
		-- set to true or false etc.
		-- searching
		hlsearch = true,
		ignorecase = true,  -- Ignore case
		smartcase = true,   -- Don't ignore case with capitals
		inccommand = "split", -- Live preview for search and replace
		incsearch = true,   -- Make search behave like modern browsers
		-- splits
		splitbelow = true,  -- Put new windows below current
		splitright = true,  -- Put new windows right of current
		-- default formatting
		shiftwidth = 2,     -- Size of an indent
		tabstop = 2,        -- Number of spaces tabs count for
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
		cmdheight = 0,       -- More space to display messages
		wrap = false,        -- Enable line wrap
		number = true,       -- Print line number
		relativenumber = true, -- Relative line numbers
		scrolloff = 10,      -- Lines of context
		sidescrolloff = 8,   -- Columns of context
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
		wildmode = "list:longest",                 -- Command-line completion mode
		wildoptions = "pum",
		wildignorecase = true,                     -- Ignore case command completion menu
		-- misc
		spell = false,                             -- sets vim.opt.spell
		hidden = true,                             -- Enable modified buffers in background
		shada = { "!", "'1000", "<50", "s10", "h" }, -- remember stuff across sessions
		joinspaces = false,                        -- No double spaces with join after a dot
		timeoutlen = 300,                          -- Don't wait more that 400ms for normal mode commands ie. whichkey
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
	g = {
		mapleader = " ",                 -- sets vim.g.mapleader
		autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
		cmp_enabled = true,              -- enable completion at start
		autopairs_enabled = true,        -- enable autopairs at start
		diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
		status_diagnostics_enabled = true, -- enable diagnostics in statusline
		icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
		ui_notifications_enabled = true, -- disable notifications when toggling UI elements
		resession_enabled = true,        -- enable or disable session saving
	},
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
