return {
	-- Add the community repository of plugin specifications
	"AstroNvim/astrocommunity",
	-- example of imporing a plugin, comment out to use it or add your own
	-- available plugins can be found at https://github.com/AstroNvim/astrocommunity

	-- completion
	{ import = "astrocommunity.completion.copilot-lua-cmp" },

	-- packs
	{ import = "astrocommunity.pack.bash", enabled = true },
	{ import = "astrocommunity.pack.go", enabled = true },
	{ import = "astrocommunity.pack.lua", enabled = true },
	{ import = "astrocommunity.pack.markdown", enabled = true },
	{ import = "astrocommunity.pack.tailwindcss", enabled = true },
	{ import = "astrocommunity.pack.toml", enabled = true },
	{ import = "astrocommunity.pack.typescript", enabled = true },
	{ import = "astrocommunity.pack.yaml", enabled = true },

	-- diagnostics
	{ import = "astrocommunity.diagnostics.lsp_lines-nvim", enabled = true },
	{ import = "astrocommunity.diagnostics.trouble-nvim", enabled = true },

	-- editing-support
	{ import = "astrocommunity.editing-support.neogen", enabled = true },

	-- indent
	{ import = "astrocommunity.indent.indent-blankline-nvim", enabled = true },
	{ import = "astrocommunity.indent.indent-tools-nvim", enabled = true },
	{ import = "astrocommunity.indent.mini-indentscope", enabled = true },

	-- motion
	{ import = "astrocommunity.motion.leap-nvim", enabled = true },
	{ import = "astrocommunity.motion.mini-move", enabled = true },

	-- project
	{ import = "astrocommunity.project.project-nvim", enabled = true },
	{ import = "astrocommunity.project.nvim-spectre", enabled = true },

	-- syntax
	{ import = "astrocommunity.syntax.hlargs-nvim", enabled = true },
	{ import = "astrocommunity.syntax.vim-easy-align", enabled = true },

	-- color
	{ import = "astrocommunity.color.headlines-nvim", enabled = true },
	{ import = "astrocommunity.color.tint-nvim", enabled = true },

	-- utility
	{ import = "astrocommunity.utility.noice-nvim", enabled = true },
}
