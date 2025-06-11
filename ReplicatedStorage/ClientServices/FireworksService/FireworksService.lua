--// ReplicatedStorage.ClientServices.FireworksService (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("EZFireworks")
local v_u_3 = v1("RouterClient")
return {
    ["init"] = function()
        v_u_3.get_event("EventAPI/FireworksStarted").OnClientEvent:connect(function(p4)
            v_u_2:FireAmount(p4)
        end)
    end
}