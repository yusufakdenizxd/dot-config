return {
	"utilyre/barbecue.nvim",
	enabled = true,
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {
		-- configurations go here
	},
	config = function()
		require("barbecue").setup({
			attach_navic = false,
			create_autocmd = false,
			theme = {
				normal = { fg = "#c0caf5", bg = "none" },
			},
			custom_section = function()
				local recording = vim.fn.reg_recording()
				if recording ~= "" then
					return string.format("Recording @%s", recording)
				end
				return nil
			end,
		})

		vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
			callback = function()
				require("barbecue.ui").update()
			end,
		})

		vim.api.nvim_create_autocmd({
			"WinResized",
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
}
