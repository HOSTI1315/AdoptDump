--// ReplicatedStorage.ClientServices.ToolsClient.ServerCollidableClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("ServerCollidablesDB")
local v_u_4 = v1("new:StreamingHelper")
return {
    ["init"] = function()
        v_u_2.get("ToolAPI/ServerCollidableTriggered").OnClientEvent:connect(function(p5, p6)
            local v7 = v_u_4.await(p6, 5)
            if v7 then
                v_u_3[p5].client_render(v7)
            end
        end)
    end
}