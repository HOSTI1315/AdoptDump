--// ReplicatedStorage.SharedModules.ContentPacks.Camping2025.Tools (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v3 = {
    ["Camping2025MapleLeafTreat"] = {
        ["client_use"] = function(_, _, p2)
            v_u_1("MooseAdoption").throw_food(p2.tool.ModelHandle, p2.item_data.unique)
        end
    }
}
return v3