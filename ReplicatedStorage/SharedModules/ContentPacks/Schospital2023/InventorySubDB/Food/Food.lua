--// ReplicatedStorage.SharedModules.ContentPacks.Schospital2023.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Sandwich",
    ["image"] = "rbxassetid://2582282124",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "SandwichHold",
        ["use"] = "SandwichEat"
    },
    ["model_handle"] = "Sandwich",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.schospital_refresh_2023_cafeteria_sandwich = v3
return v1(v2)