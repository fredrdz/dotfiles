-------------------- load packer on all machines --------------------
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

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
vim.opt.wildmode = "list:longest" -- Command-line completion mode
vim.opt.wildoptions = "pum"
vim.opt.shada = {"!", "'1000", "<50", "s10", "h"} -- remember stuff across sessions
vim.opt.undofile = true
vim.opt.undodir = "/tmp/undodir"
vim.opt.swapfile = false -- I have OCD file saving issues anyway
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.title = true
vim.opt.updatetime = 400
vim.opt.backspace = {"indent", "eol", "start"}

-------------------- restore cursor position --------------------
vim.cmd(([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]))

-------------------- recompile automatically when editing plugins.lua --------------------
vim.cmd(([[
  autocmd BufWritePost plugins.lua PackerCompile
]]))

-------------------- set leader to space early --------------------
vim.g.mapleader = " "

-------------------- set test strategy to vimux --------------------
vim.g["test#strategy"] = "vimux"

-------------------- nvim.tree settings --------------------
vim.g.nvim_tree_width = "10%"
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_respect_buf_cwd = 0

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

-------------------- efm-language-server (lua) settings --------------------
-- lua auto-formatter
-- run cmd: "lua vim.lsp.buf.formatting()"
-- this will auto-format LUA files on save:
vim.cmd(([[
  autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
]]))

-------------------- load other lua configurations --------------------
require("plugins")
require("mappings")
--require("go")
require("statusline")
require("markdown")
--require("lsp")
require("lspinstaller")

-------------------- color scheme options  --------------------
vim.cmd(([[
  function! MyHighlights() abort
    highlight MatchParen guifg=#FFFFFF gui=bold
    highlight MatchWord guifg=#FFFFFF gui=bold
    highlight MatchParenCur gui=bold
    highlight MatchWordCur gui=bold
    highlight CursorColumn guibg=#2C394B
    highlight CursorLine guibg=#2C394B
    highlight Pmenu guibg=#082032
    highlight PmenuSel guibg=#7af9ff gui=none guifg=#181818
    highlight PmenuSbar guibg=#EEEEEE
    highlight PmenuThumb guibg=#16B2C3
    highlight Visual guibg=#16B2C3 guifg=#181818
    highlight Search guibg=#FDE49C gui=italic guifg=#181818
    highlight FloatBorder guifg=#16B2C3
    highlight NormalFloat guibg=#082032
    highlight WhichkeyFloat guibg=#334756
    highlight Terminal guibg=#2C394B
    highlight default GHListDark guifg=#e0d8f4 guibg=#334756
    highlight default GHTextViewDark guifg=#e0d8f4 guibg=#082032
    highlight default GHListHl guifg=#181818 guibg=#7af9ff
  endfunction

  augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
  augroup END
]]))

vim.cmd [[colorscheme onedark]]
