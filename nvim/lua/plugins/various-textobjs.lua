return {
	{
		"chrisgrieser/nvim-various-textobjs",
		config = function()
			require("various-textobjs").setup({
				-- lines to seek forwards for 'small' textobjs (mostly characterwise textobjs)
				-- set to 0 to only look in the current line
				lookForwardSmall = 2,
				-- lines to seek forwards for 'big' textobjs (mostly linewise textobjs)
				lookForwardBig = 0,
				-- use suggested keymaps (see overview table in README)
				useDefaultKeymaps = true,
			})
		end,
	},
}
