--// ReplicatedStorage.SharedModules.ContentPacks.Camping2025.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Maple Leaf Treat",
    ["image"] = "rbxassetid://127248211001553",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "Camping2025MapleLeafTreat",
    ["tool"] = "Camping2025MapleLeafTreat",
    ["custom_tooltip_description"] = "You need to be in the Camping Shop to use this!"
}
v2.camping_2025_maple_leaf_treat = v3
return v1(v2)