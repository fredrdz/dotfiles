return require('packer').startup(function(use)

  use "wbthomason/packer.nvim"

  use 'christoomey/vim-tmux-navigator'
  use { 'numToStr/FTerm.nvim',
    config = function()
      require('FTerm').setup({
        border     = 'single',
        blend      = 8,
        hl         = 'Terminal',
        dimensions = {
          height = 0.9,
          width = 0.9,
        },
      })
    end,
  }

  use { 'rebelot/kanagawa.nvim',
    config = function()
      -- Default options:
      require('kanagawa').setup({
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true, -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        transparent = false, -- do not set background color
        dimInactive = true, -- dim inactive window `:h hl-NormalNC`
        globalStatus = true, -- adjust window separators highlight for laststatus=3
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {},
        overrides = {},
      })
    end,
  }

  -- telescope plugins
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('telescope').setup {
        extensions = {
          file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
          },
        },
      }
      -- To get telescope-file-browser loaded and working with telescope,
      -- you need to call load_extension, somewhere after setup function:
      require('telescope').load_extension "file_browser"
    end,
  }

  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = 'nvim-telescope/telescope.nvim',
  }

  -- Tag and symbol navigator
  use { 'liuchengxu/vista.vim' }

  use { "folke/which-key.nvim",
    config = function()
      vim.g.timeoutlen = 3000
    end,
  }

  -- use { "fatih/vim-go" }
  use { "phelipetls/vim-hugo" }

  -- tpope, the legend
  use { "tpope/vim-commentary" }
  use { "tpope/vim-repeat" } -- repeat commands
  use { "tpope/vim-surround" } -- cs)] turns surrounding ) into ]


  use { "vim-test/vim-test",
    requires = { { 'preservim/vimux' } }
  }

  use { "junegunn/vim-easy-align" }

  -- popup markdown preview
  use { "ellisonleao/glow.nvim" }

  -- git stuff
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function() require("gitsigns").setup() end,
  }

  use {
    "TimUntersberger/neogit",
    requires = { "sindrets/diffview.nvim", "nvim-lua/plenary.nvim" },
    -- commit = "53772efc42263989d18d4a86c350b8b0e1f1b71b", -- https://github.com/TimUntersberger/neogit/issues/206
    config = function() require("neogit").setup {
        disable_commit_confirmation = true,
        integrations = {
          diffview = true
        }
      }
    end,
  }

  use { "samoshkin/vim-mergetool" }

  -- buffers
  use {
    'akinsho/nvim-bufferline.lua',
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("bufferline").setup() end,
  }
  use { 'kazhala/close-buffers.nvim' }

  use { "famiu/bufdelete.nvim" }

  -- incremental syntax parsing, the mother of modernity
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      local ts = require "nvim-treesitter.configs"
      ts.setup {
        matchup = {
          enable = true, -- mandatory, false will disable the whole extension
          --disable = { "c", "ruby" },  -- optional, list of language that will be disabled
          -- [options]
        },
        ensure_installed = "all",
        highlight = {
          enable = true,
          -- disable = { "html" },
          additional_vim_regex_highlighting = false
        },
        autopairs = {
          enable = true
        },
        autotag = {
          enable = true
        },
        indent = { enable = true, disable = { "python" } }
      }
    end,
  }
  use { "nvim-treesitter/nvim-treesitter-textobjects" }

  -- trailing whitespaces
  use {
    "ntpeters/vim-better-whitespace",
  }

  -- file tree instead of nerdtree (needs a patched font from: https://www.nerdfonts.com/)
  use { "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = {
      "NvimTreeToggle",
    },
    config = function()
      require('nvim-tree').setup {
        disable_netrw = false,
        hijack_netrw = true,
        auto_reload_on_write = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        view = {
          -- width = 40,
          -- height = 40,
          side = "right",
          centralize_selection = true,
          adaptive_size = true,
          preserve_window_proportions = false,
          number = false,
          relativenumber = false,
          signcolumn = "yes",
          mappings = {
            custom_only = false,
            list = {
              -- user mappings go here
            },
          },
        },
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        actions = {
          change_dir = {
            enable = true,
            global = false,
          },
          open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
              enable = true,
              chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
              exclude = {
                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
              },
            },
          },
          remove_file = {
            close_window = true,
          },
        },
      }
    end,
  }

  -- buffer enhancements
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('autopairs-config')
    end,
  }
  use { "yggdroot/indentline" }
  use { "andymass/vim-matchup" }
  use { "rrethy/vim-hexokinase", run = "make hexokinase" }

  -- show code actions as lightbulb
  use { "kosayoda/nvim-lightbulb" }

  use {
    'windwp/nvim-spectre',
    requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-lua/popup.nvim' } }
  }

  -- LSP plugins
  use {
    'onsails/lspkind-nvim',
    config = function()
      require('lspkind-config')
    end,
  }

  use({
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      ({
        'hrsh7th/nvim-cmp',
        config = function()
          require('cmp-config')
        end
      }),
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-emoji' },
      ({
        'petertriho/cmp-git',
        requires = 'nvim-lua/plenary.nvim'
      }),

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
      { 'golang/vscode-go' },
    },
    config = function()
      local lsp = require('lsp-zero')
      lsp.preset('lsp-compe')
      -- lsp.preset('recommended')
      lsp.ensure_installed({
        'bashls',
        'gopls',
        'html',
        'sumneko_lua',
        'tailwindcss',
        'yamlls',
      })
      lsp.nvim_workspace()
      lsp.setup()
    end,
  })

  -- use({
  --   "ray-x/navigator.lua",
  --   requires = {
  --     { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
  --     { "neovim/nvim-lspconfig" },
  --     { "onsails/lspkind-nvim" },
  --     { "ray-x/lsp_signature.nvim" },
  --   },
  --   config = function()
  --     require("navigator").setup({
  --       mason = true,
  --     })
  --   end,
  -- })

  -- use({
  --   'williamboman/mason-lspconfig.nvim',
  --   requires = {
  --     { 'williamboman/mason.nvim' },
  --   },
  --   config = function()
  --     require("mason").setup()
  --     require("mason-lspconfig").setup({})
  --     require("mason-lspconfig").setup_handlers {
  --       -- The first entry (without a key) will be the default handler
  --       -- and will be called for each installed server that doesn't have
  --       -- a dedicated handler.
  --       function(server_name) -- default handler (optional)
  --         local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

  --         if not cmp_nvim_lsp_status_ok then
  --           print('MASON LSPCONFIG ENCOUNTERED AN ERROR!')
  --           return
  --         end

  --         -- used to enable autocompletion (assign to every lsp server config)
  --         local capabilities = cmp_nvim_lsp.default_capabilities()

  --         require('lspconfig')[server_name].setup {
  --           capabilities = capabilities
  --         }
  --       end,
  --     }
  --   end,
  -- })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine-config')
    end,
  }

  use { "mfussenegger/nvim-lint" }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
