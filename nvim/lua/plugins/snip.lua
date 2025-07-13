return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		lazy = "InsertEnter",
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/snippets/" })
		end,
	},
}
