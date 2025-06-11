--// ReplicatedStorage.SharedModules.ContentPacks.Rain2023.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Coconut Drink",
    ["image"] = "rbxassetid://11005931127",
    ["rarity"] = "uncommon",
    ["cost"] = 2,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "ChocoMilkHold",
        ["use"] = "CoconutDrinkUse"
    },
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["model_handle"] = "Rain2023CoconutDrink",
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.rain_2023_coconut_drink = v3
local v4 = {
    ["name"] = "Golden Plantain",
    ["image"] = "rbxassetid://11203922015",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["custom_tooltip_description"] = "You need to be in the Rain Pet Shop to use this!",
    ["model_handle"] = "Rain2023GoldenPlantain",
    ["tool"] = "GoldenPlantain"
}
v2.rain_2023_golden_plantain = v4
return v1(v2)