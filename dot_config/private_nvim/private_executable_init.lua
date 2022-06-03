-------------------- load packer on all machines --------------------
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

-------------------- load other lua configurations --------------------
require('nvim-settings')
require('plugins')
require('lspinstaller-settings')
require('lspkind-settings')
require('navigator-settings')
require('mappings')
require('markdown')
require('statusline')

-------------------- functions --------------------
-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-imports
-- function OrgImports(wait_ms)
--   local params = vim.lsp.util.make_range_params()
--   params.context = { only = { "source.organizeImports" } }
--   local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
--   for _, res in pairs(result or {}) do
--     for _, r in pairs(res.result or {}) do
--       if r.edit then
--         vim.lsp.util.apply_workspace_edit(r.edit)
--       else
--         vim.lsp.buf.execute_command(r.command)
--       end
--     end
--   end
-- end

-------------------- autocmds --------------------
-- forces filetype of HTML on go templates
vim.cmd(([[
  function DetectGoHtmlTmpl()
    if expand('%:e') == "tmpl" && search("{{") != 0
        set filetype=html
    endif
  endfunction

  augroup filetypedetect
      au! BufRead,BufNewFile * call DetectGoHtmlTmpl()
  augroup END
]]))

-- restore cursor position
vim.cmd(([[
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]))

-- recompile automatically when editing *.lua
vim.cmd(([[
  autocmd BufWritePost *.lua PackerCompile
]]))

-- auto-formatting settings
-- lua auto-formatter
-- run cmd: "lua vim.lsp.buf.formatting()"
-- this will auto-format LUA files on save:
-- vim.cmd(([[
--   autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
-- ]]))

-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-imports
-- vim.cmd(([[
--   autocmd BufWritePre *.go lua OrgImports(1000)
--   autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 100)
-- ]]))

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
