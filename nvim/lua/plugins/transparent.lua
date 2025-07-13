return {
	"xiyaowong/transparent.nvim",
	enabled = true,
	config = function()
		-- Optional, you don't have to run setup.
		require("transparent").setup({
			-- table: default groups
			groups = {
				"Normal",
				"NormalNC",
				"NormalFloat",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
				"WinBar", -- Make the active winbar transparent
				"WinBarNC",
			},
			-- table: additional groups that should be cleared
			extra_groups = {},
			-- table: groups you don't want to clear
			exclude_groups = {
				-- 'Cursor',
				"TelescopeNormal",
				"TelescopeSelection",
				"TelescopeSelectionCaret",
				"TelescopeBorder",
				"TelescopePromptBorder",
				"TelescopeResultsBorder",
				"TelescopePreviewBorder",
				"TelescopeMultiSelection",
				"TelescopePromptPrefix",
				"TelescopePromptNormal",
				"TelescopeResultsNormal",
				"TelescopePreviewNormal",
				"TelescopePreviewTitle",
				"TelescopeResultsTitle",
				"TelescopePromptTitle",
				"TelescopeTitle",
				"TelescopeMultiIcon",
				"TelescopePreviewLine",
				"CursorLine",
			},
			-- function: code to be executed after highlight groups are cleared
			-- Also the user event "TransparentClear" will be triggered
			on_clear = function() end,
		})
		require("transparent").clear_prefix("barbecue")
		require("transparent").clear_prefix("BufferLine")
	end,
}
