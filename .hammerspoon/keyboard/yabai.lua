-- cSpell:words koekeishiya yabai fullscreen unfloat hjkl
--
-- ██╗   ██╗ █████╗ ██████╗  █████╗ ██╗
-- ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗██║
--  ╚████╔╝ ███████║██████╔╝███████║██║
--   ╚██╔╝  ██╔══██║██╔══██╗██╔══██║██║
--    ██║   ██║  ██║██████╔╝██║  ██║██║
--    ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝
--
-- https://github.com/koekeishiya/yabai
local task=require "hs.task"


-- local function yabai(commands)
--     print("comd:", commands)
-- 		-- os.execute("/opt/homebrew/bin/yabai -m " .. cmd)
-- local cmd = "/opt/homebrew/bin/yabai" -- Örnek bir komut
-- local myTask = task.new(cmd, function(exitCode, stdOut, stdErr)
--     print("Standard Error:", stdErr)
--     return true
-- end,commands)

-- myTask:start()
 
-- end

function yabai(args)

  -- Runs in background very fast
 task.new("/opt/homebrew/bin/yabai",nil, function(ud, ...)
    print("stream", hs.inspect(table.pack(...)))
    return true
  end, args):start()

end


-- local function yabai(commands)
-- 		-- os.execute("/opt/homebrew/bin/yabai -m " .. cmd)
--     local a =  task.new("/opt/homebrew/bin/yabai",nil, function(ud, ...)
--     return true
--   end, commands)
--   a:start()
-- end

local function hyper(key, commands)
	hs.hotkey.bind({ "cmd", "ctrl", "alt", "shift" }, key, function()
		yabai(commands)
	end)
end
-- alpha
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

