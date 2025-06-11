--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2022.Furniture (ModuleScript)

local v1 = {
    ["high_fantasy_2022_bed"] = {
        ["name"] = "Mystic Stone Bed",
        ["cost"] = 600,
        ["model_name"] = "HighFantasy2022Bed",
        ["image_id"] = 10211137612,
        ["tags"] = { "HighFantasy2022Placeable" }
    },
    ["high_fantasy_2022_chair"] = {
        ["name"] = "Mystic Stone Chair",
        ["cost"] = 250,
        ["model_name"] = "HighFantasy2022Chair",
        ["image_id"] = 10211137774,
        ["tags"] = { "HighFantasy2022Placeable" }
    },
    ["high_fantasy_2022_crib"] = {
        ["name"] = "Mystic Stone Crib",
        ["cost"] = 700,
        ["model_name"] = "HighFantasy2022Crib",
        ["image_id"] = 10211137934,
        ["tags"] = { "HighFantasy2022Placeable" }
    },
    ["high_fantasy_2022_food_bowl"] = {
        ["name"] = "Mystic Stone Pet Food Bowl",
        ["cost"] = 500,
        ["model_name"] = "HighFantasy2022FoodBowl",
        ["image_id"] = 10211138098,
        ["image_size_x"] = 64,
        ["image_size_y"] = 29,
        ["tags"] = { "HighFantasy2022Placeable" }
    },
    ["high_fantasy_2022_fridge"] = {
        ["name"] = "Mystic Stone Fridge",
        ["cost"] = 300,
        ["model_name"] = "HighFantasy2022Fridge",
        ["image_id"] = 10211138267,
        ["tags"] = { "HighFantasy2022Placeable" }
    },
    ["high_fantasy_2022_pet_bed"] = {
        ["name"] = "Mystic Stone Pet Bed",
        ["cost"] = 800,
        ["model_name"] = "HighFantasy2022PetBed",
        ["image_id"] = 10211138374,
        ["tags"] = { "HighFantasy2022Placeable" }
    },
    ["high_fantasy_2022_shower"] = {
        ["name"] = "Mystic Stone Shower",
        ["cost"] = 499,
        ["model_name"] = "HighFantasy2022Shower",
        ["image_id"] = 10211150778,
        ["tags"] = { "HighFantasy2022Placeable" }
    },
    ["high_fantasy_2022_table"] = {
        ["name"] = "Mystic Stone Table",
        ["cost"] = 300,
        ["model_name"] = "HighFantasy2022Table",
        ["image_id"] = 10428976713,
        ["image_size_x"] = 76,
        ["image_size_y"] = 45,
        ["tags"] = { "HighFantasy2022Placeable" }
    },
    ["high_fantasy_2022_water_bowl"] = {
        ["name"] = "Mystic Stone Pet Water Bowl",
        ["cost"] = 500,
        ["model_name"] = "HighFantasy2022WaterBowl",
        ["image_id"] = 10211151118,
        ["image_size_x"] = 64,
        ["image_size_y"] = 29,
        ["tags"] = { "HighFantasy2022Placeable" }
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)