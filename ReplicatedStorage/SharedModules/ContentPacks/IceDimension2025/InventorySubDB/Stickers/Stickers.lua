--// ReplicatedStorage.SharedModules.ContentPacks.IceDimension2025.InventorySubDB.Stickers (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper)
local v2 = {
    ["ice_dimension_2025_snowy_mammoth_sticker"] = {
        ["name"] = "Snowy Mammoth Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://118495689557227",
        ["image_large"] = "rbxassetid://100992070263225",
        ["tags"] = { "pets" }
    },
    ["ice_dimension_2025_chilly_penguin_sticker"] = {
        ["name"] = "Frozen Penguin Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://91937071122078",
        ["image_large"] = "rbxassetid://111698173330358",
        ["tags"] = { "pets" }
    },
    ["ice_dimension_2025_icy_porcupine_sticker"] = {
        ["name"] = "Icy Porcupine Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://123942378334220",
        ["image_large"] = "rbxassetid://119656479279956",
        ["tags"] = { "pets" }
    },
    ["ice_dimension_2025_frostbite_bear_sticker"] = {
        ["name"] = "Frostbite Bear Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://109446247575556",
        ["image_large"] = "rbxassetid://80393622689860",
        ["tags"] = { "pets" }
    },
    ["ice_dimension_2025_subzero_scorpion_sticker"] = {
        ["name"] = "Subzero Scorpion Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://98035840440315",
        ["image_large"] = "rbxassetid://113793243737922",
        ["tags"] = { "pets" }
    },
    ["ice_dimension_2025_shiver_wolf_sticker"] = {
        ["name"] = "Shiver Wolf Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://105754797516720",
        ["image_large"] = "rbxassetid://133777663288026",
        ["tags"] = { "pets" }
    },
    ["ice_dimension_2025_ice_dimension_portal_sticker"] = {
        ["name"] = "Ice Dimension Portal Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://80459825394846",
        ["image_large"] = "rbxassetid://120120977875795",
        ["tags"] = { "environment" }
    },
    ["ice_dimension_2025_cold_tim_sticker"] = {
        ["name"] = "Cold Tim Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://116900116530723",
        ["image_large"] = "rbxassetid://125946462725457",
        ["tags"] = { "misc" }
    }
}
local v3 = {
    ["name"] = "Frostbite Bear and Cub Animated Sticker",
    ["rarity"] = "legendary",
    ["image"] = "rbxassetid://108338256264009",
    ["image_large"] = "rbxassetid://72048630932894",
    ["tags"] = { "pets" }
}
local v4 = {
    ["rows"] = 1,
    ["columns"] = 3,
    ["framerate"] = 1,
    ["frame_count"] = 3
}
local v5 = {
    ["icon"] = {
        ["image"] = "rbxassetid://128834180545108",
        ["size"] = Vector2.new(210, 70)
    },
    ["default"] = {
        ["image"] = "rbxassetid://84593023808169",
        ["size"] = Vector2.new(420, 140)
    },
    ["large"] = {
        ["image"] = "rbxassetid://77148976351324",
        ["size"] = Vector2.new(840, 280)
    }
}
v4.sprite_sheets = v5
v3.flipbook_properties = v4
v2.ice_dimension_2025_frostbite_bear_and_cub_animated_sticker = v3
v2.ice_dimension_2025_ash_zebra_sticker = {
    ["name"] = "Ash Zebra Sticker",
    ["rarity"] = "common",
    ["image"] = "rbxassetid://103167880302657",
    ["image_large"] = "rbxassetid://134624669319557",
    ["tags"] = { "pets" }
}
v2.ice_dimension_2025_campfire_cookies_bait_sticker = {
    ["name"] = "Campfire Cookies Bait Sticker",
    ["rarity"] = "common",
    ["image"] = "rbxassetid://87990666070572",
    ["image_large"] = "rbxassetid://134260183090438",
    ["tags"] = { "misc" }
}
v2.ice_dimension_2025_fire_dimension_portal_sticker = {
    ["name"] = "Fire Dimension Portal Sticker",
    ["rarity"] = "uncommon",
    ["image"] = "rbxassetid://76596819998546",
    ["image_large"] = "rbxassetid://91211674351167",
    ["tags"] = { "environment" }
}
v2.ice_dimension_2025_magma_snail_sticker = {
    ["name"] = "Magma Snail Sticker",
    ["rarity"] = "uncommon",
    ["image"] = "rbxassetid://77756029095713",
    ["image_large"] = "rbxassetid://138438179050751",
    ["tags"] = { "pets" }
}
v2.ice_dimension_2025_flaming_zebra_sticker = {
    ["name"] = "Flaming Zebra Sticker",
    ["rarity"] = "rare",
    ["image"] = "rbxassetid://122361738574693",
    ["image_large"] = "rbxassetid://107967047535229",
    ["tags"] = { "pets" }
}
v2.ice_dimension_2025_burning_bunny_sticker = {
    ["name"] = "Burning Bunny Sticker",
    ["rarity"] = "rare",
    ["image"] = "rbxassetid://117373571510062",
    ["image_large"] = "rbxassetid://89950454448104",
    ["tags"] = { "pets" }
}
v2.ice_dimension_2025_magma_moose_sticker = {
    ["name"] = "Magma Moose Sticker",
    ["rarity"] = "ultra_rare",
    ["image"] = "rbxassetid://125795126180933",
    ["image_large"] = "rbxassetid://81178540876738",
    ["tags"] = { "pets" }
}
v2.ice_dimension_2025_wildfire_hawk_sticker = {
    ["name"] = "Wildfire Hawk Sticker",
    ["rarity"] = "ultra_rare",
    ["image"] = "rbxassetid://137463322175076",
    ["image_large"] = "rbxassetid://89894704283772",
    ["tags"] = { "pets" }
}
v2.ice_dimension_2025_christmas_pudding_pup_sticker = {
    ["name"] = "Christmas Pudding Pup Sticker",
    ["rarity"] = "ultra_rare",
    ["image"] = "rbxassetid://83638290354066",
    ["image_large"] = "rbxassetid://103163543161191",
    ["tags"] = { "pets" }
}
v2.ice_dimension_2025_flaming_fox_sticker = {
    ["name"] = "Flaming Fox Sticker",
    ["rarity"] = "legendary",
    ["image"] = "rbxassetid://136986193453106",
    ["image_large"] = "rbxassetid://76115084131530",
    ["tags"] = { "pets" }
}
v2.ice_dimension_2025_toasty_red_panda_sticker = {
    ["name"] = "Toasty Red Panda Sticker",
    ["rarity"] = "legendary",
    ["image"] = "rbxassetid://101739833132043",
    ["image_large"] = "rbxassetid://101096249142826",
    ["tags"] = { "pets" }
}
v2.ice_dimension_2025_volcanic_rhino_sticker = {
    ["name"] = "Volcanic Rhino Sticker",
    ["rarity"] = "legendary",
    ["image"] = "rbxassetid://101610750219060",
    ["image_large"] = "rbxassetid://122161035956109",
    ["tags"] = { "pets" }
}
local v6 = {
    ["name"] = "Blazing Lion Animated Sticker",
    ["rarity"] = "legendary",
    ["image"] = "rbxassetid://97423304136293",
    ["image_large"] = "rbxassetid://110368296143069",
    ["tags"] = { "pets" }
}
local v7 = {
    ["rows"] = 1,
    ["columns"] = 2,
    ["framerate"] = 1,
    ["frame_count"] = 2
}
local v8 = {
    ["icon"] = {
        ["image"] = "rbxassetid://72236666804730",
        ["size"] = Vector2.new(140, 70)
    },
    ["default"] = {
        ["image"] = "rbxassetid://123878970482861",
        ["size"] = Vector2.new(280, 140)
    },
    ["large"] = {
        ["image"] = "rbxassetid://99055435383707",
        ["size"] = Vector2.new(560, 280)
    }
}
v7.sprite_sheets = v8
v6.flipbook_properties = v7
v2.ice_dimension_2025_blazing_lion_animated_sticker = v6
return v1.stickers(v2)