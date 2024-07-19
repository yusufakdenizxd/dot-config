return {
	{
		"williamboman/mason.nvim",
		dependencies = "neovim/nvim-lspconfig",
		config = function()
			-- import mason
			local mason = require("mason")

			-- enable mason and configure icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {},
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local servers = {
				"rust_analyzer",
				"lua_ls",
				"csharp_ls",
				"clangd",
				"cssls",
				"html",
				"jsonls",
				"marksman",
				"yamlls",
				"tsserver",
				"phpactor",
				"gopls",
				"zls",
				"pyright",
			}
			for _, server in ipairs(servers) do
				if server == "lua_ls" then
					require("lspconfig")[server].setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				elseif server == "zls" then
					require("lspconfig")[server].setup({
						flags = {
							debounce_text_changes = 150,
						},
					})
				else
					require("lspconfig")[server].setup({})
				end
			end
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

			vim.keymap.set("n", "<Space>eq", vim.diagnostic.setloclist)
			vim.diagnostic.config({
				virtual_text = false,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = { buffer = args.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<Space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "Q", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<M-x>", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
