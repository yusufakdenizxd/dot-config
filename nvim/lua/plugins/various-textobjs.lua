return {
	{
		"chrisgrieser/nvim-various-textobjs",
		config = function()
			require("various-textobjs").setup({
				-- lines to seek forwards for 'small' textobjs (mostly characterwise textobjs)
				-- set to 0 to only look in the current line
				forwardLooking = {
					small = 2,
					big = 0,
				},
				keymaps = {
					useDefaults = true,
				},
				-- use suggested keymaps (see overview table in README)
			})
		end,
	},
}
