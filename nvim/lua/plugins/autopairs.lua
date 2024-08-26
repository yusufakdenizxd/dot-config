return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = "hrsh7th/nvim-cmp",
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup({
			disable_in_visualblock = false,
			disable_in_replace_mode = true,
			ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
			check_ts = true,
			map_c_w = true,
			enable_check_bracket_line = true,
		})
		local rule = require("nvim-autopairs.rule")

		autopairs.add_rules({
			rule("<", ">"):with_pair(function(opts)
				return opts.next_char ~= ">"
			end),
			rule(">", ">")
				:with_pair(function(_)
					return false
				end)
				:with_move(function(opts)
					return opts.char == ">"
				end)
				:use_key(">"),
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
