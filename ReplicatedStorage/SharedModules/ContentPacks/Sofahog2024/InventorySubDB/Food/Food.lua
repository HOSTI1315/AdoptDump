--// ReplicatedStorage.SharedModules.ContentPacks.Sofahog2024.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Apple Pie",
    ["image"] = "rbxassetid://16036440472",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "BurgerHold",
        ["use"] = "BurgerEat"
    },
    ["model_handle"] = "Diner2024ApplePie",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.sofahog_2024_diner_apple_pie = v3
local v4 = {
    ["name"] = "Hot Dog And Fries",
    ["image"] = "rbxassetid://16036413904",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "BurgerHold",
        ["use"] = "BurgerEat"
    },
    ["model_handle"] = "Diner2024HotDogAndFries",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.sofahog_2024_diner_hot_dog_and_fries = v4
local v5 = {
    ["name"] = "Lemonade",
    ["image"] = "rbxassetid://16036412495",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "ChocoMilkHold",
        ["use"] = "ChocoMilkEat"
    },
    ["model_handle"] = "Diner2024Lemonade",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.sofahog_2024_diner_lemonade = v5
local v6 = {
    ["name"] = "Mac and Cheese",
    ["image"] = "rbxassetid://16036408038",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "BurgerHold",
        ["use"] = "BurgerEat"
    },
    ["model_handle"] = "Diner2024MacAndCheese",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.sofahog_2024_diner_mac_and_cheese = v6
local v7 = {
    ["name"] = "Milkshake",
    ["image"] = "rbxassetid://16036405550",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "thirsty",
    ["anims"] = {
        ["hold"] = "ChocoMilkHold",
        ["use"] = "ChocoMilkEat"
    },
    ["model_handle"] = "Diner2024Milkshake",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 5
}
v2.sofahog_2024_diner_milkshake = v7
local v8 = {
    ["name"] = "Pancakes",
    ["image"] = "rbxassetid://16036400140",
    ["rarity"] = "common",
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "BurgerHold",
        ["use"] = "BurgerEat"
    },
    ["model_handle"] = "Diner2024Pancakes",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.sofahog_2024_diner_pancakes = v8
return v1(v2)