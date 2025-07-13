return {
	{
		"zbirenbaum/copilot.lua",

		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
		lazy = false,
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	}, -- for providers='copilot'

	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
}
