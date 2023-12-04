-- customize lsp formatting options
return {
  -- control auto formatting on save
  format_on_save = {
    enabled = true,     -- enable or disable format on save globally
    allow_filetypes = { -- enable format on save for specified filetypes only
      -- "go",
    },
    ignore_filetypes = { -- disable format on save for specified filetypes
      -- "markdown",
    },
  },

  disabled = { -- disable formatting capabilities for the listed language servers
    -- "lua_ls",
  },

  timeout_ms = 3000, -- default format timeout

  filter = function(client)
    local filetypes = {
      toml = "taplo",
      yaml = "null-ls",
      json = "null-ls",
      css = "null-ls",
      markdown = "null-ls",
      scss = "null-ls",
      javascript = "null-ls",
      typescript = "null-ls",
    }

    local filetype = vim.bo.filetype

    return filetypes[filetype] == client.name or true
  end,
}
