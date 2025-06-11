--// ReplicatedStorage.SharedModules.ContentPacks.CampingShop2023.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Camper\'s Smore Treat",
    ["image"] = "rbxassetid://12403142769",
    ["rarity"] = "uncommon",
    ["cost"] = 4,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "SandwichHold",
        ["use"] = "SandwichEat"
    },
    ["model_handle"] = "Camping2023Smores",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.camping_2023_smores = v3
return v1(v2)