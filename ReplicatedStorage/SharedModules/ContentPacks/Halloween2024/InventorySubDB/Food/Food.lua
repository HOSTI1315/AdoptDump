--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2024.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Sugar Skull Potion",
    ["image"] = "rbxassetid://81801791844075",
    ["rarity"] = "ultra_rare",
    ["donatable"] = true,
    ["anims"] = {
        ["hold"] = "PotionHold",
        ["use"] = "PotionDrink"
    },
    ["cannot_feed_to_doll"] = true,
    ["cannot_feed_to_egg"] = true,
    ["cannot_feed_to_self"] = true,
    ["custom_tooltip_description"] = "Grants 45 tasks of experience to a pet\'s age.",
    ["message"] = "Feed this to a pet to instantly age it.",
    ["model_handle"] = "Halloween2024SugarSkullPotion",
    ["player_must_confirm"] = true,
    ["force_journal_visibility"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 1
}
v2.halloween_2024_sugar_skull_potion = v3
return v1(v2)