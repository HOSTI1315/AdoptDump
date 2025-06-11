--// ReplicatedStorage.SharedModules.ContentPacks.Fall2022.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Cinnamon Roll",
    ["image"] = "rbxassetid://9973757035",
    ["rarity"] = "uncommon",
    ["cost"] = 3,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "SandwichHold",
        ["use"] = "SandwichEat"
    },
    ["liveops_map_type_required_for_purchase"] = "Fall",
    ["model_handle"] = "Fall2022CinnamonRoll",
    ["tool"] = "CandyTool",
    ["uses"] = 1
}
v2.fall_2022_cinnamon_roll = v3
local v4 = {
    ["name"] = "Golden Wheat",
    ["image"] = "rbxassetid://10137833568",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["custom_tooltip_description"] = "You need to be in the Fall Shop to use this!",
    ["model_handle"] = "Fall2022GoldenWheatStalk",
    ["tool"] = "GoldenWheatStalk"
}
v2.fall_2022_golden_wheat_stalk = v4
return v1(v2)