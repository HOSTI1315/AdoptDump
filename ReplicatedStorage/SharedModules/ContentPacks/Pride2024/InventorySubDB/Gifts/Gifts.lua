--// ReplicatedStorage.SharedModules.ContentPacks.Pride2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Pride Sticker Pack ",
    ["image"] = "rbxassetid://17729480539",
    ["rarity"] = "rare",
    ["cost"] = 50,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Pride2024StickerPack",
    ["tool"] = "StickerPackTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["use_existing_rewards"] = {
        {
            ["count"] = 10,
            ["kind"] = "pride_2024_sticker_pack"
        }
    },
    ["card_back"] = {
        ["desktop"] = "rbxassetid://17733538422",
        ["mobile"] = "rbxassetid://17733538545"
    }
}
v2.pride_2024_sticker_pack = v3
return v1(v2)