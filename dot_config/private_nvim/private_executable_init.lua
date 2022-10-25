-------------------- load packer on all machines --------------------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- load other lua configurations
require('nvim-settings')
require('plugins')
require('lspkind-settings')
require('mappings')
require('markdown')
require('statusline')

-------------------- autocmds --------------------
-- restore cursor position
vim.cmd(([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]))

-- recompile automatically when editing *.lua
vim.cmd(([[
  autocmd BufWritePost *.lua PackerCompile
]]))

-- NvimTree auto close on last window
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
