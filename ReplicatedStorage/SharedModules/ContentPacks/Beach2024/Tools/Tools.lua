--// ReplicatedStorage.SharedModules.ContentPacks.Beach2024.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v3 = {
    ["MahiSpinningRod"] = {
        ["client_use"] = function(_, _, p2)
            v_u_1("FishAdoption").go_fishing(p2.item_data.unique)
        end
    },
    ["MahiFishingRod"] = {}
}
return v3