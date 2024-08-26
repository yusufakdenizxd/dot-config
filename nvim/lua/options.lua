local opt = vim.opt

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

vim.g.mapleader = " "

opt.clipboard = "unnamedplus"

opt.foldmethod = "expr"

opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.mousemodel = "extend"

opt.showmode = false

opt.scrolloff = 10

opt.relativenumber = true
opt.number = true
opt.ruler = false

opt.wrap = false

opt.cursorline = false
opt.cursorlineopt = "number"
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.undofile = true

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath("data") .. "/mason/bin"
