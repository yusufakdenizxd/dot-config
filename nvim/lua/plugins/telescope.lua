return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		local ignore_filetypes_list = {
			"venv",
			"target",
			"*/target",
			"__pycache__",
			"%.xlsx",
			"%.jpg",
			"%.png",
			"%.webp",
			"%.pdf",
			"%.odt",
			"%.ico",
		}

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending", -- display results top->bottom
				file_ignore_patterns = ignore_filetypes_list,
				layout_config = {
					prompt_position = "top", -- search bar at the top
				},
			},
			extensions = {
				fzf = {},
			},
		})

		-- Load Telescope extensions if needed
		require("telescope").load_extension("fzf")

		vim.api.nvim_create_user_command("ColorschemePick", function()
			require("custom.colorscheme_picker").pick_colorscheme()
		end, {})

		-- Keybindings to match fzf-lua
		vim.keymap.set("n", "gr", function()
			builtin.lsp_references()
		end, { desc = "Find All LSP References" })

		vim.keymap.set("n", "<Space>ee", function()
			builtin.diagnostics({ severity = vim.diagnostic.severity.ERROR })
		end, { desc = "Find All Errors (Telescope)" })

		vim.keymap.set("n", "<Space>ea", function()
			builtin.diagnostics({})
		end, { desc = "Find All Diagnostics (Telescope)" })

		vim.keymap.set("n", "<Space>ei", function()
			builtin.diagnostics({ severity = vim.diagnostic.severity.INFO })
		end, { desc = "Find All Infos (Telescope)" })

		vim.keymap.set("n", "<M-d>", function()
			builtin.lsp_document_symbols()
		end, { desc = "Find All Document Symbols (Telescope)" })

		vim.keymap.set("n", "<M-t>", function()
			builtin.live_grep({
				additional_args = function()
					return { "--fixed-strings", [[\b(?:TODO|HACK|PERF|NOTE|FIX)\b]] }
				end,
			})
		end, { desc = "Find All TODOS (Telescope)" })

		vim.keymap.set("n", "<Tab>", "<cmd>Telescope buffers<cr>", { desc = "Buffers Telescope" })
		vim.keymap.set("n", "<S-Tab>", "<cmd>Telescope find_files<cr>", { desc = "Files Telescope" })
		vim.keymap.set("n", "<C-Tab>", "<cmd>Telescope find_files<cr>", { desc = "Files Telescope" })
		vim.keymap.set("n", "<M-f>", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep Telescope" })
	end,
}
