return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = 'hrsh7th/nvim-cmp',
    config = function()
      local autopairs = require('nvim-autopairs')
      autopairs.setup({
        disable_in_visualblock = false,
        disable_in_replace_mode = true,
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        check_ts = true,
        map_c_w = true,
        enable_check_bracket_line = true,
      })
      local rule = require('nvim-autopairs.rule')

      autopairs.add_rules({
        rule('<', '>'):with_pair(function(opts) return opts.next_char ~= '>' end),
        rule('>', '>')
            :with_pair(function(_) return false end)
            :with_move(function(opts) return opts.char == '>' end)
            :use_key('>'), -- The key that triggers the move feature
      })

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'numToStr/Comment.nvim',
  },
  {
    'rcarriga/nvim-notify',
    cmd = { 'Notify' },
    config = function()
      require('notify').setup({
        stages = 'fade_in_slide_out',
        background_colour = 'FloatShadow',
        timeout = 3000,
      })
      vim.notify = require('notify')
    end,
  },
  {
    'xiyaowong/transparent.nvim',
    config = function() require('transparent').clear_prefix('BufferLine') end,
  },

  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- order to load the plugin when the command is run for the first time
    keys = {
      { ',lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  { 'CRAG666/code_runner.nvim', config = true },
}
