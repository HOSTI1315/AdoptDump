--// ReplicatedStorage.SharedModules.ContentPacks.Pride2022.Furniture (ModuleScript)

local v1 = {
    ["pride_2022_pride_food_bowl"] = {
        ["name"] = "Pride Food Bowl",
        ["cost"] = 50,
        ["model_name"] = "Pride2022PrideFoodBowl",
        ["image_id"] = 9414696511
    },
    ["pride_2022_pride_water_bowl"] = {
        ["name"] = "Pride Water Bowl",
        ["cost"] = 50,
        ["model_name"] = "Pride2022PrideWaterBowl",
        ["image_id"] = 9414696897
    },
    ["pride_2022_pride_pet_bed"] = {
        ["name"] = "Pride Pet Bed",
        ["cost"] = 50,
        ["model_name"] = "Pride2022PridePetBed",
        ["image_id"] = 9414697142
    },
    ["pride_2022_pride_crib"] = {
        ["name"] = "Pride Crib",
        ["cost"] = 50,
        ["model_name"] = "Pride2022PrideCrib",
        ["image_id"] = 9414697434
    },
    ["pride_2022_pride_bed"] = {
        ["name"] = "Pride Bed",
        ["cost"] = 50,
        ["model_name"] = "Pride2022PrideBed",
        ["image_id"] = 9414697738
    },
    ["pride_2022_pride_fridge"] = {
        ["name"] = "Pride Fridge",
        ["cost"] = 50,
        ["model_name"] = "Pride2022PrideFridge",
        ["image_id"] = 9414700341
    },
    ["pride_2022_pride_shower"] = {
        ["name"] = "Pride Shower",
        ["cost"] = 50,
        ["model_name"] = "Pride2022PrideShower",
        ["image_id"] = 9414700615
    },
    ["pride_2022_pride_sofa"] = {
        ["name"] = "Pride Sofa",
        ["cost"] = 50,
        ["model_name"] = "Pride2022PrideSofa",
        ["image_id"] = 9414701917
    },
    ["pride_2022_pride_table"] = {
        ["name"] = "Pride Table",
        ["cost"] = 50,
        ["model_name"] = "Pride2022PrideTable",
        ["image_id"] = 9414703278
    },
    ["pride_2022_pride_lamp"] = {
        ["name"] = "Pride Lamp",
        ["cost"] = 50,
        ["model_name"] = "Pride2022PrideLamp",
        ["image_id"] = 9656143370
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)