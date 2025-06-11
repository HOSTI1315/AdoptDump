--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v5 = {
    ["FireworkLauncherTool"] = {
        ["ignore_server_use_on_tool"] = true,
        ["client_use"] = function(p2, _, _, _, p3)
            v_u_1("FireworkLauncherHelper").client_use(p2, p3)
        end,
        ["equipped"] = function(p4)
            v_u_1("FireworkLauncherHelper").equipped(p4)
        end
    }
}
return v5