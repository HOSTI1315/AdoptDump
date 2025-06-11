--// ReplicatedStorage.ClientServices.DoorsClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("DoorsM")
local v_u_4 = v1("InteriorsM")
local v_u_5 = v1("UIManager")
local v6 = v1("CriticalSection")
local v_u_7 = v1("new:StreamingPauseState")
local v_u_8 = v1("MinigameForcedState")
local v9 = {}
local v_u_10 = v6.new()
function v9.init()
    v_u_2.get_event("AdoptAPI/PassiveDoorEnter").OnClientEvent:connect(function(p11, p12, p13, p14)
        v_u_10:wait()
        v_u_7.enter_loading_screen("DoorsClient")
        v_u_5.apps.TransitionsApp:transition({
            ["length"] = 0.5,
            ["start_transparency"] = 1,
            ["end_transparency"] = 0,
            ["color"] = Color3.new(1, 1, 1)
        })
        v_u_4.enter(p12, p13, p14, p11)
        task.wait(0.1)
        v_u_7.await_unpaused()
        v_u_7.exit_loading_screen("DoorsClient")
        v_u_5.apps.TransitionsApp:transition({
            ["length"] = 0.4,
            ["start_transparency"] = 0,
            ["end_transparency"] = 1,
            ["color"] = Color3.new(1, 1, 1)
        })
        v_u_10:signal()
    end)
    spawn(function()
        while true do
            repeat
                wait(0.25)
            until v_u_8.can_enter_doors()
            v_u_3.refresh_doors()
        end
    end)
end
return v9