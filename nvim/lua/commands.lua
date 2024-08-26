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
--
-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "LeapEnter",
-- 	callback = function()
-- 		vim.cmd.hi("Cursor", "blend=100")
-- 		vim.opt.guicursor:append({ "a:Cursor/lCursor" })
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("User", {
-- 	pattern = "LeapLeave",
-- 	callback = function()
-- 		vim.cmd.hi("Cursor", "blend=0")
-- 		vim.opt.guicursor:remove({ "a:Cursor/lCursor" })
-- 	end,
-- })

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

local get_pokemon_sprite = function()
	local handle = io.popen("pokemon-colorscripts --no-title -r")
	if handle == nil then
		print("Failed to run pokemon-colorscheme command.")
		return nil
	end

	local result = handle:read("*a")
	handle:close()

	if result == "" then
		print("No output from pokemon-colorscheme.")
		return nil
	end

	return result:gsub("\x1b%[%d+m", "")
end

-- Neovim'de yeni bir buffer aç ve sprite'ı yazdır
local display_pokemon_sprite = function()
	-- Create a new buffer
	local buf = vim.api.nvim_create_buf(false, true)

	-- Create a new window with the buffer
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = 20,
		height = 10,
		col = 10,
		row = 10,
		style = "minimal",
	})

	-- Example sprite with colored Unicode characters
	-- Ensure you use valid escape sequences for colors and Unicode
	local lines = {
		"\27[38;5;196m██\27[0m", -- Red
		"\27[38;5;82m██\27[0m", -- Green
	}
	local buf = vim.api.nvim_create_buf(false, true)

	-- Create a new window with the buffer
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = 20, -- Adjust the width as needed
		height = 10, -- Adjust the height as needed
		col = 10, -- Position from the left edge
		row = 10, -- Position from the top edge
		style = "minimal",
	})

	-- Example sprite with colored Unicode characters
	-- You can replace this with the output from your Python program

	-- Set the buffer content with the sprite
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end

vim.api.nvim_create_user_command("ShowPokemon", display_pokemon_sprite, {})
