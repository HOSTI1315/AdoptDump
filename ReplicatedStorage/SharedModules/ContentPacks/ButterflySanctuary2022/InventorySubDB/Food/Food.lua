--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2022.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Golden Leaf",
    ["image"] = "rbxassetid://10319555115",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "ButterflySanctuary2022GoldLeaf",
    ["tool"] = "ButterflyLeafAsPetBox",
    ["use_generated_public_lootbox_tooltip_description"] = true
}
v2.sanctuary_2022_gold_leaf = v3
local v4 = {
    ["name"] = "Leaf",
    ["image"] = "rbxassetid://10319556094",
    ["rarity"] = "ultra_rare",
    ["cost"] = 899,
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "ButterflySanctuary2022Leaf",
    ["tool"] = "ButterflyLeafAsPetBox",
    ["use_generated_public_lootbox_tooltip_description"] = true
}
v2.sanctuary_2022_leaf = v4
return v1(v2)