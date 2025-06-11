--// ReplicatedStorage.ClientServices.SinglePurpose.FloatyClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("RouterClient")
v1("CharWrapperClient")
return {
    ["init"] = function()
        v_u_2.get_event("ToolAPI/CastWaterRaycast").OnClientInvoke = function(p3)
            return workspace:FindPartOnRayWithWhitelist(p3, { workspace.Terrain })
        end
    end
}