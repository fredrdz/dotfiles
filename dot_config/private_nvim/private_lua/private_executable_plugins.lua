return require("packer").startup(function(use)

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
        commentStyle = "italic",
        functionStyle = "NONE",
        keywordStyle = "italic",
        statementStyle = "bold",
        typeStyle = "NONE",
        variablebuiltinStyle = "italic",
        specialReturn = true, -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        globalStatus = true, -- adjust window separators highlight for laststatus=3
        colors = {},
        overrides = {},
      })
    end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
  }

  use { "folke/which-key.nvim",
    config = function()
      vim.g.timeoutlen = 3000
    end,
  }

  --use { "fatih/vim-go" }
  --use { "preservim/nerdtree" }

  -- tpope, the legend
  use { "tpope/vim-commentary" }
  use { "tpope/vim-repeat" } -- repeat commands
  -- use { "tpope/vim-vinegar" } -- press - for local filebrowser
  use { "tpope/vim-surround" } -- cs)] turns surrounding ) into ]


  use { "vim-test/vim-test",
    requires = { { 'preservim/vimux' } }
  }

  use { "junegunn/vim-easy-align" }

  -- popup markdown preview
  use { "npxbr/glow.nvim", run = ":GlowInstall" }

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
          disable = { "html" },
          additional_vim_regex_highlighting = true
        } }
    end,
  }

  -- trailing whitespaces
  use {
    "ntpeters/vim-better-whitespace",
    config = function()
      -- strip only if I touched the line
      vim.g.strip_only_modified_lines = 1
      vim.g.strip_whitespace_on_save = 1
      vim.g.strip_whitespace_confirm = 0
    end,
  }

  -- file tree instead of nerdtree (needs a patched font from: https://www.nerdfonts.com/)
  use { "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = {
      "NvimTreeToggle",
    },
    config = function()
      require 'nvim-tree'.setup {
        disable_netrw = false,
        hijack_netrw = true,
        update_cwd = true,
        view = {
          width = 40,
          height = 40,
          side = "right",
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
        update_to_buf_dir = {
          enable = true,
          auto_open = true,
        },
        update_focused_file = {
          enable = true,
          update_cwd = true,
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
        },
      }
    end,
  }

  -- snippets
  use { "hrsh7th/vim-vsnip" }
  use { "hrsh7th/vim-vsnip-integ" }
  use { "golang/vscode-go" }

  -- autocompletion
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif vim.fn['vsnip#available'](1) == 1 then
      return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    elseif vim.fn['vsnip#jumpable'](-1) == 1 then
      return t "<Plug>(vsnip-jump-prev)"
    else
      -- If <S-Tab> is not working in your terminal, change it to <C-h>
      return t "<S-Tab>"
    end
  end

  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

  use {
    "hrsh7th/nvim-compe",
    config = function()
      require("compe").setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = "enable",
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,

        source = { path = true, buffer = false, calc = true, nvim_lsp = true, nvim_lua = true, vsnip = true },
      }
    end,
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
      require("nvim-autopairs.completion.compe").setup({
        map_cr = true, --  map <CR> on insert mode
        map_complete = true -- it will auto insert `(` after select function or method item
      })
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

  -- LSP goodies
  use {
    "williamboman/nvim-lsp-installer",
    {
      "neovim/nvim-lspconfig",
      "onsails/lspkind-nvim",
      "ray-x/lsp_signature.nvim",
    },
    "ray-x/navigator.lua",
    "ray-x/guihua.lua",
    { run = 'cd lua/fzy && make' }
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { "mfussenegger/nvim-lint" }
end)
