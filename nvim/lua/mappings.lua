local map = vim.keymap.set
-- Oil File Manager
map("n", "<C-n>", "<cmd>Oil<CR>", { desc = "Open File Explorer" })

map({ "n", "v" }, "<Space>d", '"_d', { desc = "Delete Without Copying" })
map({ "n", "v" }, "<Space>c", '"_c', { desc = "Edit Without Copying" })
map("v", "<Space>p", '"_d[p', { desc = "Paste Without Copying" })

map({ "n", "v" }, "<ScrollWheelRight>", "<Nop>")
map({ "n", "v" }, "<ScrollWheelLeft>", "<Nop>")

-- Buffer Managment
map("n", "<C-q>", "<cmd> bd <CR>", { desc = "Quit Buffer" })
map("n", "<C-S-q>", "<cmd> bd! <CR>", { desc = "Force Quit Buffer" })

-- Buffer Movement
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })
map("n", "<w", "5<C-w>>", { desc = "Increase Width" })
map("n", ">w", "5<C-w><", { desc = "Descrease Width" })

-- Buffer Splits
map("n", "<C-c>", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "<C-s>", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Quickfix Movement
map("n", "]q", "<cmd> cnext <CR>", { desc = "Next Quickfix" })
map("n", "[q", "<cmd> cprev <CR>", { desc = "Prev Quickfix" })
map("n", "<Space>q", "<cmd> copen <CR>", { desc = "Open Quickfix" })

-- Swap - with _
map({ "n", "v" }, "-", "_")
map({ "n", "v" }, "_", "-")
map({ "n", "v" }, "=", "$")

-- comment.nvim
map("n", "gc", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle Comment" })
