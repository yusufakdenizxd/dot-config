Colors = {
	smooth_black = '#0f0f0f',

	shell_pink = '#ffafd7',
	shell_yellow = '#ffd75f',
	shell_cyan = '#00d7ff',
	shell_green = '#87ff5f',
	shell_grey = '#878787',
	shell_red = '#ff2930',

	black = '#0f0f0f',
	grey = '#928374',
	yellow = '#d8a657',
	white = '#d4be98',
	orange = '#e78a4e',
	cyan = '#7daea3',
	mint = '#89b482',
	purple = '#d3869b',
	red = '#ea6962',

	darkerest = '#1f1e1e',
	darkness = '#1a1919',
}

require "options"
require "mappings"
require "commands"

 local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
 if not vim.loop.fs_stat(lazypath) then
 	vim.fn.system({
 		'git',
 		'clone',
 		'--filter=blob:none',
 		'https://github.com/folke/lazy.nvim.git',
 		'--branch=stable', -- latest stable release
 		lazypath,
 	})
 end
 vim.opt.rtp:prepend(lazypath)

 require('lazy').setup('plugins', {
 	install = {
 		colorscheme = { 'gruvbox-material' },
 	},
 	change_detection = {
 		notify = false,
 	},
 })


