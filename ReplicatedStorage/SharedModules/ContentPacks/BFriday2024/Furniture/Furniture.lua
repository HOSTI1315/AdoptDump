--// ReplicatedStorage.SharedModules.ContentPacks.BFriday2024.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("EntryHelper")
local v3 = v1("FurnitureUseHelperDB")
local v4 = v1("package:Sift")
local v5 = {
    ["winter_2024_pet_potty"] = {
        ["name"] = "Winter Pet Potty",
        ["cost"] = 70,
        ["model_name"] = "Winter2024PetPotty",
        ["image_id"] = 139269566023837
    },
    ["winter_2024_fridge"] = {
        ["name"] = "Winter Fridge",
        ["cost"] = 105,
        ["model_name"] = "Winter2024Fridge",
        ["image_id"] = 76787561740929
    },
    ["winter_2024_pet_bed"] = {
        ["name"] = "Winter Pet Bed",
        ["cost"] = 195,
        ["model_name"] = "Winter2024PetBed",
        ["image_id"] = 89985287143950
    },
    ["winter_2024_parent_bed"] = {
        ["name"] = "Winter Parent Bed",
        ["cost"] = 415,
        ["model_name"] = "Winter2024ParentBed",
        ["image_id"] = 91929146423150
    },
    ["winter_2024_crib"] = {
        ["name"] = "Winter Crib",
        ["cost"] = 187,
        ["model_name"] = "Winter2024Crib",
        ["image_id"] = 117640773981935
    },
    ["winter_2024_food_bowl"] = {
        ["name"] = "Winter Food Bowl",
        ["cost"] = 83,
        ["model_name"] = "Winter2024FoodBowl",
        ["image_id"] = 98503906834503
    },
    ["winter_2024_water_bowl"] = {
        ["name"] = "Winter Water Bowl",
        ["cost"] = 83,
        ["model_name"] = "Winter2024WaterBowl",
        ["image_id"] = 101562482117001
    },
    ["winter_2024_shower"] = {
        ["name"] = "Winter Shower",
        ["cost"] = 192,
        ["model_name"] = "Winter2024Shower",
        ["image_id"] = 79024745582339
    },
    ["winter_2024_chair"] = {
        ["name"] = "Winter Chair",
        ["cost"] = 107,
        ["model_name"] = "Winter2024Chair",
        ["image_id"] = 114732357493107
    },
    ["winter_2024_table"] = {
        ["name"] = "Winter Table",
        ["cost"] = 175,
        ["model_name"] = "Winter2024Table",
        ["image_id"] = 76457449190032
    },
    ["winter_2024_garland"] = {
        ["name"] = "Winter Garland",
        ["cost"] = 55,
        ["model_name"] = "Winter2024Garland",
        ["image_id"] = 80183857148335
    },
    ["winter_2024_poinsettia"] = {
        ["name"] = "Winter Poinsettia",
        ["cost"] = 46,
        ["model_name"] = "Winter2024Poinsettia",
        ["image_id"] = 130129226923367
    },
    ["winter_2024_candle"] = {
        ["name"] = "Winter Candle",
        ["cost"] = 37,
        ["model_name"] = "Winter2024Candle",
        ["image_id"] = 119632907083401
    },
    ["winter_2024_lights"] = {
        ["name"] = "Winter Lights",
        ["cost"] = 95,
        ["model_name"] = "Winter2024Lights",
        ["image_id"] = 133973276351883
    },
    ["winter_2024_bunting"] = {
        ["name"] = "Winter Bunting",
        ["cost"] = 57,
        ["model_name"] = "Winter2024Bunting",
        ["image_id"] = 105976830204152
    },
    ["winter_2024_snow_globe_display_stand"] = {
        ["name"] = "Snow Globe Display Stand",
        ["cost"] = 2500,
        ["model_name"] = "Winter2024SnowGlobeDisplayStand",
        ["image_id"] = 110457493312595,
        ["tags"] = { "DisplayStand", "Stand", "Winter2024" },
        ["behavior"] = v3.DISPLAY_STAND("pet")
    },
    ["winter_2024_snowflake_rug"] = {
        ["name"] = "Winter Snowflake Rug",
        ["cost"] = 210,
        ["model_name"] = "Winter2024SnowflakeRug",
        ["image_id"] = 118795157135464
    },
    ["winter_2024_holiday_wreath"] = {
        ["name"] = "Winter Holiday Wreath",
        ["cost"] = 105,
        ["model_name"] = "Winter2024HolidayWreath",
        ["image_id"] = 121692504151919
    }
}
local v6 = {
    ["plants_2024_swiss_cheese_1"] = {
        ["name"] = "Swiss Cheese Plant 1",
        ["cost"] = 24,
        ["model_name"] = "Plants2024SwissCheese1",
        ["image_id"] = 94763148427302
    },
    ["plants_2024_swiss_cheese_2"] = {
        ["name"] = "Swiss Cheese Plant 2",
        ["cost"] = 54,
        ["model_name"] = "Plants2024SwissCheese2",
        ["image_id"] = 89006068876241
    },
    ["plants_2024_flamingo_flower"] = {
        ["name"] = "Flamingo Flower",
        ["cost"] = 60,
        ["model_name"] = "Plants2024FlamingoFlower",
        ["image_id"] = 106467966625454
    },
    ["plants_2024_kentai_palm"] = {
        ["name"] = "Kentai Palm",
        ["cost"] = 31,
        ["model_name"] = "Plants2024KentaiPalm",
        ["image_id"] = 70458972446148
    },
    ["plants_2024_snake_plant"] = {
        ["name"] = "Snake Plant",
        ["cost"] = 37,
        ["model_name"] = "Plants2024SnakePlant",
        ["image_id"] = 99465758938150
    },
    ["plants_2024_outdoor_plant_1"] = {
        ["name"] = "Outdoor Plant 1",
        ["cost"] = 13,
        ["model_name"] = "Plants2024OutdoorPlant1",
        ["image_id"] = 103654058511757
    },
    ["plants_2024_outdoor_plant_2"] = {
        ["name"] = "Outdoor Plant 2",
        ["cost"] = 15,
        ["model_name"] = "Plants2024OutdoorPlant2",
        ["image_id"] = 93509908917548
    },
    ["plants_2024_peace_lilly"] = {
        ["name"] = "Peace Lilly",
        ["cost"] = 40,
        ["model_name"] = "Plants2024PeaceLilly",
        ["image_id"] = 87608372337154
    },
    ["plants_2024_outdoor_plant_3"] = {
        ["name"] = "Outdoor Plant 3",
        ["cost"] = 17,
        ["model_name"] = "Plants2024OutdoorPlant3",
        ["image_id"] = 125103177186149
    },
    ["plants_2024_hanging_ivy_large"] = {
        ["name"] = "Hanging Ivy Large",
        ["cost"] = 32,
        ["model_name"] = "Plants2024HangingIvyLarge",
        ["image_id"] = 135463122781178
    },
    ["plants_2024_hanging_ivy_medium"] = {
        ["name"] = "Hanging Ivy Medium",
        ["cost"] = 22,
        ["model_name"] = "Plants2024HangingIvyMedium",
        ["image_id"] = 128579657694229
    },
    ["plants_2024_hanging_ivy_small"] = {
        ["name"] = "Hanging Ivy Small",
        ["cost"] = 12,
        ["model_name"] = "Plants2024HangingIvySmall",
        ["image_id"] = 72939273880960
    },
    ["plants_2024_drooping_ivy_large"] = {
        ["name"] = "Drooping Ivy Large",
        ["cost"] = 32,
        ["model_name"] = "Plants2024DroopingIvyLarge",
        ["image_id"] = 136562731943659
    },
    ["plants_2024_drooping_ivy_medium"] = {
        ["name"] = "Drooping Ivy Medium",
        ["cost"] = 22,
        ["model_name"] = "Plants2024DroopingIvyMedium",
        ["image_id"] = 123876472159577
    },
    ["plants_2024_drooping_ivy_small"] = {
        ["name"] = "Drooping Ivy Small",
        ["cost"] = 12,
        ["model_name"] = "Plants2024DroopingIvySmall",
        ["image_id"] = 109666948715997
    },
    ["plants_2024_creeping_ivy_large"] = {
        ["name"] = "Creeping Ivy Large",
        ["cost"] = 32,
        ["model_name"] = "Plants2024CreepingIvyLarge",
        ["image_id"] = 108116073196715
    },
    ["plants_2024_creeping_ivy_medium"] = {
        ["name"] = "Creeping Ivy Medium",
        ["cost"] = 22,
        ["model_name"] = "Plants2024CreepingIvyMedium",
        ["image_id"] = 132967532213094
    },
    ["plants_2024_creeping_ivy_small"] = {
        ["name"] = "Creeping Ivy Small",
        ["cost"] = 12,
        ["model_name"] = "Plants2024CreepingIvySmall",
        ["image_id"] = 139788573175336
    },
    ["plants_2024_cactus_bowl"] = {
        ["name"] = "Cactus Bowl",
        ["cost"] = 33,
        ["model_name"] = "Plants2024CactusBowl",
        ["image_id"] = 101269955998793
    }
}
local v7 = {
    ["nye_2024_pet_potty"] = {
        ["name"] = "New Year Pet Potty",
        ["cost"] = 52,
        ["model_name"] = "NYE2024PresentPetToilet",
        ["image_id"] = 100679930935865
    },
    ["nye_2024_wall_decor_1"] = {
        ["name"] = "New Year Wall Decor 1",
        ["cost"] = 61,
        ["model_name"] = "NYE2024HappyNewYearsBalloons",
        ["image_id"] = 103286427061562
    },
    ["nye_2024_starlight_curtains"] = {
        ["name"] = "New Year Starlight Curtains",
        ["cost"] = 75,
        ["model_name"] = "NYE2024StarCurtains",
        ["image_id"] = 111298469062644
    },
    ["nye_2024_wall_decor_2"] = {
        ["name"] = "New Year Wall Decor 2",
        ["cost"] = 70,
        ["model_name"] = "NYE2024NewYearBunting",
        ["image_id"] = 79755896700929
    },
    ["nye_2024_balloons_1"] = {
        ["name"] = "New Year Balloons 1",
        ["cost"] = 58,
        ["model_name"] = "NYE2024BalloonCluster",
        ["image_id"] = 127712474851751
    },
    ["nye_2024_balloons_2"] = {
        ["name"] = "New Year Balloons 2",
        ["cost"] = 67,
        ["model_name"] = "NYE2024BalloonColumn",
        ["image_id"] = 92496202626506
    },
    ["nye_2024_balloons_3"] = {
        ["name"] = "New Year Balloons 3",
        ["cost"] = 82,
        ["model_name"] = "NYE2024BalloonGarland",
        ["image_id"] = 112969946218206
    },
    ["nye_2024_starburst_table_light"] = {
        ["name"] = "New Year Starburst Table Light",
        ["cost"] = 120,
        ["model_name"] = "NYE2024StarburstLight",
        ["image_id"] = 82091213750350
    },
    ["nye_2024_twig_table_lights"] = {
        ["name"] = "New Year Twig Table Lights",
        ["cost"] = 115,
        ["model_name"] = "NYE2024TwigLights",
        ["image_id"] = 102430146226993
    },
    ["nye_2024_fairy_table_lights"] = {
        ["name"] = "New Year Fairy Table Lights",
        ["cost"] = 125,
        ["model_name"] = "NYE2024FairyLights",
        ["image_id"] = 116410383079469
    }
}
for _, v8 in v5 do
    if not v8.tags then
        v8.tags = { "Winter2024" }
    end
end
for _, v9 in v6 do
    if not v9.tags then
        v9.tags = { "Plants2024" }
    end
end
for _, v10 in v7 do
    if not v10.tags then
        v10.tags = { "NYE2024" }
    end
end
return v2.furniture(v4.Dictionary.merge(v5, v6, v7))