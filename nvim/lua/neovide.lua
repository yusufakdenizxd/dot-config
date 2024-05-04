vim.o.guifont = 'CaskaydiaCove Nerd Font:h13'

vim.g.neovide_transparency = 0.75

vim.g.neovide_window_blurred = true
vim.g.neovide_floating_blur_amount_x = 10.0
vim.g.neovide_floating_blur_amount_y = 10.0
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_input_macos_alt_is_meta = true

vim.api.nvim_set_keymap(
  'n',
  '<D-=>',
  ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>',
  { silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<D-->',
  ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>',
  { silent = true }
)
vim.api.nvim_set_keymap('n', '<D-0>', ':lua vim.g.neovide_scale_factor = 1<CR>', { silent = true })
