--// ReplicatedStorage.SharedModules.ContentPacks.Winter2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Ice Tray",
    ["image"] = "rbxassetid://83651142353908",
    ["rarity"] = "legendary",
    ["cost"] = 18000,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["box_opening"] = { "Winter2024IceTrayOpen1", "Winter2024IceTrayOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Winter2024IceTray",
    ["tool"] = "GenericBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.winter_2024_ice_tray = v3
local v4 = {
    ["name"] = "Winter 2024 Sticker Pack",
    ["image"] = "rbxassetid://120589474841350",
    ["rarity"] = "rare",
    ["cost"] = 1000,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Winter2024StickerPack",
    ["tool"] = "StickerPackTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["use_existing_rewards"] = {
        {
            ["count"] = 10,
            ["kind"] = "winter_2024_sticker_pack"
        }
    },
    ["card_back"] = {
        ["desktop"] = "rbxassetid://132647967229363",
        ["mobile"] = "rbxassetid://99879266386423"
    }
}
v2.winter_2024_sticker_pack = v4
local v5 = {
    ["name"] = "Golden Mistletoe",
    ["image"] = "rbxassetid://94836963857427",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["model_handle"] = "Winter2024GoldenMistletoe",
    ["tool"] = "Winter2024GoldenMistletoe",
    ["custom_tooltip_description"] = "You can use this anywhere outside on Adoption Island.",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.winter_2024_golden_mistletoe = v5
return v1(v2)