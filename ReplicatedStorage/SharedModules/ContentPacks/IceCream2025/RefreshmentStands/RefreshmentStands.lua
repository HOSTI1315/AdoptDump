--// ReplicatedStorage.SharedModules.ContentPacks.IceCream2025.RefreshmentStands (ModuleScript)

local v1 = {
    ["ice_cream_2025_snow_cone_stand"] = {
        ["default_price"] = 10,
        ["max_price"] = 20,
        ["model_name"] = "IceCream2025SnowConeStand",
        ["refreshment_name"] = "Snow Cone",
        ["refreshment_item"] = require(game.ReplicatedStorage.Fsys).load("KindDB").ice_cream_2025_snow_cone
    }
}
return v1