local map = vim.keymap.set

-- Oil File Manager
map("n", "<C-n>", "<cmd>Oil<CR>", { desc = "Open File Explorer" })

-- map("n", ";", ":")
-- map("n", ";", ":<C-f>i")

map({ "n", "v" }, "<Space>d", '"_d', { desc = "Delete Without Copying" })
map({ "n", "v" }, "<Space>c", '"_c', { desc = "Edit Without Copying" })
-- map("v", "<Space>p", "_d[p", { desc = "Paste Without Copying" })

-- All Whickey
map("n", "<Space>wK", "<cmd>WhichKey <CR>", { desc = "All Whickey Mappings" })

-- Buffer Managment
map("n", "<C-q>", "<cmd> bd <CR>", { desc = "Quit Buffer" })
map("n", "<C-S-q>", "<cmd> bd! <CR>", { desc = "Force Quit Buffer" })

-- Buffer Movement
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

-- Buffer Splits
map("n", "<C-c>", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "<C-s>", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Quickfix Movement
map("n", "]q", "<cmd> cnext <CR>", { desc = "Next Quickfix" })
map("n", "[q", "<cmd> cprev <CR>", { desc = "Prev Quickfix" })
map("n", "<Space>q", "<cmd> copen <CR>", { desc = "Open Quickfix" })

-- Tab Movement
map("n", "[t", ":tabprevious<cr>", { desc = "Prev tab" })
map("n", "]t", ":tabnext<cr>", { desc = "Next tab" })
map("n", "<Space>td", ":tabclose<cr>", { desc = "Close tab" })
map("n", "<Space>tn", ":tabnew<cr>", { desc = "Create tab" })

-- Swap - with _
map({ "n", "v" }, "-", "_")
map({ "n", "v" }, "_", "-")
map({ "n", "v" }, "=", "$")

map({ "n", "v" }, "s", "<Nop>")
map("n", "ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Subsitute Word On Cursor" })
-- comment.nvim
map("n", "gc", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle Comment" })
