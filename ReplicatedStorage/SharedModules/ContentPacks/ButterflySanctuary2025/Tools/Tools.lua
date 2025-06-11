--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2025.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v4 = {
    ["AdoptionTool"] = {
        ["client_use"] = function(p2, _, p3, _, _)
            v_u_1("new:RoamingPetAdoptionClient").throw_food_tool(p2, p3)
        end
    }
}
return v4