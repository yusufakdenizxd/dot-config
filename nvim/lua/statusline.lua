local modes = {
	["n"] = "[Normal]",
	["no"] = "[Normal]",
	["v"] = "[Visual]",
	["V"] = "[Vlline]",
	[""] = "[Vblock]",
	["s"] = "[Select]",
	["S"] = "[Selctl]",
	[""] = "[Sblock]",
	["i"] = "[Insert]",
	["ic"] = "[Insert]",
	["R"] = "[Replac]",
	["Rv"] = "[VRplac]",
	["c"] = "[Cmmand]",
	["cv"] = "[VimEx]",
	["ce"] = "[Ex]",
	["r"] = "[Prompt]",
	["rm"] = "[Moar]",
	["r?"] = "[Confirm]",
	["!"] = "[Shell]",
	["t"] = "[Terminal]",
}

local function mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format("%s", modes[current_mode])
end

local function filepath()
	local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
	if fpath == "" or fpath == "." then
		return " "
	end

	return string.format(" %%<%s/", fpath)
end

local function filename()
	local fname = vim.fn.expand("%:t")
	if fname == "" then
		return ""
	end
	return fname .. " "
end

local function filetype()
	return string.format("[%s]", vim.bo.filetype)
end

local function lineinfo()
	if vim.bo.filetype == "alpha" then
		return ""
	end
	return "[%P %l:%c]"
end
local function left_section()
	local path = filepath()
	local name = filename()

	local value = path .. name
	return value
end

local function right_section()
	local file_type = filetype()
	local line_info = lineinfo()

	local value = file_type .. " " .. line_info
	return value
end

Statusline = {}

Statusline.active = function()
	return table.concat({
		mode(),
		left_section(),
		"%=",
		right_section(),
	})
end

function Statusline.inactive()
	return " %F"
end

vim.api.nvim_exec(
	[[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]],
	false
)
