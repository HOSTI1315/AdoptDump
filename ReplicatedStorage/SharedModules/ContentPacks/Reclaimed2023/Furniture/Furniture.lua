--// ReplicatedStorage.SharedModules.ContentPacks.Reclaimed2023.Furniture (ModuleScript)

local v1 = {
    ["reclaimed_2023_bed"] = {
        ["name"] = "Upcycled Bed",
        ["cost"] = 105,
        ["model_name"] = "Reclaimed2023Bed",
        ["image_id"] = 10211151251,
        ["tags"] = { "Reclaimed2023Placeable" }
    },
    ["reclaimed_2023_chair"] = {
        ["name"] = "Reclaimed Chair",
        ["cost"] = 74,
        ["model_name"] = "Reclaimed2023Chair",
        ["image_id"] = 10211151478,
        ["tags"] = { "Reclaimed2023Placeable" }
    },
    ["reclaimed_2023_crib"] = {
        ["name"] = "Upcycled Crib",
        ["cost"] = 101,
        ["model_name"] = "Reclaimed2023Crib",
        ["image_id"] = 10211151645,
        ["tags"] = { "Reclaimed2023Placeable" }
    },
    ["reclaimed_2023_food_bowl"] = {
        ["name"] = "Upcycled Food Bowl",
        ["cost"] = 91,
        ["model_name"] = "Reclaimed2023FoodBowl",
        ["image_id"] = 10211160276,
        ["tags"] = { "Reclaimed2023Placeable" }
    },
    ["reclaimed_2023_fridge"] = {
        ["name"] = "Upcycled Fridge",
        ["cost"] = 152,
        ["model_name"] = "Reclaimed2023Fridge",
        ["image_id"] = 10211160424,
        ["tags"] = { "Reclaimed2023Placeable" }
    },
    ["reclaimed_2023_pallet"] = {
        ["name"] = "Wooden Pallet Decor",
        ["cost"] = 50,
        ["model_name"] = "Reclaimed2023Pallet",
        ["image_id"] = 10211160524,
        ["tags"] = { "Reclaimed2023Placeable" }
    },
    ["reclaimed_2023_pet_bed"] = {
        ["name"] = "Upcycled Pet Bed",
        ["cost"] = 162,
        ["model_name"] = "Reclaimed2023PetBed",
        ["image_id"] = 10211160630,
        ["tags"] = { "Reclaimed2023Placeable" }
    },
    ["reclaimed_2023_planter"] = {
        ["name"] = "Old Boot Planter",
        ["cost"] = 10,
        ["model_name"] = "Reclaimed2023Planter",
        ["image_id"] = 10211160730,
        ["tags"] = { "Reclaimed2023Placeable" }
    },
    ["reclaimed_2023_shower"] = {
        ["name"] = "Upcycled Shower",
        ["cost"] = 173,
        ["model_name"] = "Reclaimed2023Shower",
        ["image_id"] = 10211160870,
        ["tags"] = { "Reclaimed2023Placeable" }
    },
    ["reclaimed_2023_sofa"] = {
        ["name"] = "Reclaimed Sofa",
        ["cost"] = 102,
        ["model_name"] = "Reclaimed2023Sofa",
        ["image_id"] = 10211169271,
        ["tags"] = { "Reclaimed2023Placeable" }
    },
    ["reclaimed_2023_table"] = {
        ["name"] = "Milk Crate Table",
        ["cost"] = 80,
        ["model_name"] = "Reclaimed2023Table",
        ["image_id"] = 10211169403,
        ["tags"] = { "Reclaimed2023Placeable" }
    },
    ["reclaimed_2023_water_bowl"] = {
        ["name"] = "Upcycled Water Bowl",
        ["cost"] = 91,
        ["model_name"] = "Reclaimed2023WaterBowl",
        ["image_id"] = 10211169486,
        ["tags"] = { "Reclaimed2023Placeable" }
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)