--// ReplicatedStorage.SharedModules.ContentPacks.Neanderthal2022.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["neanderthal_2022_pet_food_bowl"] = {
        ["name"] = "Neanderthal Pet Food Bowl",
        ["cost"] = 140,
        ["model_name"] = "Neanderthal2022PetFoodBowl",
        ["image_id"] = 10979127625
    },
    ["neanderthal_2022_pet_water_bowl"] = {
        ["name"] = "Neanderthal Pet Water Bowl",
        ["cost"] = 104,
        ["model_name"] = "Neanderthal2022PetWaterBowl",
        ["image_id"] = 10979127967
    },
    ["neanderthal_2022_pet_bed"] = {
        ["name"] = "Neanderthal Pet Bed",
        ["cost"] = 178,
        ["model_name"] = "Neanderthal2022PetBed",
        ["image_id"] = 10979128671
    },
    ["neanderthal_2022_crib"] = {
        ["name"] = "Neanderthal Crib",
        ["cost"] = 108,
        ["model_name"] = "Neanderthal2022Crib",
        ["image_id"] = 10979129009
    },
    ["neanderthal_2022_bed"] = {
        ["name"] = "Neanderthal Bed",
        ["cost"] = 154,
        ["model_name"] = "Neanderthal2022Bed",
        ["image_id"] = 10979129605
    },
    ["neanderthal_2022_shower"] = {
        ["name"] = "Neanderthal Shower",
        ["cost"] = 181,
        ["model_name"] = "Neanderthal2022Shower",
        ["image_id"] = 10979135641
    },
    ["neanderthal_2022_fridge"] = {
        ["name"] = "Neanderthal Fridge",
        ["cost"] = 100,
        ["model_name"] = "Neanderthal2022Fridge",
        ["image_id"] = 10979136120
    },
    ["neanderthal_2022_piano"] = {
        ["name"] = "Neanderthal Piano",
        ["cost"] = 140,
        ["model_name"] = "Neanderthal2022Piano",
        ["image_id"] = 10979136818
    },
    ["neanderthal_2022_carousel"] = {
        ["name"] = "Neanderthal Carousel",
        ["cost"] = 75,
        ["model_name"] = "Neanderthal2022Carousel",
        ["image_id"] = 10979138431
    },
    ["neanderthal_2022_sofa"] = {
        ["name"] = "Neanderthal Sofa",
        ["cost"] = 120,
        ["model_name"] = "Neanderthal2022Sofa",
        ["image_id"] = 10979137362
    }
}
for _, v3 in v2 do
    if v3.cost then
        v3.tags = { "Neanderthal2022" }
    end
end
return v1.furniture(v2)