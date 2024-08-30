return {
	{ "ellisonleao/gruvbox.nvim" },
	{ "sainnhe/gruvbox-material" },
	{ "sainnhe/everforest" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "folke/tokyonight.nvim" },
	{ "AlexvZyl/nordic.nvim" },
	{ "gbprod/nord.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "embark-theme/vim" },
	{ "rmehri01/onenord.nvim" },

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
