--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Halloween Chick Box",
    ["image"] = "rbxassetid://89085777382886",
    ["rarity"] = "legendary",
    ["cost"] = 17000,
    ["currency_id"] = "candy_2024",
    ["anims"] = {
        ["box_opening"] = { "Halloween2024ChickBoxOpened1", "Halloween2024ChickBoxOpened2", "Halloween2024ChickBoxOpened3" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Halloween2024ChickBox",
    ["tool"] = "GenericBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.halloween_2024_chick_box = v3
local v4 = {
    ["name"] = "Halloween 2024 Sticker Pack",
    ["image"] = "rbxassetid://122984942085200",
    ["rarity"] = "rare",
    ["cost"] = 1000,
    ["currency_id"] = "candy_2024",
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Halloween2024StickerPack",
    ["tool"] = "StickerPackTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["use_existing_rewards"] = {
        {
            ["count"] = 10,
            ["kind"] = "halloween_2024_sticker_pack"
        }
    },
    ["card_back"] = {
        ["desktop"] = "rbxassetid://133671846226672",
        ["mobile"] = "rbxassetid://124510050478931"
    }
}
v2.halloween_2024_sticker_pack = v4
return v1(v2)