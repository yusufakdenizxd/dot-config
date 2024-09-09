return {
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "sainnhe/gruvbox-material", lazy = true },
	{ "sainnhe/everforest", lazy = true },
	{ "rose-pine/neovim", name = "rose-pine", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "AlexvZyl/nordic.nvim", lazy = true },
	{ "gbprod/nord.nvim", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "embark-theme/vim", lazy = true },
	{ "rmehri01/onenord.nvim", lazy = true },
	{ "luisiacc/gruvbox-baby", lazy = true },

	{
		"zaldih/themery.nvim",
		config = function()
			require("themery").setup({
				themes = {
					{
						name = "Gruvbox dark",
						colorscheme = "gruvbox",
						before = [[
                -- All this block will be executed before apply "set colorscheme"
                vim.opt.background = "dark"
              ]],
					},
					{
						name = "Gruvbox Material",
						colorscheme = "gruvbox-material",
					},

					{
						name = "Gruvbox Baby",
						colorscheme = "gruvbox-baby",
					},

					{
						name = "Rose Pine",
						colorscheme = "rose-pine",
					},

					{
						name = "Everforest",
						colorscheme = "everforest",
					},

					{
						name = "Nordic",
						colorscheme = "nordic",
					},
					{
						name = "Nord",
						colorscheme = "nord",
					},
					{
						name = "One Nord",
						colorscheme = "onenord",
					},

					{
						name = "Embark",
						colorscheme = "embark",
					},

					{
						name = "Kanagawa",
						colorscheme = "kanagawa",
					},

					{
						name = "Tokyo Night",
						colorscheme = "tokyonight-night",
					},
					{
						name = "Tokyo Moon",
						colorscheme = "tokyonight-moon",
					},
					{
						name = "Tokyo Storm",
						colorscheme = "tokyonight-storm",
					},
				},
				livePreview = true,
			})
		end,
	},
}
