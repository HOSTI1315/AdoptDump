--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2024.InventorySubDB.Stickers (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper)
local v2 = {
    ["summerfest_2024_show_pony_sticker"] = {
        ["name"] = "Show Pony Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://18202805483",
        ["image_large"] = "rbxassetid://18202544925"
    },
    ["summerfest_2024_punk_pony_sticker"] = {
        ["name"] = "Punk Pony Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://18118991534",
        ["image_large"] = "rbxassetid://18202553585"
    },
    ["summerfest_2024_pretty_pony_sticker"] = {
        ["name"] = "Pretty Pony Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://18202815029",
        ["image_large"] = "rbxassetid://18202553490"
    },
    ["summerfest_2024_majestic_pony_sticker"] = {
        ["name"] = "Majestic Pony Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://18202814798",
        ["image_large"] = "rbxassetid://18202553352"
    },
    ["summerfest_2024_rodeo_bull_sticker"] = {
        ["name"] = "Rodeo Bull Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://18202805238",
        ["image_large"] = "rbxassetid://18202544769"
    },
    ["summerfest_2024_cow_calf_sticker"] = {
        ["name"] = "Cow Calf Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://18202794872",
        ["image_large"] = "rbxassetid://18202524535"
    },
    ["summerfest_2024_orange_betta_fish_sticker"] = {
        ["name"] = "Orange Betta Fish Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://18202804387",
        ["image_large"] = "rbxassetid://18202544239"
    },
    ["summerfest_2024_pink_betta_fish_sticker"] = {
        ["name"] = "Pink Betta Fish Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://18202804665",
        ["image_large"] = "rbxassetid://18202544411"
    },
    ["summerfest_2024_blue_betta_fish_sticker"] = {
        ["name"] = "Blue Betta Fish Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://18202804047",
        ["image_large"] = "rbxassetid://18202544050"
    },
    ["summerfest_2024_kid_goat_sticker"] = {
        ["name"] = "Kid Goat Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://18202804933",
        ["image_large"] = "rbxassetid://18202544625"
    },
    ["summerfest_2024_castle_hermit_crab_sticker"] = {
        ["name"] = "Castle Hermit Crab Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://18202794715",
        ["image_large"] = "rbxassetid://18202524236"
    },
    ["summerfest_2024_happy_clam_sticker"] = {
        ["name"] = "Happy Clam Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://18202794593",
        ["image_large"] = "rbxassetid://18202524032"
    },
    ["summerfest_2024_leopard_shark_sticker"] = {
        ["name"] = "Leopard Shark Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://18202794476",
        ["image_large"] = "rbxassetid://18202523889"
    },
    ["summerfest_2024_tortuga_de_la_isla_sticker"] = {
        ["name"] = "Tortuga de la Isla",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://18202794287",
        ["image_large"] = "rbxassetid://18202514602"
    },
    ["summerfest_2024_balloon_unicorn_sticker"] = {
        ["name"] = "Balloon Unicorn Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://18202794103",
        ["image_large"] = "rbxassetid://18202514430"
    },
    ["summerfest_2024_mini_pig_sticker"] = {
        ["name"] = "Mini Pig Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://18202785164",
        ["image_large"] = "rbxassetid://18202514295"
    },
    ["summerfest_2024_pirate_hermit_crab_sticker"] = {
        ["name"] = "Pirate Hermit Crab Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://18202784923",
        ["image_large"] = "rbxassetid://18202514103"
    },
    ["summerfest_2024_leviathan_sticker"] = {
        ["name"] = "Leviathan Sticker",
        ["rarity"] = "legendary",
        ["image"] = "rbxassetid://18202784706",
        ["image_large"] = "rbxassetid://18202513919"
    },
    ["summerfest_2024_lobster_sticker"] = {
        ["name"] = "Lobster Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://18202784535",
        ["image_large"] = "rbxassetid://18202513740"
    },
    ["summerfest_2024_arctic_tern_sticker"] = {
        ["name"] = "Arctic Tern Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://18202784329",
        ["image_large"] = "rbxassetid://18202534926"
    },
    ["summerfest_2024_hermit_crab_sticker"] = {
        ["name"] = "Hermit Crab Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://18202784103",
        ["image_large"] = "rbxassetid://18202534713"
    },
    ["summerfest_2024_shark_puppy_sticker"] = {
        ["name"] = "Shark Puppy Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://18202773324",
        ["image_large"] = "rbxassetid://18202534496"
    },
    ["summerfest_2024_many_mackerel_sticker"] = {
        ["name"] = "Many Mackerel Sticker",
        ["rarity"] = "uncommon",
        ["image"] = "rbxassetid://18202773157",
        ["image_large"] = "rbxassetid://18202534252"
    },
    ["summerfest_2024_flying_fish_sticker"] = {
        ["name"] = "Flying Fish Sticker",
        ["rarity"] = "common",
        ["image"] = "rbxassetid://18202772984",
        ["image_large"] = "rbxassetid://18202533996"
    },
    ["summerfest_2024_corn_doggo_sticker"] = {
        ["name"] = "Corn Doggo Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://18202772833",
        ["image_large"] = "rbxassetid://18202533779"
    },
    ["summerfest_2024_ice_cream_hermit_crab_sticker"] = {
        ["name"] = "Ice Cream Hermit Crab Sticker",
        ["rarity"] = "rare",
        ["image"] = "rbxassetid://18202772582",
        ["image_large"] = "rbxassetid://18202524995"
    },
    ["summerfest_2024_hot_doggo_sticker"] = {
        ["name"] = "Hot Doggo Sticker",
        ["rarity"] = "ultra_rare",
        ["image"] = "rbxassetid://18202772361",
        ["image_large"] = "rbxassetid://18202524793"
    }
}
for _, v3 in v2 do
    v3.tags = { "pets" }
end
return v1.stickers(v2)