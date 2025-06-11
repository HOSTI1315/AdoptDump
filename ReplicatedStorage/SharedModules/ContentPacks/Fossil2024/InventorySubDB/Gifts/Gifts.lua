--// ReplicatedStorage.SharedModules.ContentPacks.Fossil2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Fossil Sticker Pack ",
    ["image"] = "rbxassetid://17107039932",
    ["rarity"] = "rare",
    ["cost"] = 250,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Fossil2024FossilStickerPack",
    ["tool"] = "StickerPackTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["use_existing_rewards"] = {
        {
            ["count"] = 10,
            ["kind"] = "fossil_2024_fossil_sticker_pack"
        }
    },
    ["card_back"] = {
        ["desktop"] = "rbxassetid://17107046329",
        ["mobile"] = "rbxassetid://17107044630"
    }
}
v2.fossil_2024_fossil_sticker_pack = v3
return v1(v2)