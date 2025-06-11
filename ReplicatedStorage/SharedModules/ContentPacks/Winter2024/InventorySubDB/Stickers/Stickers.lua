--// ReplicatedStorage.SharedModules.ContentPacks.Winter2024.InventorySubDB.Stickers (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).stickers
local v2 = {
    ["winter_2024_snow_globe_sticker"] = {
        ["name"] = "Snow Globe Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://118337227676119",
        ["image_large"] = "rbxassetid://123783324769091",
        ["tags"] = { "pets" }
    },
    ["winter_2024_tree_sasquatch_sticker"] = {
        ["name"] = "Tree Sasquatch Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://112927344208407",
        ["image_large"] = "rbxassetid://88686055228853",
        ["tags"] = { "pets" }
    },
    ["winter_2024_santa_sticker"] = {
        ["name"] = "Santa Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://91982266505611",
        ["image_large"] = "rbxassetid://92839861541483",
        ["tags"] = { "misc" }
    },
    ["winter_2024_robin_sticker"] = {
        ["name"] = "Robin Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://89939908871727",
        ["image_large"] = "rbxassetid://87104727981198",
        ["tags"] = { "pets" }
    },
    ["winter_2024_snowman_sticker"] = {
        ["name"] = "Snowman Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://133620214893912",
        ["image_large"] = "rbxassetid://113027728755391",
        ["tags"] = { "pets" }
    },
    ["winter_2024_christmas_tree_sticker"] = {
        ["name"] = "Christmas Tree Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://127087124839395",
        ["image_large"] = "rbxassetid://106365342962194",
        ["tags"] = { "environment" }
    },
    ["winter_2024_ratatoskr_sticker"] = {
        ["name"] = "Ratatoskr Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://81923904796699",
        ["image_large"] = "rbxassetid://105744204533483",
        ["tags"] = { "pets" }
    },
    ["winter_2024_reindeer_sticker"] = {
        ["name"] = "Reindeer Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://71468995386379",
        ["image_large"] = "rbxassetid://72240005232372",
        ["tags"] = { "pets" }
    },
    ["winter_2024_shetland_pony_dark_brown_sticker"] = {
        ["name"] = "Shetland Pony Dark Brown Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://123200536189409",
        ["image_large"] = "rbxassetid://99645384016457",
        ["tags"] = { "pets" }
    },
    ["winter_2024_nutcracker_squirrel_sticker"] = {
        ["name"] = "Nutcracker Squirrel Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://134771759562690",
        ["image_large"] = "rbxassetid://102602663506842",
        ["tags"] = { "pets" }
    },
    ["winter_2024_santas_throne_sticker"] = {
        ["name"] = "Santa\'s Throne Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://137902344034243",
        ["image_large"] = "rbxassetid://109677044417748",
        ["tags"] = { "misc" }
    },
    ["winter_2024_husky_sticker"] = {
        ["name"] = "Husky Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://118481060542304",
        ["image_large"] = "rbxassetid://139725474015931",
        ["tags"] = { "pets" }
    },
    ["winter_2024_partridge_sticker"] = {
        ["name"] = "Partridge Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://111569992828207",
        ["image_large"] = "rbxassetid://108338536177939",
        ["tags"] = { "pets" }
    },
    ["winter_2024_winter_doe_sticker"] = {
        ["name"] = "Winter Doe Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://102933041580245",
        ["image_large"] = "rbxassetid://111339433461875",
        ["tags"] = { "pets" }
    },
    ["winter_2024_great_pyrenees_sticker"] = {
        ["name"] = "Great Pyrenees Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://82080532239688",
        ["image_large"] = "rbxassetid://103380908255076",
        ["tags"] = { "pets" }
    },
    ["winter_2024_yeti_sticker"] = {
        ["name"] = "Yeti Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://111199681195692",
        ["image_large"] = "rbxassetid://127449709170127",
        ["tags"] = { "pets" }
    },
    ["winter_2024_gingerbread_hare_sticker"] = {
        ["name"] = "Gingerbread Hare Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://118935238876295",
        ["image_large"] = "rbxassetid://99009158619063",
        ["tags"] = { "pets" }
    },
    ["winter_2024_bauble_buddies_sticker"] = {
        ["name"] = "Bauble Buddies Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://83444367112046",
        ["image_large"] = "rbxassetid://77833833827322",
        ["tags"] = { "pets" }
    },
    ["winter_2024_merry_mistletroll_sticker"] = {
        ["name"] = "Merry Mistletroll Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://108859814927944",
        ["image_large"] = "rbxassetid://131287670968973",
        ["tags"] = { "pets" }
    },
    ["winter_2024_peppermint_penguin_sticker"] = {
        ["name"] = "Peppermint Penguin Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://72041267663149",
        ["image_large"] = "rbxassetid://122404923261085",
        ["tags"] = { "pets" }
    },
    ["winter_2024_fairy_bat_dragon_sticker"] = {
        ["name"] = "Fairy Bat Dragon Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://104053074936616",
        ["image_large"] = "rbxassetid://93300249114089",
        ["tags"] = { "pets" }
    },
    ["winter_2024_aurora_fox_sticker"] = {
        ["name"] = "Aurora Fox Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://120634518784643",
        ["image_large"] = "rbxassetid://88068258906657",
        ["tags"] = { "pets" }
    },
    ["winter_2024_naughty_mistletroll_sticker"] = {
        ["name"] = "Naughty Mistletroll Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://106033823650150",
        ["image_large"] = "rbxassetid://85906732129371",
        ["tags"] = { "pets" }
    }
}
local v3 = {
    ["name"] = "Frostclaw Animated Sticker",
    ["rarity"] = "legendary",
    ["image"] = "rbxassetid://80568588373858",
    ["image_large"] = "rbxassetid://118206024951558",
    ["tags"] = { "pets" }
}
local v4 = {
    ["rows"] = 2,
    ["columns"] = 2,
    ["framerate"] = 2,
    ["frame_count"] = 4
}
local v5 = {
    ["icon"] = {
        ["image"] = "rbxassetid://139699424403806",
        ["size"] = Vector2.new(140, 140)
    },
    ["default"] = {
        ["image"] = "rbxassetid://104928584998977",
        ["size"] = Vector2.new(280, 280)
    },
    ["large"] = {
        ["image"] = "rbxassetid://71655336577477",
        ["size"] = Vector2.new(560, 560)
    }
}
v4.sprite_sheets = v5
v3.flipbook_properties = v4
v2.winter_2024_frostclaw_animated_sticker = v3
return v1(v2)