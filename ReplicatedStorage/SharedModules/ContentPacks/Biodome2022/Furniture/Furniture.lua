--// ReplicatedStorage.SharedModules.ContentPacks.Biodome2022.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["biodome_2022_food_bowl"] = {
        ["name"] = "Biodome Pet Food Bowl",
        ["cost"] = 99,
        ["model_name"] = "Biodome2022FoodBowl",
        ["image_id"] = 9838499765
    },
    ["biodome_2022_water_bowl"] = {
        ["name"] = "Biodome Pet Water Bowl",
        ["cost"] = 99,
        ["model_name"] = "Biodome2022WaterBowl",
        ["image_id"] = 9838500221
    },
    ["biodome_2022_crib"] = {
        ["name"] = "Biodome Crib",
        ["cost"] = 179,
        ["model_name"] = "Biodome2022Crib",
        ["image_id"] = 9838499663
    },
    ["biodome_2022_parent_bed"] = {
        ["name"] = "Biodome Bed",
        ["cost"] = 194,
        ["model_name"] = "Biodome2022ParentBed",
        ["image_id"] = 9838499926
    },
    ["biodome_2022_pet_bed"] = {
        ["name"] = "Biodome Pet Bed",
        ["cost"] = 155,
        ["model_name"] = "Biodome2022PetBed",
        ["image_id"] = 9838500011
    },
    ["biodome_2022_shower"] = {
        ["name"] = "Biodome Shower",
        ["cost"] = 199,
        ["model_name"] = "Biodome2022Shower",
        ["image_id"] = 9838500112
    },
    ["biodome_2022_fridge"] = {
        ["name"] = "Biodome Fridge",
        ["cost"] = 125,
        ["model_name"] = "Biodome2022Fridge",
        ["image_id"] = 9838499829
    },
    ["biodome_2022_four_leaf"] = {
        ["name"] = "Four Leaf Plant",
        ["cost"] = 58,
        ["model_name"] = "Biodome2022FourLeaf",
        ["image_id"] = 9838500291
    },
    ["biodome_2022_large_rock"] = {
        ["name"] = "Large Rock",
        ["cost"] = 30,
        ["model_name"] = "Biodome2022LargeRock",
        ["image_id"] = 9838500354
    },
    ["biodome_2022_large_tree"] = {
        ["name"] = "Large Bio Tree",
        ["cost"] = 45,
        ["model_name"] = "Biodome2022LargeTree",
        ["image_id"] = 9838500424
    },
    ["biodome_2022_long_bush"] = {
        ["name"] = "Long Bio Bush",
        ["cost"] = 43,
        ["model_name"] = "Biodome2022LongBush",
        ["image_id"] = 9838515737
    },
    ["biodome_2022_long_grass"] = {
        ["name"] = "Long Grass",
        ["cost"] = 10,
        ["model_name"] = "Biodome2022LongGrass",
        ["image_id"] = 9838515807
    },
    ["biodome_2022_long_leaf"] = {
        ["name"] = "Long Leaf Plant",
        ["cost"] = 13,
        ["model_name"] = "Biodome2022LongLeaf",
        ["image_id"] = 9838515892
    },
    ["biodome_2022_pad_leaf"] = {
        ["name"] = "Padded Leaf Plant",
        ["cost"] = 15,
        ["model_name"] = "Biodome2022PadLeaf",
        ["image_id"] = 9838515982
    },
    ["biodome_2022_simple_tree"] = {
        ["name"] = "Bio Tree",
        ["cost"] = 36,
        ["model_name"] = "Biodome2022SimpleTree",
        ["image_id"] = 9838516062
    },
    ["biodome_2022_small_bush"] = {
        ["name"] = "Bio Bush",
        ["cost"] = 41,
        ["model_name"] = "Biodome2022SmallBush",
        ["image_id"] = 9838516138
    }
}
for _, v3 in pairs(v2) do
    v3.tags = { "Biodome2022" }
end
return v1.furniture(v2)