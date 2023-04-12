return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      -- Default options:
      require("kanagawa").setup({
        compile = true,           -- enable compiling the colorscheme
        undercurl = true,         -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,            -- do not set background color
        dimInactive = true,            -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,         -- define vim.g.terminal_color_{0,17}
        colors = {
          -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} }
        },
        overrides = function(colors)         -- add/modify highlights
          return {}
        end,
        theme = "wave",         -- Load "wave" theme when 'background' option is not set
        background = {
          -- map the value of 'background' option to a theme
          dark = "wave",           -- try "dragon" !
          light = "lotus"
        }
      })
    end
  }, { "phelipetls/vim-hugo" }, { "tiagovla/scope.nvim" },
  { "andymass/vim-matchup", after = "nvim-treesitter" }
}
