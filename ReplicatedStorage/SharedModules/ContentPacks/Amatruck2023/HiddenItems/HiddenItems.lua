--// ReplicatedStorage.SharedModules.ContentPacks.Amatruck2023.HiddenItems (ModuleScript)

local v1 = {
    ["non_tradeable_items"] = {
        ["amatruck_2023_toy_delivery_truck"] = require(game.ReplicatedStorage.Fsys).load("TimeZoneHelper").from_region_datetime("PT", 2024, 1, 1, 0).UnixTimestamp
    }
}
return v1