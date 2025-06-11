--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.InventorySubDB.Stickers (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper)
local v2 = {
    ["spring_2025_sakura_spirit_sticker"] = {
        ["name"] = "Sakura Spirit Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://122908036294346",
        ["image_large"] = "rbxassetid://101380121967031",
        ["tags"] = { "pets" }
    },
    ["spring_2025_bakeneko_sticker"] = {
        ["name"] = "Bakeneko Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://116002443187648",
        ["image_large"] = "rbxassetid://129732499626957",
        ["tags"] = { "pets" }
    },
    ["spring_2025_kage_crow_sticker"] = {
        ["name"] = "Kage Crow Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://94364881809314",
        ["image_large"] = "rbxassetid://118397553989198",
        ["tags"] = { "pets" }
    },
    ["spring_2025_kappakid_sticker"] = {
        ["name"] = "Kappakid Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://115464350679515",
        ["image_large"] = "rbxassetid://129750727749234",
        ["tags"] = { "pets" }
    },
    ["spring_2025_dotted_eggy_sticker"] = {
        ["name"] = "Dotted Eggy Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://107664364324532",
        ["image_large"] = "rbxassetid://106797627347368",
        ["tags"] = { "pets" }
    },
    ["spring_2025_kaijunior_sticker"] = {
        ["name"] = "Kaijunior Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://78746527160195",
        ["image_large"] = "rbxassetid://131176092764658",
        ["tags"] = { "pets" }
    },
    ["spring_2025_primal_kaijunior_sticker"] = {
        ["name"] = "Primal Kaijunior Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://84187884587789",
        ["image_large"] = "rbxassetid://106231870230253",
        ["tags"] = { "pets" }
    },
    ["spring_2025_toxic_kaijunior_sticker"] = {
        ["name"] = "Toxic Kaijunior Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://136056959582825",
        ["image_large"] = "rbxassetid://80304520267886",
        ["tags"] = { "pets" }
    },
    ["spring_2025_scorching_kaijunior_sticker"] = {
        ["name"] = "Scorching Kaijunior Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://136792094700587",
        ["image_large"] = "rbxassetid://136585867897937",
        ["tags"] = { "pets" }
    },
    ["spring_2025_cabbit_sticker"] = {
        ["name"] = "Cabbit Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://122418304098382",
        ["image_large"] = "rbxassetid://87651961553844",
        ["tags"] = { "pets" }
    },
    ["spring_2025_mecha_rabbit_sticker"] = {
        ["name"] = "Mecha R4BBIT Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://85282770165903",
        ["image_large"] = "rbxassetid://122953437472136",
        ["tags"] = { "pets" }
    },
    ["spring_2025_mirai_moth_sticker"] = {
        ["name"] = "Mirai Moth Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://81427610374588",
        ["image_large"] = "rbxassetid://91834769215018",
        ["tags"] = { "pets" }
    },
    ["spring_2025_cherry_blossom_tree"] = {
        ["name"] = "Cherry Blossom Tree Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://113943322925119",
        ["image_large"] = "rbxassetid://128434113914317",
        ["tags"] = { "misc" }
    },
    ["spring_2025_cherry_blossom_flower_sticker"] = {
        ["name"] = "Cherry Blossom Flower Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://103497728507147",
        ["image_large"] = "rbxassetid://117416104884588",
        ["tags"] = { "misc" }
    },
    ["spring_2025_easter_egg_sticker"] = {
        ["name"] = "Easter Egg Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://128188711930467",
        ["image_large"] = "rbxassetid://104652498940808",
        ["tags"] = { "misc" }
    },
    ["spring_2025_egg_basket_sticker"] = {
        ["name"] = "Egg Basket Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://134709874029680",
        ["image_large"] = "rbxassetid://75957209204660",
        ["tags"] = { "misc" }
    },
    ["spring_2025_flower_power_duckling_sticker"] = {
        ["name"] = "Flower Power Duckling Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://83618068204274",
        ["image_large"] = "rbxassetid://84403372112150",
        ["tags"] = { "pets" }
    },
    ["spring_2025_candyfloss_chick_sticker"] = {
        ["name"] = "Candyfloss Chick Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://134137780645716",
        ["image_large"] = "rbxassetid://112687550589749",
        ["tags"] = { "pets" }
    },
    ["spring_2025_hang_glider_sticker"] = {
        ["name"] = "Hang Glider Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://99664153762697",
        ["image_large"] = "rbxassetid://83026643917940",
        ["tags"] = { "misc" }
    },
    ["spring_2025_wood_pigeon_sticker"] = {
        ["name"] = "Wood Pigeon Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://95672818316500",
        ["image_large"] = "rbxassetid://95530234780676",
        ["tags"] = { "pets" }
    }
}
local v3 = {
    ["name"] = "Super Saru Animated Sticker",
    ["image"] = "rbxassetid://16912127218",
    ["rarity"] = "legendary",
    ["tags"] = { "pets" }
}
local v4 = {
    ["rows"] = 5,
    ["columns"] = 4,
    ["framerate"] = 2,
    ["frame_count"] = 20
}
local v5 = {
    ["icon"] = {
        ["image"] = "rbxassetid://87450305049684",
        ["size"] = Vector2.new(280, 350)
    },
    ["default"] = {
        ["image"] = "rbxassetid://71815254624524",
        ["size"] = Vector2.new(560, 700)
    },
    ["large"] = {
        ["image"] = "rbxassetid://118646696665874",
        ["size"] = Vector2.new(800, 1000)
    }
}
v4.sprite_sheets = v5
v3.flipbook_properties = v4
v2.spring_2025_super_saru_sticker = v3
return v1.stickers(v2)