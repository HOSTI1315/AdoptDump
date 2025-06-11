--// ReplicatedStorage.ClientServices.ToolsClient.FireworkLauncherClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("FireworkLauncherHelper")
local v_u_3 = v1("RouterClient")
return {
    ["init"] = function()
        v_u_3.get_event("ToolAPI/FireworkLaunched").OnClientEvent:connect(function(p4, p5, p6)
            v_u_2.replicate_launched_firework(p4, p5, p6)
        end)
        v_u_3.get_event("ToolAPI/FireworkLoaded").OnClientEvent:connect(function(p7, p8)
            v_u_2.replicate_loaded_firework(p7, p8)
        end)
    end
}