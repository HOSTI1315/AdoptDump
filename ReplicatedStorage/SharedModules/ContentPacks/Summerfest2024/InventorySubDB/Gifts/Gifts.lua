--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "State Fair Sticker Pack",
    ["image"] = "rbxassetid://18203067955",
    ["rarity"] = "uncommon",
    ["cost"] = 1000,
    ["currency_id"] = "tickets_2024",
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Summer2024StickerPack",
    ["tool"] = "StickerPackTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["use_existing_rewards"] = {
        {
            ["count"] = 10,
            ["kind"] = "summerfest_2024_state_fair_sticker_pack"
        }
    },
    ["card_back"] = {
        ["desktop"] = "rbxassetid://18203082476",
        ["mobile"] = "rbxassetid://18203081269"
    }
}
v2.summerfest_2024_state_fair_sticker_pack = v3
return v1(v2)