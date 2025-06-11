--// ReplicatedStorage.SharedModules.ContentPacks.Subscriptions2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Pets Plus Sticker Pack",
    ["image"] = "rbxassetid://18522832129",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Subscription2024StickerPack",
    ["tool"] = "StickerPackTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["use_existing_rewards"] = {
        {
            ["count"] = 10,
            ["kind"] = "subscription_2024_sticker_pack"
        }
    },
    ["card_back"] = {
        ["desktop"] = "rbxassetid://18522831545",
        ["mobile"] = "rbxassetid://18522831688"
    }
}
v2.subscription_2024_sticker_pack = v3
local v4 = {
    ["name"] = "Pet Handler Pro Certificate",
    ["image"] = "rbxassetid://113749410542550",
    ["rarity"] = "legendary",
    ["custom_tooltip_description"] = "Equip an extra pet that can receive a fraction of the needs!\nYour daily bucks limit will be raised to accommodate an extra pet!",
    ["subscription_gifting"] = {
        ["kind"] = "equip_2x_pets",
        ["duration"] = 2635200
    },
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Subscription2024PetsPlusCertificate",
    ["tool"] = "SubscriptionCertificateTool"
}
v2.subscription_2024_2x_pet_certificate = v4
return v1(v2)