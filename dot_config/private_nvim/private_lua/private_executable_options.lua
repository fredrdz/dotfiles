-- concise
local opt = vim.opt
local indent = 2

-- mouse and clipboard
opt.mouse:append('a')
opt.clipboard = 'unnamed'

-- searching
opt.hlsearch = false
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
opt.inccommand = "split" -- Live preview for search and replace
opt.incsearch = true -- Make search behave like modern browsers

-- splits
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

-- default formatting
opt.shiftwidth = indent -- Size of an indent
opt.tabstop = indent -- Number of spaces tabs count for
opt.softtabstop = indent
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true -- Insert indents automatically
opt.shiftround = true -- Round indent

-- treesitter folding
-- vim.api.nvim_command("set nofoldenable")
opt.foldmethod = 'expr'
opt.foldlevel = 99
opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- appearance
opt.termguicolors = true -- True color support
opt.syntax = "off"
opt.cursorline = true
-- opt.colorcolumn = '80,120'
opt.cmdheight = 2 -- More space to display messages
opt.wrap = true -- Enable line wrap
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 10 -- Lines of context
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = 'yes'
opt.laststatus = 3
opt.errorbells = false
opt.guicursor = {"n-v-c:block", "i-ci-ve:ver25", "r-cr:hor20", "o:hor50", "a:blinkwait700-blinkoff400-blinkon250", "sm:block-blinkwait175-blinkoff150-blinkon175"}
opt.cursorlineopt = {"number", "line"}
opt.backspace = {"indent", "eol", "start"}
opt.list = false -- Show some invisible characters (tabs...)
opt.listchars:append({trail = '·', eol = '↲'})
-- opt.listchars = "tab:|.,trail:_,extends:>,precedes:<,nbsp:~,eol:¬"
opt.indentkeys:remove(':,<:>')
opt.fillchars:append({fold = ' '})
opt.fillchars:append({foldopen = '▾', foldsep = '│', foldclose = '▸'})
opt.fillchars:append({
   horiz = '━',
   horizup = '┻',
   horizdown = '┳',
   vert = '┃',
   vertleft = '┨',
   vertright = '┣',
   verthoriz = '╋',
  })
opt.showbreak = "↪ "

-- menus
opt.winblend = 8
opt.pumblend = 8
opt.wildignore = '*.swp,*.bak,*.pyc,*.class'
opt.wildmode = "list:longest" -- Command-line completion mode
opt.wildoptions = "pum"
opt.wildignorecase = true -- Ignore case command completion menu

-- misc
opt.hidden = true -- Enable modified buffers in background
opt.shada = {"!", "'1000", "<50", "s10", "h"} -- remember stuff across sessions
opt.joinspaces = false -- No double spaces with join after a dot
opt.timeoutlen = 400 -- Don't wait more that 400ms for normal mode commands
opt.undofile = true
opt.undodir = "/tmp/undodir"
opt.swapfile = false -- I have OCD file saving issues anyway
opt.backup = false
opt.writebackup = false
opt.lazyredraw = false
opt.ttyfast = true
opt.title = true
opt.updatetime = 200

-- nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

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
