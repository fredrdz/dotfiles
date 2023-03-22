return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- packs
  { import = "astrocommunity.pack.go",                      enabled = true },
  { import = "astrocommunity.pack.lua",                     enabled = true },
  { import = "astrocommunity.pack.markdown",                enabled = true },
  { import = "astrocommunity.pack.tailwindcss",             enabled = true },
  { import = "astrocommunity.pack.toml",                    enabled = false },
  { import = "astrocommunity.pack.typescript",              enabled = true },
  { import = "astrocommunity.pack.yaml",                    enabled = true },

  -- diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim",     enabled = true },

  -- indent
  { import = "astrocommunity.indent.indent-blankline-nvim", enabled = true },
  { import = "astrocommunity.indent.mini-indentscope",      enabled = true },

  -- motion
  { import = "astrocommunity.motion.leap-nvim",             enabled = false },
}
