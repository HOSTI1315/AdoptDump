--// ReplicatedStorage.ClientServices.ToolsClient.IceSaberClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("IceSaberHelper")
local v_u_3 = v1("RouterClient")
return {
    ["init"] = function()
        v_u_3.get_event("ToolAPI/IceSaberSwung").OnClientEvent:connect(function(p4, p5)
            v_u_2.replicate_swing(p4, p5)
        end)
        v_u_3.get_event("ToolAPI/IceSaberHit").OnClientEvent:connect(function(p6, p7)
            v_u_2.replicate_hit(p6, p7)
        end)
    end
}