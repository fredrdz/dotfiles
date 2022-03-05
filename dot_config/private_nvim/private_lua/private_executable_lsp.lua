local nvim_lsp = require("lspconfig")
local sumneko_root_path = "/usr/local/share/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

-- Enable completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {properties = {'documentation', 'detail', 'additionalTextEdits'}}

nvim_lsp.sumneko_lua.setup({
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            completion = {enable = true, callSnippet = "Both"},
            diagnostics = {
                enable = true,
                -- Get the language server to recognize the `vim` global
                globals = {'vim', 'describe'},
                disable = {"lowercase-global"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    },
    on_attach = require("utils").on_attach
})

nvim_lsp.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            }
        }
    }
}

-- Setup basic lsp servers
for _, server in pairs({"html", "cssls", "jsonls", "bashls", "diagnosticls", "dockerls", "tailwindcss", "vimls"}) do
    nvim_lsp[server].setup {
        -- Add capabilities
        capabilities = capabilities,
        on_attach = require("utils").on_attach
    }
end
