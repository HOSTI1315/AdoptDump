--// ReplicatedStorage.SharedModules.ContentPacks.Snow2022.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Golden Clam",
    ["image"] = "rbxassetid://9550691254",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["custom_tooltip_description"] = "You need to be in the Snowy Igloo Shop to use this!",
    ["model_handle"] = "Snow2022GoldenClam",
    ["tool"] = "GoldenClam"
}
v2.snow_2022_golden_clam = v3
local v4 = {
    ["name"] = "Ice Lolly",
    ["image"] = "rbxassetid://9343870937",
    ["rarity"] = "rare",
    ["cost"] = 2,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "IceCreamHold",
        ["use"] = "IceCreamLick"
    },
    ["liveops_map_type_required_for_purchase"] = "Snow",
    ["model_handle"] = "Snow2022IceLolly",
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.snow_2022_ice_lolly = v4
return v1(v2)