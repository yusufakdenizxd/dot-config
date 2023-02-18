--Leader
local keymap = vim.keymap

--File Managment
keymap.set("n", "<leader>e", ":Ex<CR>")

--Greatest Shit Ever
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Clear Search
keymap.set("n", "<leader>nh", ":nohl<CR>")

--Delete Without Copying
keymap.set("n", "x", '"_x')

--Buffer Managment
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", ":close<CR>")

--Tab Managment
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":bdelete<CR>")
keymap.set("n", "<leader>tk", ":bnext<CR>")
keymap.set("n", "<leader>tj", ":bprev<CR>")

--Fast Movement
vim.keymap.set("n", "J", "5j")
vim.keymap.set("n", "K", "5k")

--Line Transport
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Movement Managment
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

--Yank
vim.keymap.set({ "n", "v" }, "y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

