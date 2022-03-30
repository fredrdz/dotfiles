-- https://github.com/ray-x/navigator.lua
-- local path = require 'nvim-lsp-installer.path'
-- local install_root_dir = path.concat {vim.fn.stdpath 'data', 'lsp_servers'}

require'navigator'.setup({
  debug = true, -- log output, set to true and log path: ~/.cache/nvim/gh.log
  width = 0.9, -- max width ratio (number of cols for the floating window) / (window width)
  height = 0.4, -- max list window height, 0.3 by default
  preview_height = 0.4, -- max height of preview windows
  border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}, -- border style, can be one of 'none', 'single', 'double',
                                                     -- 'shadow', or a list of chars which defines the border

  default_mapping = true,  -- set to false if you will remap every key
  -- keymaps = {
  --   { mode = 'i', key = '<M-k>', func = 'signature_help()' },
  --   { key = "<c-i>", func = "signature_help()" },
  -- }, -- a list of key maps

  treesitter_analysis = true, -- treesitter variable context
  transparency = 50,          -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
  lsp_signature_help = true,  -- if you would like to hook ray-x/lsp_signature plugin in navigator

  lsp_installer = true, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
})
