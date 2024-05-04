local map = vim.keymap.set

-- save
map('n', '<D-s>', '<cmd> w <CR>')

-- Netrw
map('n', '<C-n>', ':E<CR>')

-- Tab Managment
map('n', '<Tab>', '<cmd> BufferLineCycleNext <CR>')
map('n', '<S-Tab>', '<cmd> BufferLineCyclePrev <CR>')
map('n', '<C-q>', '<cmd> bd <CR>')
map('n', '<C-S-q>', '<cmd> bd! <CR>')

-- comment.nvim
map('n', 'gc', function() require('Comment.api').toggle.linewise.current() end)
map('v', 'gc', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

--Telescope
map('n', '<D-p>', '<cmd>Telescope find_files<cr>')
map('n', '<M-p>', '<cmd>Telescope live_grep<cr>')
map('n', ',p', '<cmd>Telescope neovim-project discover<cr>')
map('n', '<D-o>', '<cmd>TodoTelescope<cr>')
map('n', '<M-x>', '<cmd>Telescope commands<cr>')

-- Flutter
map('n', ',fr', '<cmd>FlutterRun<cr>')
map('n', ',fo', '<cmd>FlutterOutlineToggle<cr>')
map('n', ',fh', '<cmd>FlutterRestart<cr>')
