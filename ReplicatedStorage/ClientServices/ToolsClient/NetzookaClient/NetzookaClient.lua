--// ReplicatedStorage.ClientServices.ToolsClient.NetzookaClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("NetzookaHelper")
local v_u_3 = v1("RouterClient")
return {
    ["init"] = function()
        v_u_3.get_event("ToolAPI/NetzookaLaunched").OnClientEvent:connect(function(p4, p5, p6)
            v_u_2.replicate_launched_net(p4, p5, p6)
        end)
    end
}