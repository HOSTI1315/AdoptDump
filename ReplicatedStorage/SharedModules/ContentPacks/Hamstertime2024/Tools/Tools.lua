--// ReplicatedStorage.SharedModules.ContentPacks.Hamstertime2024.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v3 = {
    ["GoldenCorn"] = {
        ["client_use"] = function(_, _, p2)
            v_u_1("HamsterAdoption").throw_food(p2.tool.ModelHandle, p2.item_data.unique)
        end
    }
}
return v3