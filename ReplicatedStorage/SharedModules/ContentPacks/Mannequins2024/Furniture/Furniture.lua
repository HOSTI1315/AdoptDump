--// ReplicatedStorage.SharedModules.ContentPacks.Mannequins2024.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("EntryHelper")
local v3 = v1("FurnitureUseHelperDB")
local v4 = v2.furniture
local v5 = {
    ["mannequins_2024_mannequin"] = {
        ["name"] = "Mannequin",
        ["cost"] = 750,
        ["model_name"] = "Mannequin",
        ["image_id"] = 16568175507,
        ["tags"] = { "Stand" },
        ["layout_order"] = -1000,
        ["behavior"] = v3.mannequin,
        ["limit_per_house"] = 10
    }
}
return v4(v5)