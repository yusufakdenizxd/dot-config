local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local themes_file = vim.fn.stdpath("config") .. "/lua/theme.lua"

local function update_colorscheme_in_config(selected_theme)
	local file = io.open(themes_file, "r")
	if not file then
		print("Could not open config file for reading")
		return
	end

	local content = file:read("*a")
	file:close()

	local new_content, count = content:gsub("colorscheme%s+[%w-_]+", "colorscheme " .. selected_theme)

	if count == 0 then
		print("No colorscheme line found in config, inserting one")
		new_content = content .. "\ncolorscheme " .. selected_theme .. "\n"
	end

	local file = io.open(themes_file, "w")
	if not file then
		print("Could not open config file for writing")
		return
	end

	file:write(new_content)
	file:close()
	print("Updated config with colorscheme: " .. selected_theme)
end

local function pick_colorscheme()
	require("telescope.builtin").colorscheme({
		enable_preview = true,
		attach_mappings = function(_, map)
			actions.select_default:replace(function(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				local theme = selection.value
				vim.cmd("colorscheme " .. theme)
				update_colorscheme_in_config(theme)
			end)
			return true
		end,
	})
end

return {
	pick_colorscheme = pick_colorscheme,
}
