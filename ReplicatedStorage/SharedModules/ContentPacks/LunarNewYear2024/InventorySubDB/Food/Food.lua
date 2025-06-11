--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2024.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Rice Cake Soup",
    ["image"] = "rbxassetid://16169574916",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "CoffeeHold",
        ["use"] = "TeaDrink"
    },
    ["model_handle"] = "Lunar2024RiceCakeSoup",
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.lunar_2024_rice_cake_soup = v3
local v4 = {
    ["name"] = "Sweet Rice Drink",
    ["image"] = "rbxassetid://16169579731",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "CoffeeHold",
        ["use"] = "TeaDrink"
    },
    ["model_handle"] = "Lunar2024SweetRiceDrink",
    ["tool"] = "GenericTool",
    ["uses"] = 2
}
v2.lunar_2024_sweet_rice_drink = v4
return v1(v2)