return {
	"nvim-neorg/neorg",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Core default modülleri yükle
				["core.concealer"] = {}, -- Sembolleri ve simgeleri ayarla
				["core.dirman"] = { -- Dosya yöneticisini ayarla
					config = {
						workspaces = {
							my_workspace = "~/neorg",
						},
					},
				},
			},
		})
	end,
	requires = { "nvim-lua/plenary.nvim" },
	lazy = false, -- Lazy yüklemeyi devre dışı bırak
}
