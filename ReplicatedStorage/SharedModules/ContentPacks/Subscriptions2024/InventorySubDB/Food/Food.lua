--// ReplicatedStorage.SharedModules.ContentPacks.Subscriptions2024.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Golden Petunia",
    ["image"] = "rbxassetid://103742455997537",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "PotionHold"
    },
    ["model_handle"] = "Subscription2024GoldenFlower",
    ["tool"] = "GoldenFlower",
    ["custom_tooltip_description"] = "You can use this anywhere outside on Adoption Island.",
    ["use_generated_public_lootbox_tooltip_description"] = true
}
v2.subscription_2024_golden_flower = v3
return v1(v2)