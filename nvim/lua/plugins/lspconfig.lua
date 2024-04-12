return {
	{
		'williamboman/mason.nvim',
		dependencies = 'neovim/nvim-lspconfig',
		config = true,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'neovim/nvim-lspconfig', 'williamboman/mason.nvim' },
		opts = {
			ensure_installed = {},
			automatic_installation = true,
		},
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'folke/neoconf.nvim', config = true }, --[[ 'lvimuser/lsp-inlayhints.nvim' ]]
		},
		config = function()
			local servers = {
				'rust_analyzer',
				'lua_ls',
				'csharp_ls',
				'cssls',
				'html',
				'jsonls',
				'marksman',
				'yamlls',
				'taplo',
			}
			for _, server in ipairs(servers) do
				require('lspconfig')[server].setup({})
			end
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<leader>el', vim.diagnostic.setloclist)

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					local opts = { buffer = args.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', 'Q', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
