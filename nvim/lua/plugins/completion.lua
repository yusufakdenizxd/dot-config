return {
	"saghen/blink.cmp",
	dependencies = {
		{ "rafamadriz/friendly-snippets" },
	},
	version = "v0.*",
	opts = {
		keymap = { preset = "enter" },
		snippets = {
			preset = "luasnip",
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
		sources = {
			providers = {
				markdown = {
					name = "RenderMarkdown",
					module = "render-markdown.integ.blink",
					fallbacks = { "lsp" },
				},
			},
			default = { "snippets", "lsp", "path", "buffer", "markdown" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		signature = { enabled = true },
	},
}
