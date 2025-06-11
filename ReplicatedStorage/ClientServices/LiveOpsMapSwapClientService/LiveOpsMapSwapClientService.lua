--// ReplicatedStorage.ClientServices.LiveOpsMapSwapClientService (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("LiveOpsMapSwap")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("InteriorsM")
local v_u_5 = v1("package:Promise")
local v_u_6 = game:GetService("Players")
local v7 = {}
local v_u_8 = v_u_5.resolve()
local function v_u_15(p_u_9)
    local v10 = v_u_6.LocalPlayer.Character
    if v10 then
        v10 = v10:FindFirstChild("HumanoidRootPart")
    end
    if v10 then
        v_u_8:cancel()
        v_u_8 = v_u_5.new(function(p11, p12)
            local v13 = v_u_3.get("LocationAPI/GetLiveOpsMapSwapTransitionCFrame"):InvokeServer(p_u_9)
            if v13 then
                p11(v13)
            else
                p12()
            end
        end):andThen(function(p14)
            v_u_4.enter_smooth(p_u_9, "MainDoor", {
                ["spawn_cframe"] = p14
            })
        end):catch(function()
            v_u_4.enter_smooth(p_u_9, "MainDoor")
        end)
    end
    return v_u_8
end
function v7.init()
    task.spawn(function()
        while true do
            repeat
                v_u_5.race({ v_u_5.fromEvent(v_u_2.map_type_changed), v_u_5.delay(5) }):await()
                local v16 = v_u_4.get_current_location()
            until v16 ~= nil and (v_u_4.can_enter(v16.destination_id) and v_u_2.is_in_outdated_location(v16))
            v_u_15(v16.destination_id):await()
        end
    end)
end
return v7