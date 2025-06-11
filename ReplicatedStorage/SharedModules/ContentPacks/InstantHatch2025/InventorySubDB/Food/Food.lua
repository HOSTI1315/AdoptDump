--// ReplicatedStorage.SharedModules.ContentPacks.InstantHatch2025.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Instant Hatch Potion",
    ["image"] = "rbxassetid://9340984949",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["cannot_feed_to_doll"] = true,
    ["cannot_feed_to_self"] = true,
    ["can_only_feed_to_egg"] = true,
    ["custom_tooltip_description"] = "Instantly hatch an egg.",
    ["message"] = "Feed this to an egg to instantly hatch it.",
    ["model_handle"] = "AgePotion",
    ["player_must_confirm"] = true,
    ["force_journal_visibility"] = false,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.pet_instant_hatch_potion = v3
return v1(v2)