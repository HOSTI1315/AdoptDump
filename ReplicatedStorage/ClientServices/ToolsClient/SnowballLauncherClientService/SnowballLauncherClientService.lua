--// ReplicatedStorage.ClientServices.ToolsClient.SnowballLauncherClientService (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("SnowballLauncher")
return {
    ["init"] = function()
        v_u_2.get("EventAPI/SnowballShot").OnClientEvent:connect(function(p4, p5)
            if p4 ~= game.Players.LocalPlayer then
                v_u_3.shoot_snowball(p4, p5)
            end
        end)
    end
}