--
-- ██╗   ██╗ █████╗ ██████╗  █████╗ ██╗
-- ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗██║
--  ╚████╔╝ ███████║██████╔╝███████║██║
--   ╚██╔╝  ██╔══██║██╔══██╗██╔══██║██║
--    ██║   ██║  ██║██████╔╝██║  ██║██║
--    ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝
--
local task=require "hs.task"

local function yabai(args)
 task.new("/opt/homebrew/bin/yabai",nil, function(ud, ...)
    return true
  end, args):start()

end

local function hyper(key, commands)
	hs.hotkey.bind({ "cmd", "ctrl", "alt", "shift" }, key, function()
		yabai(commands)
	end)
end

hyper("a", {"-m", "space", "--focus", "prev"})
hyper("d", {"-m", "space", "--focus", "next"})

hyper("1", {"-m", "space", "--focus", "1"})
hyper("2", {"-m", "space", "--focus", "2"})
hyper("3", {"-m", "space", "--focus", "3"})
hyper("4", {"-m", "space", "--focus", "4"})
hyper("5", {"-m", "space", "--focus", "5"})
hyper("6", {"-m", "space", "--focus", "6"})
hyper("7", {"-m", "space", "--focus", "7"})
hyper("8", {"-m", "space", "--focus", "8"})
hyper("9", {"-m", "space", "--focus", "9"})

