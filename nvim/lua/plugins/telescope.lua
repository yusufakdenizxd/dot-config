return {
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		lazy = true,
	},
  {
  'nvim-telescope/telescope.nvim'},
  dependencies = { 'nvim-lua/plenary.nvim',
	config = function()
			local telescope = require('telescope')
			local layout_actions = require('telescope.actions.layout')
			telescope.setup({
				defaults = {
					prompt_prefix = '',
					selection_caret = '?? ',
					multi_icon = '? ',
					initial_mode = 'insert',
					results_title = false,
					prompt_title = false,
					wrap_results = true,
					layout_strategy = 'flex',
					preview = {
						treesitter = true,
						hide_on_startup = true,
					},
					layout_config = {
						height = 0.99,
						width = 0.99,
						preview_cutoff = 5,
						horizontal = {
							preview_width = 0.5,
						},
						vertical = {
							preview_height = 10,
						},
					},
					mappings = {
						n = {
							['<c-l>'] = 'select_vertical',
							['<f6>'] = 'select_horizontal',
							['<a-u>'] = 'smart_add_to_qflist',
							['<a-U>'] = 'smart_send_to_qflist',
							['<a-i>'] = layout_actions.toggle_preview,
							['H'] = 'preview_scrolling_up',
							['L'] = 'preview_scrolling_down',
							['<c-j>'] = 'move_selection_next',
							['<c-k>'] = 'move_selection_previous',
							['<c-v>'] = false,
							['<c-u>'] = false,
							['<c-d>'] = false,
						},
						i = {
							['<c-l>'] = 'select_vertical',
							['<f6>'] = 'select_horizontal',
							['<a-u>'] = 'smart_add_to_qflist',
							['<a-U>'] = 'smart_send_to_qflist',
							['<a-i>'] = layout_actions.toggle_preview,
							['<c-v>'] = false,
							['<c-u>'] = false,
							['<c-d>'] = false,
							['<c-j>'] = 'move_selection_next',
							['<c-k>'] = 'move_selection_previous',
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = true,
						no_ignore_parent = true,
					},
					live_grep = {
						disable_coordinates = true,
						-- additional_args = {}
					},
          jumplist = {
						show_line = false,
					},
									loclist = {
						show_line = false,
					},
					git_files = {
						show_untracked = true,
					},
					git_status = {
						initial_mode = 'normal',
						preview = {
							hide_on_startup = false,
						},
						git_icons = {
							added = '?',
							changed = '??',
							deleted = '?',
							renamed = '??',
							untracked = '??',
						},
					},
					buffers = {
						ignore_current_buffer = false,
						sort_lastused = true,
						sort_mru = true,
					},
					quickfix = {
						show_line = false,
					},
					lsp_references = {
						show_line = false,
						include_declaration = false,
					},
					lsp_incoming_calls = {
						show_line = false,
					},
					lsp_outgoing_calls = {
						show_line = false,
					},
					lsp_definitions = {
						show_line = false,
					},
					lsp_type_definitions = {
						show_line = false,
					},
					lsp_implementations = {
						show_line = false,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = 'smart_case', -- or 'ignore_case' or 'respect_case' (the default case_mode is 'smart_case')
					},
					zoxide = {
						prompt_title = 'zoxide',
						mappings = {
							default = {
								action = function(selection) vim.cmd.tcd(selection.path) end,
							},
							['<c-s>'] = false,
							['<c-v>'] = false,
							['<c-e>'] = false,
							['<c-b>'] = false,
							['<c-f>'] = false,
							['<c-t>'] = false,
						},
					},
				},
			})

			telescope.load_extension('fzf')
		end,
  },

}

