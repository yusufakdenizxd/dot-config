local map = vim.keymap.set

map("n", "<D-s>", "<cmd> w <CR>")

map("n", "<C-n>", ":E<CR>")

map("n", "<M-x>", ":")

map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")

-- comment.nvim
map("n", "gc", function()
	require("Comment.api").toggle.linewise.current()
end)
map("v", "gc", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")


--Telescope
map('n','<D-p>', "<cmd>Telescope find_files<cr>")

map('n','<M-p>', "<cmd>Telescope live_grep<cr>")
map('n','<D-o>', "<cmd>TodoTelescope<cr>")
