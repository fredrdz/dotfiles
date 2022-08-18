local indent = 2
vim.opt.syntax = "on"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_command("set nofoldenable")
vim.opt.foldnestmax = 10
vim.opt.foldlevel = 0
vim.opt.foldcolumn = "0"
vim.opt.shiftwidth = indent -- Size of an indent
vim.opt.tabstop = indent -- Number of spaces tabs count for
vim.opt.softtabstop = indent
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.mouse = "" -- Disable mouse
vim.opt.clipboard = "unnamedplus" -- Put those yanks in my os clipboards
vim.opt.completeopt = "menuone,noselect" -- Completion options (for compe)
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.ignorecase = true -- Ignore case
vim.opt.incsearch = true -- Make search behave like modern browsers
vim.opt.inccommand = "split" -- Live preview for search and replace
vim.opt.joinspaces = false -- No double spaces with join after a dot
vim.opt.scrolloff = 10 -- Lines of context
vim.opt.shiftround = true -- Round indent
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.list = false -- Show some invisible characters (tabs...)
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.wrap = true -- Enable line wrap
vim.opt.cmdheight = 2 -- More space to display messages
vim.opt.timeoutlen = 400 -- Don't wait more that 400ms for normal mode commands
vim.opt.guicursor = {"n-v-c:block", "i-ci-ve:ver25", "r-cr:hor20", "o:hor50", "a:blinkwait700-blinkoff400-blinkon250", "sm:block-blinkwait175-blinkoff150-blinkon175"}
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = {"number", "line"}
vim.opt.termguicolors = true -- True color support
vim.opt.winblend = 8
vim.opt.pumblend = 8
vim.opt.wildignore = '*.swp,*.bak,*.pyc,*.class'
vim.opt.wildmode = "list:longest" -- Command-line completion mode
vim.opt.wildoptions = "pum"
vim.opt.wildignorecase = true -- Ignore case command completion menu
vim.opt.shada = {"!", "'1000", "<50", "s10", "h"} -- remember stuff across sessions
vim.opt.undofile = true
vim.opt.undodir = "/tmp/undodir"
vim.opt.swapfile = false -- I have OCD file saving issues anyway
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.title = true
vim.opt.updatetime = 300
vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.fillchars:append({fold = ' '})
vim.opt.fillchars:append({foldopen = '▾', foldsep = '│', foldclose = '▸'})
vim.opt.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})
vim.opt.showbreak = "↪ "
vim.opt.listchars = "tab:|.,trail:_,extends:>,precedes:<,nbsp:~,eol:¬"
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3

-------------------- set leader to space early --------------------
vim.g.mapleader = " "

-------------------- set test strategy to vimux --------------------
vim.g["test#strategy"] = "vimux"

-------------------- vim-matchup settings --------------------
--vim.g.loaded_matchit = 1
vim.g.matchup_matchparen_offscreen = {method = 'popup'}
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_deferred_show_delay = 50
vim.g.matchup_matchparen_deferred_hide_delay = 700
vim.g.matchup_matchparen_hi_surround_always = 1
vim.g.matchup_surround_enabled = 1

-------------------- hexokinase settings --------------------
vim.g.Hexokinase_optInPatterns = {'full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla', 'colour_names'}
vim.g.Hexokinase_highlighters = {'virtual'}

-------------------- indentline settings --------------------
vim.g.indentLine_bufNameExclude = { "term:.*", "which_key:.*" }
