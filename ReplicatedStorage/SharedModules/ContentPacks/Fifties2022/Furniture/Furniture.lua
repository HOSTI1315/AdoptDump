--// ReplicatedStorage.SharedModules.ContentPacks.Fifties2022.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["fifties_2022_food_bowl"] = {
        ["name"] = "50s Pet Food Bowl",
        ["cost"] = 123,
        ["model_name"] = "Fifties2022FoodBowl",
        ["image_id"] = 10042647164
    },
    ["fifties_2022_water_bowl"] = {
        ["name"] = "50s Pet Water Bowl",
        ["cost"] = 124,
        ["model_name"] = "Fifties2022WaterBowl",
        ["image_id"] = 10042657326
    },
    ["fifties_2022_bed"] = {
        ["name"] = "50s Bed",
        ["cost"] = 130,
        ["model_name"] = "Fifties2022Bed",
        ["image_id"] = 10042646903
    },
    ["fifties_2022_pet_bed"] = {
        ["name"] = "50s Pet Bed",
        ["cost"] = 155,
        ["model_name"] = "Fifties2022PetBed",
        ["image_id"] = 10042647917
    },
    ["fifties_2022_crib"] = {
        ["name"] = "50s Crib",
        ["cost"] = 115,
        ["model_name"] = "Fifties2022Crib",
        ["image_id"] = 10042647044
    },
    ["fifties_2022_shower"] = {
        ["name"] = "50s Shower",
        ["cost"] = 178,
        ["model_name"] = "Fifties2022Shower",
        ["image_id"] = 10042656912
    },
    ["fifties_2022_tv"] = {
        ["name"] = "50s Television",
        ["cost"] = 90,
        ["model_name"] = "Fifties2022Television",
        ["image_id"] = 10042657137
    },
    ["fifties_2022_projector"] = {
        ["name"] = "50s Projector",
        ["cost"] = 120,
        ["model_name"] = "Fifties2022Projector",
        ["image_id"] = 10042647994
    },
    ["fifties_2022_telephone"] = {
        ["name"] = "50s Telephone",
        ["cost"] = 45,
        ["model_name"] = "Fifties2022Telephone",
        ["image_id"] = 10042657024
    },
    ["fifties_2022_fridge"] = {
        ["name"] = "50s Fridge",
        ["cost"] = 70,
        ["model_name"] = "Fifties2022Fridge",
        ["image_id"] = 10042647349
    },
    ["fifties_2022_neon_table_straight"] = {
        ["name"] = "50s Straight Neon Table",
        ["cost"] = 55,
        ["model_name"] = "Fifties2022NeonTableStraight",
        ["image_id"] = 10042647801
    },
    ["fifties_2022_neon_table_outer_bend"] = {
        ["name"] = "50s Neon Table Outer Bend",
        ["cost"] = 53,
        ["model_name"] = "Fifties2022NeonTableOuterBend",
        ["image_id"] = 10042647685
    },
    ["fifties_2022_neon_table_inner_bend"] = {
        ["name"] = "50s Neon Table Inner Bend",
        ["cost"] = 54,
        ["model_name"] = "Fifties2022NeonTableInnerBend",
        ["image_id"] = 10042647536
    }
}
for _, v3 in pairs(v2) do
    v3.tags = { "Fifties2022" }
end
return v1.furniture(v2)