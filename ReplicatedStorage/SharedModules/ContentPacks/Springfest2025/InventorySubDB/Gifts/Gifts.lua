--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Cherry Blossom 2025 Sticker Pack ",
    ["image"] = "rbxassetid://114575405055546",
    ["rarity"] = "rare",
    ["cost"] = 1000,
    ["currency_id"] = "cherry_blossoms_2025",
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Spring2025CherryBlossomStickerPack",
    ["tool"] = "StickerPackTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true,
    ["use_existing_rewards"] = {
        {
            ["count"] = 10,
            ["kind"] = "spring_2025_cherry_blossom_sticker_pack"
        }
    },
    ["card_back"] = {
        ["desktop"] = "rbxassetid://73727887368230",
        ["mobile"] = "rbxassetid://130653690676448"
    }
}
v2.spring_2025_cherry_blossom_sticker_pack = v3
local v4 = {
    ["name"] = "Kaijunior Box",
    ["image"] = "rbxassetid://134334086445396",
    ["rarity"] = "legendary",
    ["cost"] = 12000,
    ["currency_id"] = "cherry_blossoms_2025",
    ["anims"] = {
        ["box_opening"] = { "Spring2025KaijuniorBoxOpen1", "Spring2025KaijuniorBoxOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Spring2025KaijuniorBox",
    ["tool"] = "GenericBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.spring_2025_kaijunior_box = v4
return v1(v2)