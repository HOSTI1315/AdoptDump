--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2023.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["halloween_2023_bat_wing_crib"] = {
        ["name"] = "Bat Wing Crib",
        ["cost"] = 132,
        ["model_name"] = "Halloween2023BatWingCrib",
        ["image_id"] = 14849716555
    },
    ["halloween_2023_bat_wing_shelf"] = {
        ["name"] = "Bat Wing Shelf",
        ["cost"] = 38,
        ["model_name"] = "Halloween2023BatWingShelf",
        ["image_id"] = 14849682315
    },
    ["halloween_2023_candelabra_light"] = {
        ["name"] = "Candelabra Light",
        ["cost"] = 52,
        ["model_name"] = "Halloween2023CandelabraLight",
        ["image_id"] = 14849691138
    },
    ["halloween_2023_crystal_ball_pet_bed"] = {
        ["name"] = "Crystal Ball Pet Bed",
        ["cost"] = 282,
        ["model_name"] = "Halloween2023CrystalBallPetBed",
        ["image_id"] = 14849710197
    },
    ["halloween_2023_haunted_house_fridge"] = {
        ["name"] = "Haunted House Fridge",
        ["cost"] = 92,
        ["model_name"] = "Halloween2023HauntedHouseFridge",
        ["image_id"] = 14849686322
    },
    ["halloween_2023_hearse_parent_bed"] = {
        ["name"] = "Hearse Parent Bed",
        ["cost"] = 302,
        ["model_name"] = "Halloween2023HearseParentBed",
        ["image_id"] = 14849727447
    },
    ["halloween_2023_mausoleum_shower"] = {
        ["name"] = "Mausoleum Shower",
        ["cost"] = 172,
        ["model_name"] = "Halloween2023MausoleumShower",
        ["image_id"] = 14849721754
    },
    ["halloween_2023_spider_food_bowl"] = {
        ["name"] = "Spider Food Bowl",
        ["cost"] = 81,
        ["model_name"] = "Halloween2023SpiderFoodBowl",
        ["image_id"] = 14849699498
    },
    ["halloween_2023_spider_water_bowl"] = {
        ["name"] = "Spider Water Bowl",
        ["cost"] = 81,
        ["model_name"] = "Halloween2023SpiderWaterBowl",
        ["image_id"] = 14849751213
    },
    ["halloween_2023_spiderweb_chair"] = {
        ["name"] = "Spiderweb Chair",
        ["cost"] = 32,
        ["model_name"] = "Halloween2023SpiderwebChair",
        ["image_id"] = 14849724136
    },
    ["halloween_2023_spiderweb_corner_piece"] = {
        ["name"] = "Spiderweb Corner Piece",
        ["cost"] = 32,
        ["model_name"] = "Halloween2023SpiderwebCornerPiece",
        ["image_id"] = 14849694438
    },
    ["halloween_2023_spiderweb_shelf"] = {
        ["name"] = "Spiderweb Shelf",
        ["cost"] = 12,
        ["model_name"] = "Halloween2023SpiderwebShelf",
        ["image_id"] = 14849703729
    }
}
for _, v3 in v2 do
    v3.tags = { "HauntedHouse2023" }
end
return v1.furniture(v2)