local snippets = function()
	local ls = require("luasnip")
	local s = ls.snippet
	local f = ls.function_node
	local t = ls.text_node
	local i = ls.insert_node
	local parser = ls.parser

	local single = function(node)
		return node[1]
	end

	local all_snippets = {
		s("wd", {
			---@diagnostic disable-next-line: param-type-mismatch
			f(function()
				return string.lower(os.date("%A"))
			end),
		}),
		s("Wd", {
			f(function()
				return os.date("%A")
			end),
		}),
		s("dt", {
			f(function()
				return os.date("%y.%m.%d")
			end),
		}),
		s("tm", {
			f(function()
				return os.date("%H:%M")
			end),
		}),
	}
	ls.add_snippets("all", all_snippets)

	local lua_snippets = {
		s("map", {
			t("vim.keymap.set('"),
			i(1, "n"),
			t("', '"),
			i(2),
			t("', "),
			i(0),
			t(")"),
		}),
		s("function inline", {
			t("function"),
			i(1),
			t("("),
			i(2),
			t(") "),
			i(0),
			t(" end"),
		}),
	}

	ls.add_snippets("lua", lua_snippets)

	local git_commit_snippets = {
		s("nvim", { t("nvim: ") }),
		s("compose", { t("compose: ") }),
		s("xremap", { t("xremap: ") }),
		s("alacritty", { t("alacritty: ") }),
		s("stylus(youtube)", { t("stylus(youtube): ") }),
		s("stylus(discord)", { t("stylus(discord): ") }),
	}
	ls.add_snippets("gitcommit", git_commit_snippets)

	local css_snippets = {
		s("!important", { t("!important") }),
	}
	ls.add_snippets("css", css_snippets)

	local rust_snippets = {
		s("Result<(), Box<dyn Error>>", {
			t("Result<"),
			i(1, "()"),
			t(", Box<dyn Error>>"),
		}),
	}
	ls.add_snippets("rust", rust_snippets)

	local markdown_snippets = {
		s("inline link", {
			t("["),
			i(1),
			t("]("),
			i(2),
			t(")"),
		}),
	}
	ls.add_snippets("markdown", markdown_snippets)

	local dart_snippets = {}
	ls.add_snippets("dart", dart_snippets)
end

return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		lazy = "InsertEnter",
		build = "make install_jsregexp",
		config = function()
			snippets()

			vim.keymap.set({ "i", "s" }, "<a-l>", function()
				require("luasnip").jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<a-h>", function()
				require("luasnip").jump(-1)
			end, { silent = true })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				performance = {
					throttle = 0,
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {

					completion = {
						winhighlight = "Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",

						border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
						scrollbar = false,
					},
					documentation = {
						winhighlight = "Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",

						border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
						scrollbar = false,
					},
					-- completion = {
					-- 	scrolloff = 99,
					-- 	scrollbar = false,
					-- },
				},
				view = {
					docs = {
						auto_open = true,
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

					["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

					["<cr>"] = cmp.mapping.confirm({
						select = true,
						behavior = cmp.ConfirmBehavior.Replace,
					}),
				}),
				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
				}, { { name = "buffer" } }),
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = {
				"rust_analyzer",
				"lua_ls",
				"csharp_ls",
				"cssls",
				"html",
				"jsonls",
				"marksman",
				"yamlls",
				"taplo",
			}
			for _, server in ipairs(servers) do
				require("lspconfig")[server].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
}
