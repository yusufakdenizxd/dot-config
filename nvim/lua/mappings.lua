local map = vim.keymap.set

-- save
map("n", "<D-s>", "<cmd> w <CR>", { desc = "Save File" })
map("n", ",*,s", "<cmd> w <CR>", { desc = "Save File" })

-- Oil File Manager
map("n", "<C-n>", "<cmd>Oil<CR>", { desc = "Open File Explorer" })

map("n", ";", ":")

map("n", "<Space>d", '"_d', { desc = "Delete Without Copying" })
map("n", "<Space>c", '"_c', { desc = "Edit Without Copying" })

vim.keymap.set("n", "J", "j", { desc = "Get Rid of Linebreak" })

-- All Whickey
map("n", "<Space>wK", "<cmd>WhichKey <CR>", { desc = "All Whickey Mappings" })

-- Buffer Managment
map("n", "<C-q>", "<cmd> bd <CR>", { desc = "Quit Buffer" })
map("n", "<C-S-q>", "<cmd> bd! <CR>", { desc = "Force Quit Buffer" })
map("n", "<Space>bo", "<cmd>%bd|e#<cr>", { desc = "Close all buffers but the current one" })
-- Buffer Movement
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Buffer Splits
map("n", "<C-c>", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "<C-s>", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Quickfix Movement
map("n", "]q", "<cmd> cnext <CR>", { desc = "Next Quickfix" })
map("n", "[q", "<cmd> cprev <CR>", { desc = "Prev Quickfix" })
map("n", "<Space>q", "<cmd> copen <CR>", { desc = "Open Quickfix" })

-- Tab Movement
map("n", "<Space>tp", ":tabprevious<cr>", { desc = "Prev tab" })
map("n", "<Space>tn", ":tabnext<cr>", { desc = "Next tab" })
map("n", "<Space>td", ":tabclose<cr>", { desc = "Close tab" })

-- comment.nvim
map("n", "gc", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle Comment" })
