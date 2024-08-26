local opts = {
	ensure_installed = {
		"lua",
		"rust",
		"dart",
		"php_only",
		"php",
		"fish",
		"rasi",
		"c",
		"vim",
		"vimdoc",
		"query",
		"c_sharp",
		"css",
		"diff",
		"gitcommit",
		"gitignore",
		"html",
		"json",
		"jsonc",
		"markdown",
		"markdown_inline",
		"toml",
		"xcompose",
		"yaml",
	},
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	ignore_install = { "dart", "org" },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = ",ds",
			scope_incremental = ",dc",
			node_incremental = "<a-]>",
			node_decremental = "<a-[>",
		},
	},
}

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup(opts)

		vim.opt.foldmethod = "expr"
		vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
		vim.opt.foldenable = false
		require("nvim-treesitter.install").prefer_git = true
	end,
}
