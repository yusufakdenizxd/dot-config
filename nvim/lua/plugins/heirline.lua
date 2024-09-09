return {
	"rebelot/heirline.nvim",
	config = function()
		require("heirline").setup({
			statusline = {
				-- Mode component
				{
					-- Vim modunu gösterecek (Normal, Insert, Visual vb.)
					provider = function()
						local mode = vim.fn.mode()
						local mode_map = {
							n = "[Normal]",
							i = "[Insert]",
							v = "[Visual]",
							V = "[V-LINE]",
							[""] = "[V-BLOCK]",
							c = "[Command]",
							t = "[Terminal]",
						}
						local content = (mode_map[mode] or mode)

						local max_width = 30

						if #content < max_width then
							return content .. string.rep(" ", max_width - #content)
						else
							return content
						end
					end,
					-- Renklendirme
				},

				{ provider = "%=" },
				-- File name component
				{
					provider = function()
						local relative_path = vim.fn.expand("%:~:.")

						-- Eğer relative_path boşsa '[No Name]' göster
						if relative_path == "" then
							return "[No Name]"
						end
						return relative_path
					end,
				},

				{ provider = "%=" },
				-- Line and column number component
				{
					provider = function()
						local line = vim.fn.line(".")
						local col = vim.fn.col(".")
						local content = string.format("[%d:%d]", line, col)

						local max_width = 30
						if #content < max_width then
							return string.rep(" ", max_width - #content) .. content
						else
							return " " .. content
						end
					end,
				},
			},
		})
	end,
}
