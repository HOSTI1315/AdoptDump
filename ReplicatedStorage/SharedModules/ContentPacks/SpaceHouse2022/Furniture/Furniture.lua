--// ReplicatedStorage.SharedModules.ContentPacks.SpaceHouse2022.Furniture (ModuleScript)

local v1 = {
    ["space_house_2022_bed"] = {
        ["name"] = "Space Fleet Bed",
        ["cost"] = 315,
        ["model_name"] = "SpaceHouse2022Bed",
        ["image_id"] = 9366993479,
        ["tags"] = { "SpaceHouse2022Placeable" }
    },
    ["space_house_2022_crib"] = {
        ["name"] = "Space Fleet Crib",
        ["cost"] = 145,
        ["model_name"] = "SpaceHouse2022Crib",
        ["image_id"] = 9366993625,
        ["tags"] = { "SpaceHouse2022Placeable" }
    },
    ["space_house_2022_fridge"] = {
        ["name"] = "Space Fleet Fridge",
        ["cost"] = 99,
        ["model_name"] = "SpaceHouse2022Fridge",
        ["image_id"] = 9366993826,
        ["tags"] = { "SpaceHouse2022Placeable" }
    },
    ["space_house_2022_pet_bed"] = {
        ["name"] = "Space Fleet Pet Bed",
        ["cost"] = 175,
        ["model_name"] = "SpaceHouse2022PetBed",
        ["image_id"] = 9366993998,
        ["tags"] = { "SpaceHouse2022Placeable" }
    },
    ["space_house_2022_speaker"] = {
        ["name"] = "Space Fleet Party Speaker",
        ["cost"] = 24,
        ["model_name"] = "SpaceHouse2022Speaker",
        ["image_id"] = 9366994197,
        ["tags"] = { "SpaceHouse2022Placeable" }
    },
    ["space_house_2022_table"] = {
        ["name"] = "Space Fleet Holotable",
        ["cost"] = 23,
        ["model_name"] = "SpaceHouse2022Table",
        ["image_id"] = 9367020819,
        ["tags"] = { "SpaceHouse2022Placeable" }
    },
    ["space_house_2022_light"] = {
        ["name"] = "Space Fleet Light",
        ["cost"] = 30,
        ["model_name"] = "SpaceHouse2022Light",
        ["image_id"] = 9366993908,
        ["tags"] = { "SpaceHouse2022Placeable" }
    },
    ["space_house_2022_food_bowl"] = {
        ["name"] = "Space Fleet Pet Food Bowl",
        ["cost"] = 85,
        ["model_name"] = "SpaceHouse2022FoodBowl",
        ["image_id"] = 9366993713,
        ["tags"] = { "SpaceHouse2022Placeable" }
    },
    ["space_house_2022_water_bowl"] = {
        ["name"] = "Space Fleet Pet Water Bowl",
        ["cost"] = 85,
        ["model_name"] = "SpaceHouse2022WaterBowl",
        ["image_id"] = 9367020922,
        ["tags"] = { "SpaceHouse2022Placeable" }
    },
    ["space_house_2022_shower"] = {
        ["name"] = "Space Fleet Shower",
        ["cost"] = 187,
        ["model_name"] = "SpaceHouse2022Shower",
        ["image_id"] = 9366994093,
        ["tags"] = { "SpaceHouse2022Placeable" }
    },
    ["space_house_2022_capricorn"] = {
        ["name"] = "Capricorn",
        ["model_name"] = "SpaceHouse2022Capricorn"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)