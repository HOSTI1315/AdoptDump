--// ReplicatedStorage.SharedModules.ContentPacks.FireDimension2024.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["image"] = "rbxassetid://16273268156",
    ["tool"] = "GenericTool",
    ["model_handle"] = "FireDimension2024FlameSword",
    ["name"] = "Flame Sword",
    ["anims"] = {
        ["hold"] = "BaseballBatHold",
        ["use"] = "BaseballBatSwing"
    },
    ["rarity"] = "rare"
}
v2.fire_dimension_2024_flame_sword = v3
return v1(v2)