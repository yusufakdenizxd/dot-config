return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = "hrsh7th/nvim-cmp",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({
				disable_in_visualblock = false,
				disable_in_replace_mode = true,
				ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
				check_ts = true,
				map_c_w = true,
				enable_check_bracket_line = true,
			})
			local rule = require("nvim-autopairs.rule")

			autopairs.add_rules({
				rule("<", ">"):with_pair(function(opts)
					return opts.next_char ~= ">"
				end),
				rule(">", ">")
					:with_pair(function(_)
						return false
					end)
					:with_move(function(opts)
						return opts.char == ">"
					end)
					:use_key(">"), -- The key that triggers the move feature
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"numToStr/Comment.nvim",
	},

	{
		"xiyaowong/transparent.nvim",
		config = true,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{ "CRAG666/code_runner.nvim", config = true },
	{
		"stevearc/oil.nvim",
		opts = {
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup({
				copy_sync = {
					enable = false,
				},
			})
		end,
	},
	{
		"unblevable/quick-scope",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1200
		end,
		opts = {},
	},
	{ "mistricky/codesnap.nvim", build = "make" },
	{
		dir = "/Users/yusufakdeniz/dev/python-notebook",
		config = true,
		-- Burada paket ayarlarını ekleyebilirsin
	},
	{
		"MagicDuck/grug-far.nvim",
		config = true,
	},
}
