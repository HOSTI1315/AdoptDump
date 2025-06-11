--// ReplicatedStorage.SharedModules.ContentPacks.Desert2022.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Knafeh",
    ["image"] = "rbxassetid://8528286909",
    ["rarity"] = "rare",
    ["cost"] = 2,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "SandwichHold",
        ["use"] = "SandwichEat"
    },
    ["liveops_map_type_required_for_purchase"] = "Desert",
    ["model_handle"] = "Desert2022Knafeh",
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.desert_2022_knafeh = v3
local v4 = {
    ["name"] = "Mud Ball",
    ["image"] = "rbxassetid://8566844808",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["custom_tooltip_description"] = "You need to be in the Desert Shop to use this",
    ["model_handle"] = "Desert2022MudBall",
    ["tool"] = "MudBall"
}
v2.desert_2022_mud_ball = v4
return v1(v2)