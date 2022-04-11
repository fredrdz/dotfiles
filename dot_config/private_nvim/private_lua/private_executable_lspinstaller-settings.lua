-- https://github.com/williamboman/nvim-lsp-installer
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})

local enhance_server_opts = {
  ['sumneko_lua'] = function(opts)
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    }
  end,
  ['tsserver'] = function(opts)
    opts.on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
    end
  end,
  ['gopls'] = function(opts)
    opts.settings = {
      gopls = {
        templateExtensions = { "gohtml", "gohtmltmpl", "gotexttmpl", "gotmpl", "tmpl", "tpl", "html.tmpl" },
        analyses = { unusedparams = true, unreachable = false, shadow = true },
        codelenses = {
          generate = true, -- show the `go generate` lens.
          gc_details = true, --  // Show a code lens toggling the display of gc's choices.
          test = true,
          tidy = true,
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        matcher = "Fuzzy",
        diagnosticsDelay = "500ms",
        experimentalWatchedFileDelay = "100ms",
        symbolMatcher = "fuzzy",
        ["local"] = "",
        gofumpt = true, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
        buildFlags = { "-tags", "integration" },
        -- buildFlags = {"-tags", "functional"}
      }
    }
  end,
}

lsp_installer.on_server_ready(function(server)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          commitCharactersSupport = true,
          deprecatedSupport = true,
          documentationFormat = { "markdown", "plaintext" },
          preselectSupport = true,
          insertReplaceSupport = true,
          labelDetailsSupport = true,
          snippetSupport = true,
          resolveSupport = {
            properties = {
              "documentation",
              "details",
              "additionalTextEdits",
            },
          },
        },
        contextSupport = true,
        dynamicRegistration = true,
      },
    },
  }

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true, -- Enable underline, use default values
      virtual_text = { spacing = 3, source = true }, -- show virtual for diagnostic message
      update_in_insert = true, -- update diagnostic message in insert mode
      severity_sort = { reverse = true }
    }
  )

  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = { allow_incremental_sync = true, debounce_text_changes = 150 }
  }

  if enhance_server_opts[server.name] then
    enhance_server_opts[server.name](opts)
  end

  -- server:setup(opts)
end)
