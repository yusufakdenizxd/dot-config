require'nvim-treesitter.configs'.setup {

  ensure_installed = {
    "lua",
    "typescript",
    "javascript",
    "go",
    "python",
    "dart",
  },

  sync_install = false,

  highlight = {
    enable = true,
    disable = {},
  },

  indent = {
    enable = false,
    disable = {},
  }
}
