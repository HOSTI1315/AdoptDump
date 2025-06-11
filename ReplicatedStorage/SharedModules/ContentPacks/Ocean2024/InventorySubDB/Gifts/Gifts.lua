--// ReplicatedStorage.SharedModules.ContentPacks.Ocean2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Ocean Sticker Pack",
    ["image"] = "rbxassetid://133762357555183",
    ["rarity"] = "rare",
    ["cost"] = 250,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Ocean2024StickerPack",
    ["tool"] = "StickerPackTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["use_existing_rewards"] = {
        {
            ["count"] = 10,
            ["kind"] = "ocean_2024_ocean_sticker_pack"
        }
    },
    ["card_back"] = {
        ["desktop"] = "rbxassetid://131336802218145",
        ["mobile"] = "rbxassetid://128190486900490"
    }
}
v2.ocean_2024_ocean_sticker_pack = v3
return v1(v2)