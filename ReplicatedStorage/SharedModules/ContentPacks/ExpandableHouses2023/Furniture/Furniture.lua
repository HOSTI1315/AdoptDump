--// ReplicatedStorage.SharedModules.ContentPacks.ExpandableHouses2023.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["expandable_houses_2023_luxury_crib"] = {
        ["name"] = "Luxury Crib",
        ["cost"] = 375,
        ["model_name"] = "ExpandableHouses2023LuxuryCrib",
        ["image_id"] = 14464422679
    },
    ["expandable_houses_2023_luxury_spa_shower"] = {
        ["name"] = "Luxury Spa Shower",
        ["cost"] = 400,
        ["model_name"] = "ExpandableHouses2023LuxurySpaShower",
        ["image_id"] = 14464423147
    },
    ["expandable_houses_2023_luxury_mini_fridge"] = {
        ["name"] = "Luxury Mini Fridge",
        ["cost"] = 32,
        ["model_name"] = "ExpandableHouses2023LuxuryMiniFridge",
        ["image_id"] = 14464421204
    },
    ["expandable_houses_2023_luxury_food_and_water_bowl"] = {
        ["name"] = "Luxury Food and Water Bowl",
        ["cost"] = 230,
        ["model_name"] = "ExpandableHouses2023LuxuryFoodAndWaterBowl",
        ["image_id"] = 14464420175
    },
    ["expandable_houses_2023_luxury_pet_bed"] = {
        ["name"] = "Luxury Pet Bed",
        ["cost"] = 310,
        ["model_name"] = "ExpandableHouses2023LuxuryPetBed",
        ["image_id"] = 14464422043
    },
    ["expandable_houses_2023_luxury_ceiling_light"] = {
        ["name"] = "Single Luxury Ceiling Light",
        ["cost"] = 37,
        ["model_name"] = "ExpandableHouses2023LuxuryCeilingLight",
        ["image_id"] = 14464487291
    },
    ["expandable_houses_2023_luxury_ceiling_lights"] = {
        ["name"] = "Abstract Luxury Ceiling Lights",
        ["cost"] = 47,
        ["model_name"] = "ExpandableHouses2023LuxuryCeilingLights",
        ["image_id"] = 14464487835
    },
    ["expandable_houses_2023_luxury_wall_art"] = {
        ["name"] = "Luxury Wall Art",
        ["cost"] = 300,
        ["model_name"] = "ExpandableHouses2023LuxuryWallArt",
        ["image_id"] = 14464488398
    },
    ["expandable_houses_2023_luxury_rug_1"] = {
        ["name"] = "Simple Luxury Rug",
        ["cost"] = 35,
        ["model_name"] = "ExpandableHouses2023LuxuryRug1",
        ["image_id"] = 14464488863
    },
    ["expandable_houses_2023_luxury_rug_2"] = {
        ["name"] = "Luxury Patterned Rug",
        ["cost"] = 39,
        ["model_name"] = "ExpandableHouses2023LuxuryRug2",
        ["image_id"] = 14464489442
    },
    ["expandable_houses_2023_luxury_bed"] = {
        ["name"] = "Luxury Bed",
        ["cost"] = 345,
        ["model_name"] = "ExpandableHouses2023LuxuryBed",
        ["image_id"] = 14464490177
    },
    ["expandable_houses_2023_luxury_small_picture_frame"] = {
        ["name"] = "Small Picture Frame",
        ["cost"] = 3,
        ["model_name"] = "ExpandableHouses2023LuxurySmallPictureFrame",
        ["image_id"] = 14464492643
    },
    ["expandable_houses_2023_luxury_medium_picture_frame"] = {
        ["name"] = "Medium Picture Frame",
        ["cost"] = 4,
        ["model_name"] = "ExpandableHouses2023LuxuryMediumPictureFrame",
        ["image_id"] = 14464491904
    },
    ["expandable_houses_2023_luxury_large_picture_frame"] = {
        ["name"] = "Large Picture Frame",
        ["cost"] = 6,
        ["model_name"] = "ExpandableHouses2023LuxuryLargePictureFrame",
        ["image_id"] = 14464493308
    },
    ["expandable_houses_2023_luxury_shelf"] = {
        ["name"] = "Luxury Shelf",
        ["cost"] = 46,
        ["model_name"] = "ExpandableHouses2023LuxuryShelf",
        ["image_id"] = 14464494044
    },
    ["expandable_houses_2023_luxury_framed_art_1"] = {
        ["name"] = "Luxury Framed Zig Zag Art",
        ["cost"] = 99,
        ["model_name"] = "ExpandableHouses2023LuxuryFramedArt1",
        ["image_id"] = 14464494800
    },
    ["expandable_houses_2023_luxury_framed_art_2"] = {
        ["name"] = "Luxury Framed Lines Art",
        ["cost"] = 99,
        ["model_name"] = "ExpandableHouses2023LuxuryFramedArt2",
        ["image_id"] = 14464495895
    },
    ["expandable_houses_2023_luxury_framed_art_3"] = {
        ["name"] = "Luxury Framed Square Art",
        ["cost"] = 99,
        ["model_name"] = "ExpandableHouses2023LuxuryFramedArt3",
        ["image_id"] = 14464496834
    },
    ["expandable_houses_2023_luxury_wall_light"] = {
        ["name"] = "Wall Light",
        ["cost"] = 16,
        ["model_name"] = "ExpandableHouses2023LuxuryWallLight",
        ["image_id"] = 14464497598
    },
    ["expandable_houses_2023_luxury_cinema_screen"] = {
        ["name"] = "Home Cinema Screen",
        ["cost"] = 145,
        ["model_name"] = "ExpandableHouses2023LuxuryCinemaScreen",
        ["image_id"] = 14464498178
    },
    ["expandable_houses_2023_luxury_cinema_speaker"] = {
        ["name"] = "Home Cinema Speaker",
        ["cost"] = 57,
        ["model_name"] = "ExpandableHouses2023LuxuryCinemaSpeaker",
        ["image_id"] = 14464498703
    },
    ["expandable_houses_2023_luxury_cabinet"] = {
        ["name"] = "Luxury Cabinet",
        ["cost"] = 62,
        ["model_name"] = "ExpandableHouses2023LuxuryCabinet",
        ["image_id"] = 14464499841
    },
    ["expandable_houses_2023_luxury_plant_pot"] = {
        ["name"] = "Luxury Plant Pot",
        ["cost"] = 59,
        ["model_name"] = "ExpandableHouses2023LuxuryPlantPot",
        ["image_id"] = 14464500532
    },
    ["expandable_houses_2023_luxury_shelves"] = {
        ["name"] = "Three Tiered Luxury Shelves",
        ["cost"] = 43,
        ["model_name"] = "ExpandableHouses2023LuxuryShelves",
        ["image_id"] = 14464501109
    },
    ["expandable_houses_2023_luxury_picture_frame"] = {
        ["name"] = "Luxury Picture Frame",
        ["cost"] = 4,
        ["model_name"] = "ExpandableHouses2023LuxuryPictureFrame",
        ["image_id"] = 14464501642
    },
    ["expandable_houses_2023_luxury_book_collection"] = {
        ["name"] = "Luxury Book Collection",
        ["cost"] = 7,
        ["model_name"] = "ExpandableHouses2023LuxuryBookCollection",
        ["image_id"] = 14464502151
    },
    ["expandable_houses_2023_luxury_small_plant"] = {
        ["name"] = "Luxury Small Plant",
        ["cost"] = 23,
        ["model_name"] = "ExpandableHouses2023LuxurySmallPlant",
        ["image_id"] = 14464502671
    },
    ["expandable_houses_2023_luxury_cacti"] = {
        ["name"] = "Small Luxury Cactus",
        ["cost"] = 21,
        ["model_name"] = "ExpandableHouses2023LuxuryCacti1",
        ["image_id"] = 14464503337
    },
    ["expandable_houses_2023_luxury_cacti_2"] = {
        ["name"] = "Large Luxury Cactus",
        ["cost"] = 29,
        ["model_name"] = "ExpandableHouses2023LuxuryCacti2",
        ["image_id"] = 14464504103
    },
    ["expandable_houses_2023_luxury_center_speaker"] = {
        ["name"] = "Center Speaker",
        ["cost"] = 11,
        ["model_name"] = "ExpandableHouses2023LuxuryCenterSpeaker",
        ["image_id"] = 14464504712
    },
    ["expandable_houses_2023_luxury_subwoofer"] = {
        ["name"] = "Subwoofer",
        ["cost"] = 12,
        ["model_name"] = "ExpandableHouses2023LuxurySubwoofer",
        ["image_id"] = 14464505899
    },
    ["expandable_houses_2023_luxury_rear_speaker"] = {
        ["name"] = "Rear Speaker",
        ["cost"] = 13,
        ["model_name"] = "ExpandableHouses2023LuxuryRearSpeaker",
        ["image_id"] = 14464506429
    },
    ["expandable_houses_2023_luxury_large_side_speaker"] = {
        ["name"] = "Large Side Speaker",
        ["cost"] = 21,
        ["model_name"] = "ExpandableHouses2023LuxuryLargeSideSpeaker",
        ["image_id"] = 14464506958
    }
}
local v3 = {
    ["expandable_houses_2023_hillside_minimalist_painting"] = {
        ["name"] = "Minimalist Painting",
        ["cost"] = 75,
        ["model_name"] = "ExpandableHouses2023HillsideMinimalistPainting",
        ["image_id"] = 14464638333
    },
    ["expandable_houses_2023_hillside_minimalist_rug"] = {
        ["name"] = "Minimalist Rug",
        ["cost"] = 18,
        ["model_name"] = "ExpandableHouses2023HillsideMinimalistRug",
        ["image_id"] = 14464637635
    },
    ["expandable_houses_2023_hillside_steel_fridge"] = {
        ["name"] = "Steel Fridge",
        ["cost"] = 185,
        ["model_name"] = "ExpandableHouses2023HillsideSteelFridge",
        ["image_id"] = 14464636166
    },
    ["expandable_houses_2023_hillside_spiral_shower"] = {
        ["name"] = "Spiral Shower",
        ["cost"] = 215,
        ["model_name"] = "ExpandableHouses2023HillsideSpiralShower",
        ["image_id"] = 14464641952
    },
    ["expandable_houses_2023_hillside_canopy_parent_bed"] = {
        ["name"] = "Canopy Parent Bed",
        ["cost"] = 220,
        ["model_name"] = "ExpandableHouses2023HillsideCanopyParentBed",
        ["image_id"] = 14464640378
    },
    ["expandable_houses_2023_hillside_spiral_ceiling_light"] = {
        ["name"] = "Spiral Ceiling Light",
        ["cost"] = 46,
        ["model_name"] = "ExpandableHouses2023HillsideSpiralCeilingLight",
        ["image_id"] = 14464636926
    },
    ["expandable_houses_2023_hillside_canopy_crib"] = {
        ["name"] = "Canopy Crib",
        ["cost"] = 205,
        ["model_name"] = "ExpandableHouses2023HillsideCanopyCrib",
        ["image_id"] = 14464641038
    },
    ["expandable_houses_2023_hillside_pet_bed"] = {
        ["name"] = "Hillside Pet Bed",
        ["cost"] = 220,
        ["model_name"] = "ExpandableHouses2023HillsidePetBed",
        ["image_id"] = 14464639297
    },
    ["expandable_houses_2023_hillside_food_and_water"] = {
        ["name"] = "Hillside Food and Water Bowl",
        ["cost"] = 225,
        ["model_name"] = "ExpandableHouses2023HillsideFoodAndWaterBowl",
        ["image_id"] = 14464639771
    }
}
local v4 = {
    ["expandable_houses_2023_friendly_water_bowl"] = {
        ["name"] = "Friendly Water Bowl",
        ["cost"] = 76,
        ["model_name"] = "ExpandableHouses2023FriendlyWaterBowl",
        ["image_id"] = 14464398158
    },
    ["expandable_houses_2023_friendly_three_seater_sofa"] = {
        ["name"] = "Friendly Three Seater Sofa",
        ["cost"] = 89,
        ["model_name"] = "ExpandableHouses2023FriendlySofa3",
        ["image_id"] = 14464399477
    },
    ["expandable_houses_2023_friendly_two_seater_sofa"] = {
        ["name"] = "Friendly Two Seater Sofa",
        ["cost"] = 63,
        ["model_name"] = "ExpandableHouses2023FriendlySofa2",
        ["image_id"] = 14464399880
    },
    ["expandable_houses_2023_friendly_sofa_chair"] = {
        ["name"] = "Friendly Sofa Chair",
        ["cost"] = 31,
        ["model_name"] = "ExpandableHouses2023FriendlySofa1",
        ["image_id"] = 14464400200
    },
    ["expandable_houses_2023_friendly_pet_bed"] = {
        ["name"] = "Friendly Pet Bed",
        ["cost"] = 121,
        ["model_name"] = "ExpandableHouses2023FriendlyPetBed",
        ["image_id"] = 14464397161
    },
    ["expandable_houses_2023_friendly_food_bowl"] = {
        ["name"] = "Friendly Food Bowl",
        ["cost"] = 76,
        ["model_name"] = "ExpandableHouses2023FriendlyFoodBowl",
        ["image_id"] = 14464398807
    },
    ["expandable_houses_2023_friendly_crib"] = {
        ["name"] = "Friendly Crib",
        ["cost"] = 22,
        ["model_name"] = "ExpandableHouses2023FriendlyCrib",
        ["image_id"] = 14464396609
    },
    ["expandable_houses_2023_friendly_bed"] = {
        ["name"] = "Friendly Bed",
        ["cost"] = 18,
        ["model_name"] = "ExpandableHouses2023FriendlyBed",
        ["image_id"] = 14464395980
    }
}
local v5 = {}
for v6, v7 in v2 do
    v7.tags = { "ExpandableHouses2023", "ExpandableHouses2023Luxury" }
    v5[v6] = v7
end
for v8, v9 in v3 do
    v9.tags = { "ExpandableHouses2023", "ExpandableHouses2023Hillside" }
    v5[v8] = v9
end
for v10, v11 in v4 do
    v11.tags = { "ExpandableHouses2023", "ExpandableHouses2023Friendly" }
    v5[v10] = v11
end
return v1.furniture(v5)