--// ReplicatedStorage.ClientServices.ToolsClient.MagicHouseDoorClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("AnimationManager")
local v_u_4 = v1("new:StreamingHelper")
local v_u_5 = {}
local v_u_6 = {}
function v_u_5.init()
    v_u_2.get("PlaceableToolAPI/MagicHouseDoorUsed").OnClientEvent:Connect(function(p7)
        local v8 = v_u_4.get(p7)
        if v8 then
            v_u_5.animate_door(v8)
        end
    end)
end
function v_u_5.animate_door(p9)
    if not v_u_6[p9] then
        v_u_6[p9] = true
        local v10 = p9.Rig.AnimationController
        local v11 = v10:LoadAnimation(v_u_3.get_track("MagicDoorOpen"))
        v11:Play()
        v11.Stopped:Wait()
        local v12 = v10:LoadAnimation(v_u_3.get_track("MagicDoorOpenIdle"))
        v12:Play()
        wait(1)
        v12:Stop()
        local v13 = v10:LoadAnimation(v_u_3.get_track("MagicDoorClose"))
        v13:Play()
        v13.Stopped:Wait()
        v_u_6[p9] = nil
    end
end
return v_u_5