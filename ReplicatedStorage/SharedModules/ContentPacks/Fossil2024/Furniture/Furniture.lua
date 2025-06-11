--// ReplicatedStorage.SharedModules.ContentPacks.Fossil2024.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["fossil_2024_bed"] = {
        ["name"] = "Prehistoric Bed",
        ["cost"] = 230,
        ["model_name"] = "Fossil2024Bed",
        ["image_id"] = 17165628648
    },
    ["fossil_2024_crib"] = {
        ["name"] = "Prehistoric Crib",
        ["cost"] = 185,
        ["model_name"] = "Fossil2024Crib",
        ["image_id"] = 17165629830
    },
    ["fossil_2024_food_bowl"] = {
        ["name"] = "Prehistoric Food Bowl",
        ["cost"] = 125,
        ["model_name"] = "Fossil2024FoodBowl",
        ["image_id"] = 17165630495
    },
    ["fossil_2024_water_bowl"] = {
        ["name"] = "Prehistoric Water Bowl",
        ["cost"] = 125,
        ["model_name"] = "Fossil2024WaterBowl",
        ["image_id"] = 17165633842
    },
    ["fossil_2024_fridge"] = {
        ["name"] = "Prehistoric Fridge",
        ["cost"] = 215,
        ["model_name"] = "Fossil2024Fridge",
        ["image_id"] = 17165631275
    },
    ["fossil_2024_shower"] = {
        ["name"] = "Prehistoric Shower",
        ["cost"] = 170,
        ["model_name"] = "Fossil2024Shower",
        ["image_id"] = 17165632873
    },
    ["fossil_2024_pet_bed"] = {
        ["name"] = "Prehistoric Pet Bed",
        ["cost"] = 130,
        ["model_name"] = "Fossil2024PetBed",
        ["image_id"] = 17165631814
    }
}
for _, v3 in v2 do
    v3.tags = { "Fossil2024" }
end
return v1.furniture(v2)