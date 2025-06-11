--// ReplicatedStorage.SharedModules.ContentPacks.LegendHatSept2022.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Cotton Candy Stick",
    ["image"] = "rbxassetid://10979218979",
    ["rarity"] = "common",
    ["cost"] = 2,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "IceCreamHold",
        ["use"] = "IceCreamLick"
    },
    ["model_handle"] = "CottonCandyStick",
    ["tool"] = "GenericTool",
    ["uses"] = 2
}
v2.cotton_candy_stick = v3
return v1(v2)