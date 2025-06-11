--// ReplicatedStorage.ClientServices.ToolsClient.SqueakyToyClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("SoundPlayer")
local v_u_8 = {
    ["init"] = function()
        v_u_2.get_event("PetObjectAPI/SqueakEffectTriggered").OnClientEvent:connect(function(p4)
            v_u_8.play_squeak_effect(p4)
        end)
    end,
    ["play_squeak_effect"] = function(p5, p6)
        if p5 ~= nil then
            local v7 = v_u_3.FX:play("Squeak", p5)
            if p6 then
                v7.MaxDistance = v7.MaxDistance + 500
            else
                v7.Volume = v7.Volume / 3
            end
            p5.Squeak:Emit(1)
        end
    end
}
return v_u_8