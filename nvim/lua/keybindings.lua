require "helpers/globals"
require "helpers/keyboard"

g.mapleader = ' '                                                                 -- Use Space, like key for alternative hotkeys

nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>' )                                      -- Hover object
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')                                -- Code actions
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')                                     -- Rename an object
nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')                                -- Go to declaration

nm('gd', '<cmd>Telescope lsp_definitions<CR>')                            -- Goto declaration

nm('<leader>d', '"_d') --Delete Without Copy
nm('<leader>c', '"_c') --Chane Without Copy

--Telescope
nm('<leader>o', '<cmd>Telescope oldfiles<CR>')                                   -- Show recent files
nm('<leader>O', '<cmd>Telescope git_files<CR>')                                  -- Search for a file in project
nm('<leader>p', '<cmd>Telescope find_files<CR>')                                 -- Search for a file (ignoring git-ignore)
nm('<leader>i', '<cmd>Telescope jumplist<CR>')                                   -- Show jumplist (previous locations)
nm('<leader>b', '<cmd>Telescope git_branches<CR>')                               -- Show git branches
nm('<leader>f', '<cmd>Telescope live_grep<CR>')                                  -- Find a string in project
nm('<leader>q', '<cmd>Telescope buffers<CR>')                                    -- Show all buffers
nm('<leader>a', '<cmd>Telescope<CR>')                                            -- Show all commands
nm('<leader>t', '<cmd>Telescope lsp_dynamic_oworkspace_symbols<CR>')              -- Search for dynamic symbols

nm('<CR>', '<cmd>FineCmdline<CR>')
nm(':', '<cmd>FineCmdline<CR>')

--Window
nm('<C-h>','<C-w>h')
nm('<C-j>','<C-w>j')
nm('<C-k>','<C-w>k')
nm('<C-l>','<C-w>l')

nm('<leader>x', '<cmd>TroubleToggle<CR>')                                         -- Show all problems in project (with help of LSP)
nm('gr', '<cmd>Trouble lsp_references<CR>')                                       -- Show use of object in project

nm('<leader>e', '<cmd>NeoTreeFocusToggle<CR>')                                        -- Toggle file explorer

