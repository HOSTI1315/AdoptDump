--// ReplicatedStorage.SharedModules.ContentPacks.IceDimension2025.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Fire Dimension Sticker Pack",
    ["image"] = "rbxassetid://130522277317617",
    ["rarity"] = "rare",
    ["cost"] = 400,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "IceDimension2025FireDimensionStickerPack",
    ["tool"] = "StickerPackTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["use_existing_rewards"] = {
        {
            ["count"] = 10,
            ["kind"] = "ice_dimension_2025_fire_dimension_sticker_pack"
        }
    },
    ["card_back"] = {
        ["desktop"] = "rbxassetid://134454348218394",
        ["mobile"] = "rbxassetid://88491286622108"
    }
}
v2.ice_dimension_2025_fire_dimension_sticker_pack = v3
return v1(v2)