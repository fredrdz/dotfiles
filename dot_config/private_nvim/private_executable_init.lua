-------------------- load packer on all machines --------------------
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- Ensure that packer is installed.
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

-- Use a protected call so we don't error out on first use.
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

vim.cmd('packadd packer.nvim')
local util = require 'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
  -- Have packer use a popup windows.
  display = {
    open_fn = function()
      return util.float({ border = 'single' })
    end
  }
})

-- Load lua configurations.
require('nvim-settings')
require('plugins')
require('lspkind-settings')
require('mappings')
require('markdown')
require('statusline')

-------------------- autocmds --------------------

-- Restore cursor position.
vim.cmd(([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]))

-- NvimTree auto close on last window.
vim.cmd(([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]))

-------------------- color scheme options  --------------------
-- highlight Visual guibg=#16B2C3 guifg=#181818
-- highlight Search gui=italic guibg=#FF4C29 guifg=#2C394B
-- highlight Pmenu guibg=#082032
-- highlight PmenuSel guibg=#7af9ff gui=none guifg=#181818
-- highlight PmenuSbar guibg=#EEEEEE
-- highlight PmenuThumb guibg=#16B2C3
-- highlight CursorColumn guibg=#2C394B
-- highlight CursorLine guibg=#2C394B
vim.cmd(([[
  function! MyHighlights() abort
    highlight MatchParen guifg=#FFFFFF gui=bold
    highlight MatchWord guifg=#FFFFFF gui=bold
    highlight MatchParenCur gui=bold
    highlight MatchWordCur gui=bold
    highlight WhichkeyFloat guibg=#334756
    highlight default GHListDark guifg=#e0d8f4 guibg=#334756
    highlight default GHTextViewDark guifg=#e0d8f4 guibg=#082032
    highlight default GHListHl guifg=#181818 guibg=#7af9ff
    highlight FloatBorder guifg=#16B2C3
    highlight NormalFloat guibg=#082032
    highlight Terminal guibg=#082032
    highlight KeywordFunction gui=bold gui=italic guifg=#FF4C29
  endfunction

  augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
  augroup END
]]))

vim.cmd [[colorscheme kanagawa]]
