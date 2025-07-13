return {
	"stevearc/dressing.nvim",

	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		input = {
			enabled = true,
		},
		select = {
			get_config = function(opts)
				if opts.kind == "codeaction" then
					return {
						backend = "telescope",
					}
					-- return {
					-- 	backend = "nui",
					-- 	nui = {
					-- 		position = { row = "2", col = "-2" },
					-- 		size = nil,
					-- 		relative = "cursor",
					-- 		border = {
					-- 			style = "rounded",
					-- 		},
					-- 		buf_options = {
					-- 			swapfile = false,
					-- 			filetype = "DressingSelect",
					-- 		},
					-- 		win_options = {
					-- 			winblend = 0,
					-- 		},
					-- 		max_width = 80,
					-- 		max_height = 40,
					-- 		min_width = 40,
					-- 		min_height = 10,
					-- 	},
					-- }
				end
			end,
		},
	},
}
