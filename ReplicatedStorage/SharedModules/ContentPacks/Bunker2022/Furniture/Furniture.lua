--// ReplicatedStorage.SharedModules.ContentPacks.Bunker2022.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["bunker_2022_fridge"] = {
        ["name"] = "Bunker Fridge",
        ["cost"] = 85,
        ["model_name"] = "Bunker2022Fridge",
        ["image_id"] = 11242291898
    },
    ["bunker_2022_bed"] = {
        ["name"] = "Bunker Bed",
        ["cost"] = 185,
        ["model_name"] = "Bunker2022Bed",
        ["image_id"] = 11242291557
    },
    ["bunker_2022_pet_bed"] = {
        ["name"] = "Bunker Pet Bed",
        ["cost"] = 185,
        ["model_name"] = "Bunker2022PetBed",
        ["image_id"] = 11242303845
    },
    ["bunker_2022_crib"] = {
        ["name"] = "Bunker Crib",
        ["cost"] = 150,
        ["model_name"] = "Bunker2022Crib",
        ["image_id"] = 11242291663
    },
    ["bunker_2022_fan"] = {
        ["name"] = "Bunker Fan",
        ["cost"] = 20,
        ["model_name"] = "Bunker2022Fan",
        ["image_id"] = 11242291745
    },
    ["bunker_2022_food_bowl"] = {
        ["name"] = "Bunker Pet Food Bowl",
        ["cost"] = 75,
        ["model_name"] = "Bunker2022FoodBowl",
        ["image_id"] = 11242291834
    },
    ["bunker_2022_light"] = {
        ["name"] = "Bunker Light",
        ["cost"] = 55,
        ["model_name"] = "Bunker2022Light",
        ["image_id"] = 11242303692
    },
    ["bunker_2022_shower"] = {
        ["name"] = "Bunker Shower",
        ["cost"] = 205,
        ["model_name"] = "Bunker2022Shower",
        ["image_id"] = 11242303959
    },
    ["bunker_2022_water_bowl"] = {
        ["name"] = "Bunker Pet Water Bowl",
        ["cost"] = 75,
        ["model_name"] = "Bunker2022WaterBowl",
        ["image_id"] = 11242304056
    },
    ["bunker_2022_pipe_straight"] = {
        ["name"] = "Straight Bunker Pipe",
        ["cost"] = 30,
        ["model_name"] = "Bunker2022PipeStraight",
        ["image_id"] = 11242313132
    },
    ["bunker_2022_pipe_straight_steam"] = {
        ["name"] = "Bent Bunker Pipe",
        ["cost"] = 30,
        ["model_name"] = "Bunker2022PipeStraightSteam",
        ["image_id"] = 11242313078
    },
    ["bunker_2022_pipe_straight_valve"] = {
        ["name"] = "Bunker Valve",
        ["cost"] = 30,
        ["model_name"] = "Bunker2022PipeStraightValve",
        ["image_id"] = 11242313233
    },
    ["bunker_2022_pipe_curve"] = {
        ["name"] = "Curved Bunker Pipe",
        ["cost"] = 30,
        ["model_name"] = "Bunker2022PipeCurve",
        ["image_id"] = 11242304281
    },
    ["bunker_2022_pipe_tjunction"] = {
        ["name"] = "T-Junction Bunker Pipe",
        ["cost"] = 30,
        ["model_name"] = "Bunker2022PipeTJunction",
        ["image_id"] = 11242313343
    },
    ["bunker_2022_pipe_cross_junction"] = {
        ["name"] = "Junction Bunker Pipe",
        ["cost"] = 30,
        ["model_name"] = "Bunker2022PipeCrossJunction",
        ["image_id"] = 11242304170
    },
    ["bunker_2022_pipe_cap"] = {
        ["name"] = "Capped Bunker Pipe",
        ["cost"] = 30,
        ["model_name"] = "Bunker2022PipeCap",
        ["image_id"] = 11242312989
    }
}
for _, v3 in pairs(v2) do
    if v3.cost then
        v3.tags = { "Bunker2022" }
    end
end
return v1.furniture(v2)