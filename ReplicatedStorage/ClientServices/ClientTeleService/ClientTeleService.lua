--// ReplicatedStorage.ClientServices.ClientTeleService (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("RouterClient")
local v_u_3 = v1("InteriorsM")
local v_u_4 = v1("new:StreamingHelper")
local v5 = {}
v2.get_event("LocationAPI/TeleToLocation").OnClientEvent:connect(function(p6, p7, p8)
    local v9 = p8 or {}
    if v9.studs_ahead_of_door == nil then
        v9.studs_ahead_of_door = 4
    end
    if v9.char_id then
        local v10 = v_u_4.await(v9.char_id)
        while game.Players.LocalPlayer.Character ~= v10 do
            game.Players.LocalPlayer:GetPropertyChangedSignal("Character"):Wait()
        end
    end
    if v9.no_transition then
        v_u_3.enter(p6, p7, v9)
    else
        v_u_3.enter_smooth(p6, p7, v9)
    end
end)
function v5.init() end
return v5