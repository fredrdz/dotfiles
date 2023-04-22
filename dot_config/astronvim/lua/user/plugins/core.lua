return {
	-- customize alpha options
	{
		"goolord/alpha-nvim",
		opts = function(_, opts)
			-- customize the dashboard header
			opts.section.header.val = {
				" █████  ███████ ████████ ██████   ██████",
				"██   ██ ██         ██    ██   ██ ██    ██",
				"███████ ███████    ██    ██████  ██    ██",
				"██   ██      ██    ██    ██   ██ ██    ██",
				"██   ██ ███████    ██    ██   ██  ██████",
				" ",
				"    ███    ██ ██    ██ ██ ███    ███",
				"    ████   ██ ██    ██ ██ ████  ████",
				"    ██ ██  ██ ██    ██ ██ ██ ████ ██",
				"    ██  ██ ██  ██  ██  ██ ██  ██  ██",
				"    ██   ████   ████   ██ ██      ██",
			}
			return opts
		end,
	},
	-- You can disable default plugins as follows:
	-- { "max397574/better-escape.nvim", enabled = false },
	--
	-- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
	-- {
	--   "L3MON4D3/LuaSnip",
	--   config = function(plugin, opts)
	--     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
	--     -- add more custom luasnip configuration such as filetype extend or custom snippets
	--     local luasnip = require "luasnip"
	--     luasnip.filetype_extend("javascript", { "javascriptreact" })
	--   end,
	-- },
	{
		-- override nvim-autopairs plugin
		"windwp/nvim-autopairs",
		config = function(plugin, opts)
			-- run default AstroNvim config
			require("plugins.configs.nvim-autopairs")(plugin, opts)
			-- require Rule function
			local Rule = require("nvim-autopairs.rule")
			local npairs = require("nvim-autopairs")
			npairs.add_rules({
				{
					-- specify a list of rules to add
					Rule(" ", " "):with_pair(function(options)
						local pair = options.line:sub(options.col - 1, options.col)
						return vim.tbl_contains({ "()", "[]", "{}", "{{}}" }, pair)
					end),
					Rule("( ", " )")
						:with_pair(function()
							return false
						end)
						:with_move(function(options)
							return options.prev_char:match(".%)") ~= nil
						end)
						:use_key(")"),
					Rule("{ ", " }")
						:with_pair(function()
							return false
						end)
						:with_move(function(options)
							return options.prev_char:match(".%}") ~= nil
						end)
						:use_key("}"),
					Rule("{{ ", " }}")
						:with_pair(function()
							return false
						end)
						:with_move(function(options)
							return options.prev_char:match(".%}") ~= nil
						end)
						:use_key("}"),
					Rule("[ ", " ]")
						:with_pair(function()
							return false
						end)
						:with_move(function(options)
							return options.prev_char:match(".%]") ~= nil
						end)
						:use_key("]"),
				},
			})
		end,
	},
	-- By adding to the which-key config and using our helper function you can add more which-key registered bindings
	-- {
	--   "folke/which-key.nvim",
	--   config = function(plugin, opts)
	--     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
	--     -- Add bindings which show up as group name
	--     local wk = require "which-key"
	--     wk.register({
	--       b = { name = "Buffer" },
	--     }, { mode = "n", prefix = "<leader>" })
	--   end,
	-- },
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			window = {
				position = "right",
				width = 30,
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						--auto close
						require("neo-tree").close_all()
					end,
				},
				{
					event = "neo_tree_window_after_open",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
				{
					event = "neo_tree_window_after_close",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
			},
		},
	},
}
