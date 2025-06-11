--// ReplicatedStorage.SharedModules.ContentPacks.Safari2023.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("EntryHelper")
local v3 = v1("FurnitureUseHelperDB")
local v4 = {
    ["safari_2023_chair"] = {
        ["cost"] = 55,
        ["image_id"] = 13664097643,
        ["model_name"] = "Safari2023Chair",
        ["name"] = "Safari Chair"
    },
    ["safari_2023_fridge"] = {
        ["cost"] = 90,
        ["image_id"] = 13664100888,
        ["model_name"] = "Safari2023Fridge",
        ["name"] = "Safari Fridge"
    },
    ["safari_2023_crib"] = {
        ["cost"] = 150,
        ["image_id"] = 13664102199,
        ["model_name"] = "Safari2023Crib",
        ["name"] = "Safari Crib"
    },
    ["safari_2023_pet_bed"] = {
        ["cost"] = 300,
        ["image_id"] = 13664103008,
        ["model_name"] = "Safari2023PetBed",
        ["name"] = "Safari Pet Bed"
    },
    ["safari_2023_bed"] = {
        ["cost"] = 350,
        ["image_id"] = 13664101462,
        ["model_name"] = "Safari2023Bed",
        ["name"] = "Safari Bed"
    },
    ["safari_2023_shower"] = {
        ["cost"] = 185,
        ["image_id"] = 13664103371,
        ["model_name"] = "Safari2023Shower",
        ["name"] = "Safari Shower"
    },
    ["safari_2023_food_bowl"] = {
        ["cost"] = 115,
        ["image_id"] = 13664096301,
        ["model_name"] = "Safari2023FoodBowl",
        ["name"] = "Safari Food Bowl"
    },
    ["safari_2023_water_bowl"] = {
        ["cost"] = 115,
        ["image_id"] = 13664097067,
        ["model_name"] = "Safari2023WaterBowl",
        ["name"] = "Safari Water Bowl"
    },
    ["safari_2023_tree"] = {
        ["cost"] = 50,
        ["image_id"] = 13664100287,
        ["model_name"] = "Safari2023Tree",
        ["name"] = "Safari Tree"
    },
    ["safari_2023_gazebo"] = {
        ["cost"] = 190,
        ["image_id"] = 13664098834,
        ["model_name"] = "Safari2023Gazebo",
        ["name"] = "Safari Gazebo"
    },
    ["safari_2023_plant_pot"] = {
        ["cost"] = 35,
        ["image_id"] = 13664099701,
        ["model_name"] = "Safari2023PlantPot",
        ["name"] = "Safari Plant"
    },
    ["safari_2023_torch"] = {
        ["cost"] = 30,
        ["image_id"] = 13664103984,
        ["model_name"] = "Safari2023Torch",
        ["name"] = "Safari Torch",
        ["behavior"] = v3.LIGHT_WITH_EFFECTS("safari_2023_torch")
    },
    ["safari_2023_fire_pit"] = {
        ["cost"] = 175,
        ["image_id"] = 13664098157,
        ["model_name"] = "Safari2023FirePit",
        ["name"] = "Safari Fire Pit",
        ["behavior"] = v3.LIGHT_WITH_EFFECTS("safari_2023_fire_pit")
    },
    ["safari_2023_curtain"] = {
        ["cost"] = 60,
        ["image_id"] = 13664095654,
        ["model_name"] = "Safari2023Curtain",
        ["name"] = "Safari Curtain"
    }
}
for _, v5 in v4 do
    if v5.cost then
        v5.tags = { "Safari2023Placeable" }
    end
end
return v2.furniture(v4)