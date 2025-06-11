--// ReplicatedStorage.SharedModules.ContentPacks.Stickers2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Standard Sticker Pack ",
    ["image"] = "rbxassetid://16791229466",
    ["rarity"] = "common",
    ["cost"] = 250,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Stickers2024StandardPack",
    ["tool"] = "StickerPackTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["use_existing_rewards"] = {
        {
            ["count"] = 10,
            ["kind"] = "stickers_2024_standard_pack"
        }
    },
    ["card_back"] = {
        ["desktop"] = "rbxassetid://16800119693",
        ["mobile"] = "rbxassetid://16791198607"
    }
}
v2.stickers_2024_standard_pack = v3
local v4 = {
    ["name"] = "Premium Sticker Pack",
    ["image"] = "rbxassetid://16791229396",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Stickers2024PremiumPack",
    ["tool"] = "StickerPackTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["use_existing_rewards"] = {
        {
            ["count"] = 10,
            ["kind"] = "stickers_2024_premium_pack"
        }
    },
    ["card_back"] = {
        ["desktop"] = "rbxassetid://16800119599",
        ["mobile"] = "rbxassetid://16791198498"
    }
}
v2.stickers_2024_premium_pack = v4
return v1(v2)