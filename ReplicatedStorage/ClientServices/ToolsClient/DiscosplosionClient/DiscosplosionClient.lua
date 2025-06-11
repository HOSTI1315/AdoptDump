--// ReplicatedStorage.ClientServices.ToolsClient.DiscosplosionClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("DiscosplosionHelper")
local v_u_3 = v1("RouterClient")
return {
    ["init"] = function()
        v_u_3.get_event("ToolAPI/DiscosplosionThrown").OnClientEvent:Connect(function(p4, p5)
            v_u_2.create_and_launch_discosplosion(p4, p5)
        end)
    end
}