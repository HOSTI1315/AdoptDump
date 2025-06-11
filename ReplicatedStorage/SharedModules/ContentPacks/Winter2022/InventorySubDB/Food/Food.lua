--// ReplicatedStorage.SharedModules.ContentPacks.Winter2022.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Strawberry Shortcake",
    ["image"] = "rbxassetid://11582929151",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "BurgerHold",
        ["use"] = "BurgerEat"
    },
    ["model_handle"] = "Winter2022StrawberryShortcake",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.winter_2022_strawberry_shortcake = v3
return v1(v2)