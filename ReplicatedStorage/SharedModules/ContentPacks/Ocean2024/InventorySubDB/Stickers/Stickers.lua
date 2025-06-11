--// ReplicatedStorage.SharedModules.ContentPacks.Ocean2024.InventorySubDB.Stickers (ModuleScript)

local v1 = {
    ["ocean_2024_urchin_sticker"] = {
        ["name"] = "Urchin Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://78593626131848",
        ["image_large"] = "rbxassetid://100828550442879",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_stringray_sticker"] = {
        ["name"] = "Stingray Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://82481043838114",
        ["image_large"] = "rbxassetid://91311226476212",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_cranky_coin_sticker"] = {
        ["name"] = "Cranky Coin Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://123230384446949",
        ["image_large"] = "rbxassetid://86814227428586",
        ["tags"] = { "misc" }
    },
    ["ocean_2024_treasure_chest_sticker"] = {
        ["name"] = "Treasure Chest Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://91301242784408",
        ["image_large"] = "rbxassetid://105829024433687",
        ["tags"] = { "misc" }
    },
    ["ocean_2024_crab_sticker"] = {
        ["name"] = "Crab Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://108008174160068",
        ["image_large"] = "rbxassetid://129303345090646",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_dolphin_sticker"] = {
        ["name"] = "Dolphin Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://121751054557905",
        ["image_large"] = "rbxassetid://98832797835490",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_dracula_fish_sticker"] = {
        ["name"] = "Dracula Fish Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://88401213125620",
        ["image_large"] = "rbxassetid://110341919081796",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_mahi_mahi_sticker"] = {
        ["name"] = "Mahi Mahi Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://135529494302805",
        ["image_large"] = "rbxassetid://131078182250144",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_narwhal_sticker"] = {
        ["name"] = "Narwhal Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://132717979553759",
        ["image_large"] = "rbxassetid://82663003828696",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_sea_angel_sticker"] = {
        ["name"] = "Sea Angel Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://93369301143067",
        ["image_large"] = "rbxassetid://119697138978034",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_wishing_well_sticker"] = {
        ["name"] = "Wishing Well Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://140430891165843",
        ["image_large"] = "rbxassetid://84441328716736",
        ["tags"] = { "misc" }
    },
    ["ocean_2024_white_sand_dollar_sticker"] = {
        ["name"] = "White Sand Dollar Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://119418978450859",
        ["image_large"] = "rbxassetid://136887070091409",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_jellyfish_sticker"] = {
        ["name"] = "Jellyfish Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://107306591532599",
        ["image_large"] = "rbxassetid://91306387703185",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_clownfish_sticker"] = {
        ["name"] = "Clownfish Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://80997419867171",
        ["image_large"] = "rbxassetid://98695673924840",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_lionfish_sticker"] = {
        ["name"] = "Lionfish Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://103854878350883",
        ["image_large"] = "rbxassetid://106910710796356",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_rare_chest_sticker"] = {
        ["name"] = "Rare Chest Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://121219557302694",
        ["image_large"] = "rbxassetid://73650096643658",
        ["tags"] = { "misc" }
    },
    ["ocean_2024_kraken_sticker"] = {
        ["name"] = "Kraken Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://114932650779398",
        ["image_large"] = "rbxassetid://84305754844123",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_octopus_sticker"] = {
        ["name"] = "Octopus Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://98829764392601",
        ["image_large"] = "rbxassetid://103971162400587",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_shark_sticker"] = {
        ["name"] = "Shark Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://97349600429645",
        ["image_large"] = "rbxassetid://119743783651796",
        ["tags"] = { "pets" }
    },
    ["ocean_2024_nautilus_sticker"] = {
        ["name"] = "Nautilus Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://136991470580238",
        ["image_large"] = "rbxassetid://72972441559915",
        ["tags"] = { "pets" }
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).stickers(v1)