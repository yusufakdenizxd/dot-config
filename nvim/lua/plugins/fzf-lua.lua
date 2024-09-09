return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		local fzf = require("fzf-lua")
		local actions = fzf.actions
		fzf.setup({
			{
				"default-title",

				actions = {
					["alt-q"] = actions.quickfix,
					["alt-a"] = actions.file_sel_to_qf,
				},
				previewers = {
					bat = {
						cmd = "bat",
						args = "--color=always --style=numbers,changes",
						theme = "gruvbox-dark",
					},
				},
			},
		})
		--FIX: FIXME TODO TODOD
		vim.keymap.set("n", "gr", function()
			fzf.lsp_references()
		end, { desc = "Find All Lsp References" })

		vim.keymap.set("n", "<Space>ee", function()
			fzf.diagnostics_workspace({ severity_only = "Error" })
		end, { desc = "Find All Errors (Fzf)" })

		vim.keymap.set("n", "<Space>ea", function()
			fzf.diagnostics_workspace({})
		end, { desc = "Find All Diagnostics (Fzf)" })

		vim.keymap.set("n", "<Space>ei", function()
			fzf.diagnostics_workspace({ severity_only = "Info" })
		end, { desc = "Find All Infos (Fzf)" })

		vim.keymap.set("n", "<M-t>", function()
			fzf.live_grep_native({ search = [[\b(?:TODO|HACK|PERF|NOTE|FIX)\b]], no_esc = true })
		end, { desc = "Find All TODOS (Fzf)" })

		vim.keymap.set("n", "<Tab>", "<cmd>FzfLua buffers<cr>", { desc = "Buffers Fzf" })
		vim.keymap.set("n", "<S-Tab>", "<cmd>FzfLua files<cr>", { desc = "Files Fzf" })
		vim.keymap.set("n", "<C-Tab>", "<cmd>FzfLua files<cr>", { desc = "Files Fzf" })
		vim.keymap.set("n", "<M-f>", "<cmd>FzfLua live_grep_native<cr>", { desc = "Live Grep Fzf" })
	end,
}
