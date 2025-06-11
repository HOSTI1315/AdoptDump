--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Lunar New Year Gift Box",
    ["image"] = "rbxassetid://16178918556",
    ["rarity"] = "common",
    ["cost"] = 4000,
    ["currency_id"] = "yakgwa_2024",
    ["anims"] = {
        ["box_opening"] = { "Lunar2024LunarNewYearGiftBoxOpen" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Lunar2024LunarNewYearGiftBox",
    ["tool"] = "GenericBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.lunar_2024_lunar_new_year_gift_box = v3
local v4 = {
    ["name"] = "1000 Bucks Silk Bag",
    ["image"] = "rbxassetid://16102399188",
    ["rarity"] = "uncommon",
    ["cost"] = 1050,
    ["anims"] = {
        ["hold"] = "CoffeeHold"
    },
    ["custom_tooltip_description"] = "Grants 1000 bucks on use (Uses Left: 1)",
    ["model_handle"] = "Lunar2024SilkBag",
    ["tool"] = "SilkBagTool",
    ["uses"] = 1
}
v2.lunar_2024_silk_bag = v4
local v5 = {
    ["name"] = "Special Lunar New Year Gift Box",
    ["image"] = "rbxassetid://16178922208",
    ["rarity"] = "legendary",
    ["cost"] = 21000,
    ["currency_id"] = "yakgwa_2024",
    ["anims"] = {
        ["box_opening"] = { "Lunar2024SpecialLunarNewYearGiftBoxOpen" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Lunar2024SpecialLunarNewYearGiftBox",
    ["tool"] = "GenericBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.lunar_2024_special_lunar_new_year_gift_box = v5
return v1(v2)