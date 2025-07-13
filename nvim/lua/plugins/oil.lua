return {
	"stevearc/oil.nvim",
	enabled = true,
	opts = {
		skip_confirm_for_simple_edits = true,
		keymaps = {
			["<C-h>"] = false,
			["<C-l>"] = false,
			["<C-k>"] = false,
			["<C-j>"] = false,
			["<M-l>"] = "actions.refresh",
			["<M-h>"] = "actions.select_split",
		},
		columns = { "icon" },
		view_options = {
			show_hidden = true,
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
