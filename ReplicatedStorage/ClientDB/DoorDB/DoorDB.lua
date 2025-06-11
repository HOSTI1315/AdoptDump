--// ReplicatedStorage.ClientDB.DoorDB (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("ObbyM")
local v3 = {
    ["obby_lobby"] = {
        ["on_enter"] = function(_, _)
            v_u_1.enter_obby_lobby()
        end,
        ["on_exit"] = function() end
    },
    ["obby"] = {
        ["on_enter"] = function(_, p2)
            v_u_1.enter_obby(p2)
        end,
        ["on_exit"] = function()
            v_u_1.exit_obby()
        end
    },
    ["obby_complete"] = {
        ["on_exit"] = function()
            v_u_1.complete_obby()
        end
    }
}
return v3