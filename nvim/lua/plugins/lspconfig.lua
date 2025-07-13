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
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local servers = {
				"rust_analyzer",
				"lua_ls",
				"clangd",
				"cssls",
				"html",
				"jsonls",
				"ts_ls",
				"phpactor",
				"gopls",
				"zls",
				"pyright",
				"bashls",
				"jdtls",
				"zls",
				"tailwindcss",
				"cssls",
			}

			for _, server in ipairs(servers) do
				if server == "lua_ls" then
					require("lspconfig")[server].setup({
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT", -- Neovim uses LuaJIT
								},
								diagnostics = {
									globals = { "vim" }, -- avoid "undefined global 'vim'" error
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
								telemetry = { enable = false },
							},
						},
					})
				elseif server == "clangd" then
					require("lspconfig")[server].setup({
						cmd = {
							"/Users/akdeniz/.local/share/nvim/mason/bin/clangd",
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
						settings = {
							enable_snippets = true,
							enable_ast_check_diagnostics = true,
							enable_autofix = true,
							enable_import_embedfile_argument_completions = true,
							warn_style = true,
							enable_semantic_tokens = true,
							enable_inlay_hints = true,
							inlay_hints_hide_redundant_param_names = true,
							inlay_hints_hide_redundant_param_names_last_token = true,
							operator_completions = true,
							include_at_in_builtins = true,
							max_detail_length = 1048576,
						},
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
			vim.keymap.del("n", "gri")

			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go To Previous Diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go To Next Diagnostic" })

			vim.keymap.set("n", "<Space>eq", vim.diagnostic.setloclist, { desc = "Find All Errors (Quickfix)" })
			vim.diagnostic.config({
				virtual_text = false,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "Go To Definition" })
					vim.keymap.set("n", "<Space>k", function()
						vim.lsp.buf.hover({ border = "single" })
					end)

					vim.keymap.set("n", "<Space>j", function()
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
						"gD",
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
