--// ReplicatedStorage.SharedModules.SpecialLootBoxTypesHelper (ModuleScript)

local v_u_1 = {
    ["currency"] = {
        ["money"] = "Bucks",
        ["cherry_blossoms_2025"] = require(game.ReplicatedStorage.Fsys).load("AltCurrencyDB").cherry_blossoms.human_readable
    }
}
local v_u_4 = {
    ["currency"] = function(p2)
        local v3 = v_u_1[p2.category][p2.kind]
        if p2.kind == "money" then
            return ("%* ($%*)"):format(v3, p2.amount)
        else
            return ("%* (x%*)"):format(v3, p2.amount)
        end
    end
}
return {
    ["get_name_transform"] = function(p5)
        return v_u_4[p5]
    end
}