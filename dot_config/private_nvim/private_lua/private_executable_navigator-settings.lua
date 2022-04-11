-- https://github.com/ray-x/navigator.lua
local path = require 'nvim-lsp-installer.path'
local install_root_dir = path.concat { vim.fn.stdpath 'data', 'lsp_servers' }

require 'navigator'.setup({
  debug = true, -- log output, set to true and log path: ~/.cache/nvim/gh.log
  width = 0.9, -- max width ratio (number of cols for the floating window) / (window width)
  height = 0.4, -- max list window height, 0.3 by default
  preview_height = 0.4, -- max height of preview windows
  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
  -- 'shadow', or a list of chars which defines the border

  default_mapping = true, -- set to false if you will remap every key
  -- keymaps = {
  --   { mode = 'i', key = '<M-k>', func = 'signature_help()' },
  --   { key = "<c-i>", func = "signature_help()" },
  -- }, -- a list of key maps

  treesitter_analysis = true, -- treesitter variable context
  transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
  lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator

  lsp_installer = true, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer

  lsp = {
    code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    format_on_save = true, -- set to false to disable lsp code format on save (if you are using prettier/efm/formater etc)
    --disable_format_cap = {"sqls", "sumneko_lua", "gopls"},  -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
    --disable_lsp = {'pylsd', 'sqlls'}, -- a list of lsp server disabled for your project, e.g. denols and tsserver you may
    -- only want to enable one lsp server
    -- to disable all default config and use your own lsp setup set
    -- disable_lsp = 'all'
    -- Default {}
    diagnostic = {
      underline = true,
      virtual_text = true, -- show virtual for diagnostic message
      update_in_insert = true, -- update diagnostic message in insert mode
    },
    diagnostic_scrollbar_sign = { '▃', '▆', '█' }, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
    -- for other style, set to {'╍', 'ﮆ'} or {'-', '='}
    diagnostic_virtual_text = true, -- show virtual for diagnostic message
    diagnostic_update_in_insert = true, -- update diagnostic message in insert mode
    disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you want to ignore it
    gopls = { cmd = { install_root_dir .. '/go/gopls' } },
    sumneko_lua = { cmd = { install_root_dir .. '/sumneko_lua/extension/server/bin/lua-language-server' } },
    bashls = { cmd = { install_root_dir .. '/bash/node_modules/bash-language-server/bin/main.js', 'bash-language-server', 'start' } },
    yamlls = { cmd = { install_root_dir .. '/yaml/node_modules/yaml-language-server/bin/yaml-language-server', '--stdio' } },
    emmet_ls = { cmd = { install_root_dir .. '/emmet_ls/node_modules/emmet_ls/out/server.js', '--stdio' } },
    html = { cmd = { install_root_dir .. '/html/node_modules/vscode-langservers-extracted/bin/vscode-html-language-server', '--stdio' } },
    tailwindcss_npm = { cmd = { install_root_dir .. '/tailwindcss_npm/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server', '--stdio' } },
    angularls = { cmd = { install_root_dir .. '/angularls/node_modules/typescript/bin/tsserver', '--stdio' } },
    --servers = {'cmake', 'ltex'}, -- by default empty, and it should load all LSP clients avalible based on filetype
    -- but if you whant navigator load  e.g. `cmake` and `ltex` for you , you
    -- can put them in the `servers` list and navigator will auto load them.
    -- you could still specify the custom config  like this
    -- cmake = {filetypes = {'cmake', 'makefile'}, single_file_support = false},
  }
})
