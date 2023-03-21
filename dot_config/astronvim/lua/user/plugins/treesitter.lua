return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- ensure_installed = { "lua" },
    highlight = { disable = { "help" } },
    indent = { enable = true, disable = { "python" } },
    matchup = { enable = true },
  },
}
