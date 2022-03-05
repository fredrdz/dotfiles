-- local lsp_installer = require("nvim-lsp-installer")

-- lsp_installer.on_server_ready(function(server)
--   local opts = {}
--   server:setup(opts)
-- end)

require('lspkind').init({
    -- DEPRECATED (use mode instead): enables text annotations
    --
    -- default: true
    -- with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

-- https://github.com/ray-x/navigator.lua
local path = require 'nvim-lsp-installer.path'
local install_root_dir = path.concat {vim.fn.stdpath 'data', 'lsp_servers'}

require'navigator'.setup({
  debug = false, -- log output, set to true and log path: ~/.cache/nvim/gh.log
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
  transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
  lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
  -- setup here. if it is nil, navigator will not init signature help
  --signature_help_cfg = nil, -- if you would like to init ray-x/lsp_signature plugin in navigator, and pass in your own config to signature help

  lsp_installer = false, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
  lsp = {
    code_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
    code_lens_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
    format_on_save = true, -- set to false to disable lsp code format on save (if you are using prettier/efm/formater etc)
    diagnostic_virtual_text = true,  -- show virtual for diagnostic message
    diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
    disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you  want to

    gopls = {   -- gopls setting
      cmd = { install_root_dir .. '/go/gopls' },
      on_attach = function(client, bufnr)  -- on_attach for gopls
        -- your special on attach here
        -- e.g. disable gopls format because a known issue https://github.com/golang/go/issues/45732
        client.resolved_capabilities.document_formatting = false
      end,
      settings = {
        gopls = {gofumpt = true} -- disable gofumpt etc,
      }
    },
    sumneko_lua = { cmd = { install_root_dir .. '/sumneko_lua/extension/server/bin/lua-language-server' } },
    yamlls = { cmd = { install_root_dir .. '/yaml/node_modules/yaml-language-server/bin/yaml-language-server', '--stdio' } },
    bashls = { cmd = { install_root_dir .. '/bash/node_modules/bash-language-server/bin/main.js', 'bash-language-server', 'start' } },
  }
})
