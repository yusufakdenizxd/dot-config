-- vim.cmd([[
--   au VimLeave * set guicursor=a:ver10-blinkwait800
-- ]])
--
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

local set_hl_for_floating_window = function()
	vim.api.nvim_set_hl(0, "NormalFloat", {
		link = "Normal",
	})
	vim.api.nvim_set_hl(0, "FloatBorder", {
		bg = "none",
	})
end

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Qw", "wq", {})
vim.api.nvim_create_user_command("QW", "wq", {})

set_hl_for_floating_window()

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	desc = "Avoid overwritten by loading color schemes later",
	callback = set_hl_for_floating_window,
})
