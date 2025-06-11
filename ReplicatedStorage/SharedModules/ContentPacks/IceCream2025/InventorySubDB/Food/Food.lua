--// ReplicatedStorage.SharedModules.ContentPacks.IceCream2025.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Ice Cream",
    ["image"] = "rbxassetid://15348116985",
    ["rarity"] = "common",
    ["cost"] = 1,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "IceCreamHold",
        ["use"] = "IceCreamLick"
    },
    ["model_handle"] = "IceCream2025Handle",
    ["preserve_model_welds"] = true,
    ["tool"] = "IceCreamTool",
    ["uses"] = 1
}
v2.icecream = v3
local v4 = {
    ["name"] = "Snow Cone",
    ["image"] = "rbxassetid://118873364374709",
    ["rarity"] = "common",
    ["cost"] = 1,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "IceCreamHold",
        ["use"] = "IceCreamLick"
    },
    ["model_handle"] = "IceCream2025SnowCone",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.ice_cream_2025_snow_cone = v4
local v5 = {
    ["name"] = "Ice Cream Cup",
    ["image"] = "rbxassetid://78809738062703",
    ["rarity"] = "common",
    ["cost"] = 1,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "IceCreamHold",
        ["use"] = "IceCreamLick"
    },
    ["model_handle"] = "IceCream2025CupHandle",
    ["preserve_model_welds"] = true,
    ["tool"] = "IceCreamTool",
    ["uses"] = 1
}
v2.ice_cream_2025_cup = v5
return v1(v2)