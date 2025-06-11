--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2024.InventorySubDB.Stickers (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper)
local v2 = {
    ["halloween_2024_trick_or_treat_basket_sticker"] = {
        ["name"] = "Trick or Treat Basket Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://105821557150265",
        ["image_large"] = "rbxassetid://134737345688783",
        ["tags"] = { "misc" }
    },
    ["halloween_2024_frankenfeline_sticker"] = {
        ["name"] = "Frankenfeline Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://128860201161481",
        ["image_large"] = "rbxassetid://76536643943124",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_chickatrice_sticker"] = {
        ["name"] = "Chickatrice Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://112700793860656",
        ["image_large"] = "rbxassetid://120153123987706",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_slug_sticker"] = {
        ["name"] = "Slug Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://85894426445712",
        ["image_large"] = "rbxassetid://127111447079278",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_scarecrow_sticker"] = {
        ["name"] = "Scarecrow Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://120332953645827",
        ["image_large"] = "rbxassetid://137290209030987",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_sea_skeleton_panda_sticker"] = {
        ["name"] = "Sea Skeleton Panda Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://99961968175742",
        ["image_large"] = "rbxassetid://139383087406912",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_cuteacabra_sticker"] = {
        ["name"] = "Cute-A-Cabra Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://117962539866209",
        ["image_large"] = "rbxassetid://113033439081447",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_bat_sticker"] = {
        ["name"] = "Bat Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://96485807517268",
        ["image_large"] = "rbxassetid://133384216052887",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_white_skeleton_dog_sticker"] = {
        ["name"] = "White Skeleton Dog Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://122967027672786",
        ["image_large"] = "rbxassetid://132471960156757",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_ghost_bunny_sticker"] = {
        ["name"] = "Ghost Bunny Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://122707565839470",
        ["image_large"] = "rbxassetid://101744434952054",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_marabou_stork_sticker"] = {
        ["name"] = "Marabou Stork Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://111065009975153",
        ["image_large"] = "rbxassetid://79453067874816",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_basilisk_sticker"] = {
        ["name"] = "Basilisk Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://106734329503323",
        ["image_large"] = "rbxassetid://72066233402541",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_indian_flying_fox_sticker"] = {
        ["name"] = "Indian Flying Fox Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://78959068325316",
        ["image_large"] = "rbxassetid://137388354695503",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_zombie_wolf_sticker"] = {
        ["name"] = "Zombie Wolf Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://136582347239558",
        ["image_large"] = "rbxassetid://79056389367800",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_slime_sticker"] = {
        ["name"] = "Slime Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://92077877925969",
        ["image_large"] = "rbxassetid://84129382906401",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_ghost_sticker"] = {
        ["name"] = "Ghost Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://128029370569486",
        ["image_large"] = "rbxassetid://75926731076760",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_jousting_horse_sticker"] = {
        ["name"] = "Jousting Horse Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://105864654927572",
        ["image_large"] = "rbxassetid://109790541966157",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_scarebear_sticker"] = {
        ["name"] = "Scarebear Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://80091804466789",
        ["image_large"] = "rbxassetid://77071284320304",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_evil_unicorn_sticker"] = {
        ["name"] = "Evil Unicorn Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://111172162859333",
        ["image_large"] = "rbxassetid://82229065838535",
        ["tags"] = { "pets" }
    },
    ["halloween_2024_grim_dragon_sticker"] = {
        ["name"] = "Grim Dragon Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://117394111017666",
        ["image_large"] = "rbxassetid://75484736589166",
        ["tags"] = { "pets" }
    }
}
local v3 = {
    ["name"] = "Jekyll Hydra Animated Sticker",
    ["rarity"] = "legendary",
    ["image"] = "rbxassetid://117108915249229",
    ["image_large"] = "rbxassetid://115725940915573",
    ["tags"] = { "pets" }
}
local v4 = {
    ["rows"] = 2,
    ["columns"] = 2,
    ["framerate"] = 1,
    ["frame_count"] = 4
}
local v5 = {
    ["icon"] = {
        ["image"] = "rbxassetid://123117097884524",
        ["size"] = Vector2.new(140, 140)
    },
    ["default"] = {
        ["image"] = "rbxassetid://117934220177793",
        ["size"] = Vector2.new(280, 280)
    },
    ["large"] = {
        ["image"] = "rbxassetid://119408722627994",
        ["size"] = Vector2.new(560, 560)
    }
}
v4.sprite_sheets = v5
v3.flipbook_properties = v4
v2.halloween_2024_jekyll_hydra_animated_sticker = v3
return v1.stickers(v2)