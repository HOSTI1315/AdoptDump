--// ReplicatedStorage.SharedModules.ContentPacks.Celestial2024.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Tiny Age Potion",
    ["image"] = "rbxassetid://18853094132",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["cannot_feed_to_doll"] = true,
    ["cannot_feed_to_egg"] = true,
    ["cannot_feed_to_self"] = true,
    ["custom_tooltip_description"] = "Grants 3 tasks of experience to a pet\'s age.",
    ["message"] = "Feed this to a pet to instantly age it.",
    ["model_handle"] = "TinyAgePotion",
    ["player_must_confirm"] = true,
    ["force_journal_visibility"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.tiny_pet_age_potion = v3
return v1(v2)