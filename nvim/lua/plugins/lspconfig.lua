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
				"bashls",
			}
			local _border = "single"
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = _border,
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = _border,
			})

			vim.diagnostic.config({
				float = { border = _border },
			})

			require("lspconfig.ui.windows").default_options = {
				border = _border,
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
				elseif server == "clangd" then
					require("lspconfig")[server].setup({
						cmd = {
							"/Users/yusufakdeniz/.local/share/nvim/mason/bin/clangd",
							"--clang-tidy=false",
							"--completion-style=detailed",
							"--header-insertion=never",
						},
						settings = {
							clangd = {
								diagnostics = {
									enable = false,
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

			require("lspconfig").dartls.setup({
				cmd = { "dart", "language-server", "--protocol=lsp" },
				settings = {
					dart = {

						lineLength = 100000,
					},
				},
			})

			vim.keymap.del("n", "grr")
			vim.keymap.del("n", "gra")
			vim.keymap.del("n", "grn")

			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go To Previous Diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go To Next Diagnostic" })

			vim.keymap.set("n", "<Space>eq", vim.diagnostic.setloclist, { desc = "Find All Errors (Quickfix)" })
			vim.diagnostic.config({
				virtual_text = false,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					vim.keymap.set(
						"n",
						"gD",
						vim.lsp.buf.declaration,
						{ buffer = args.buf, desc = "Go To Declaration" }
					)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "Go To Definition" })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf, desc = "Hover" })

					vim.keymap.set("n", "J", function()
						vim.diagnostic.open_float()
					end, { desc = "Open Float Error" })

					vim.keymap.set(
						"n",
						"gi",
						vim.lsp.buf.implementation,
						{ buffer = args.buf, desc = "Go To Implemtation" }
					)
					vim.keymap.set(
						"n",
						"<Space>D",
						vim.lsp.buf.type_definition,
						{ buffer = args.buf, desc = "Go To type Definition" }
					)
					vim.keymap.set("n", "gs", vim.lsp.buf.rename, { buffer = args.buf, desc = "Rename" })
					vim.keymap.set(
						{ "n", "v" },
						"<M-x>",
						vim.lsp.buf.code_action,
						{ buffer = args.buf, desc = "Open Code Actions" }
					)
				end,
			})
		end,
	},
}
