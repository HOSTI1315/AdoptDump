--// ReplicatedStorage.SharedModules.ContentPacks.Steampunk2022.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["steampunk_2022_food_bowl"] = {
        ["name"] = "Steampunk Pet Food Bowl",
        ["cost"] = 135,
        ["model_name"] = "Steampunk2022FoodBowl",
        ["image_id"] = 10066064864
    },
    ["steampunk_2022_water_bowl"] = {
        ["name"] = "Steampunk Pet Water Bowl",
        ["cost"] = 132,
        ["model_name"] = "Steampunk2022WaterBowl",
        ["image_id"] = 10066090671
    },
    ["steampunk_2022_shower"] = {
        ["name"] = "Steampunk Shower",
        ["cost"] = 150,
        ["model_name"] = "Steampunk2022Shower",
        ["image_id"] = 10066065646
    },
    ["steampunk_2022_crib"] = {
        ["name"] = "Steampunk Crib",
        ["cost"] = 105,
        ["model_name"] = "Steampunk2022Crib",
        ["image_id"] = 10444187811
    },
    ["steampunk_2022_pet_bed"] = {
        ["name"] = "Steampunk Pet Bed",
        ["cost"] = 145,
        ["model_name"] = "Steampunk2022PetBed",
        ["image_id"] = 10136083079
    },
    ["steampunk_2022_bed"] = {
        ["name"] = "Steampunk Bed",
        ["cost"] = 60,
        ["model_name"] = "Steampunk2022Bed",
        ["image_id"] = 10066064373
    },
    ["steampunk_2022_fridge"] = {
        ["name"] = "Steampunk Fridge",
        ["cost"] = 146,
        ["model_name"] = "Steampunk2022Fridge",
        ["image_id"] = 10066065088
    },
    ["steampunk_2022_chair"] = {
        ["name"] = "Steampunk Chair",
        ["cost"] = 43,
        ["model_name"] = "Steampunk2022Chair",
        ["image_id"] = 10066064543
    },
    ["steampunk_2022_lamp"] = {
        ["name"] = "Steampunk Lamp",
        ["cost"] = 34,
        ["model_name"] = "Steampunk2022Lamp",
        ["image_id"] = 10066065301
    },
    ["steampunk_2022_sofa"] = {
        ["name"] = "Steampunk Sofa",
        ["cost"] = 72,
        ["model_name"] = "Steampunk2022Sofa",
        ["image_id"] = 10066090069
    },
    ["steampunk_2022_light"] = {
        ["name"] = "Steampunk Light Fixture",
        ["cost"] = 44,
        ["model_name"] = "Steampunk2022Light",
        ["image_id"] = 10066065489
    },
    ["steampunk_2022_table"] = {
        ["name"] = "Steampunk Table",
        ["cost"] = 65,
        ["model_name"] = "Steampunk2022Table",
        ["image_id"] = 10066090214
    },
    ["steampunk_2022_wall_decoration_gear_bar"] = {
        ["name"] = "Steampunk Wall Cam",
        ["cost"] = 60,
        ["model_name"] = "Steampunk2022WallDecorationGearBar",
        ["image_id"] = 10066090573
    },
    ["steampunk_2022_wall_decoration_gear_belt"] = {
        ["name"] = "Steampunk Wall Cogs",
        ["cost"] = 25,
        ["model_name"] = "Steampunk2022WallDecorationGearBelt",
        ["image_id"] = 10066090426
    }
}
for _, v3 in pairs(v2) do
    v3.tags = { "Steampunk2022" }
end
return v1.furniture(v2)