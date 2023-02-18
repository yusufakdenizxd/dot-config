local telescopeSetup, telescope= pcall(require, "telescope")
if not telescopeSetup then
  return
end


local builtinSetup,builtin= pcall(require,"telescope.builtin")
if not builtinSetup then
  return
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

pcall(telescope.load_extension, 'fzf')

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })


vim.keymap.set("n", "<leader>ff", "telescope find_files<cr>")
--vim.keymap.set("n", "<leader>fc", "telescope flutter commands<cr>")
vim.keymap.set("n", "<leader>fh", "telescope help_tags<cr>")

