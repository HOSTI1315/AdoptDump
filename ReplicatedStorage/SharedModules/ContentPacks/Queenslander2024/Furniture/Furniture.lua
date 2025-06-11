--// ReplicatedStorage.SharedModules.ContentPacks.Queenslander2024.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("EntryHelper")
local v3 = {
    ["queenslander_crib"] = {
        ["name"] = "Queensland Crib",
        ["cost"] = 95,
        ["model_name"] = "QueenslanderCrib",
        ["image_id"] = 15682340780
    },
    ["queenslander_bowl"] = {
        ["name"] = "Queensland Food and Water Bowl",
        ["cost"] = 225,
        ["model_name"] = "QueenslanderFoodWaterBowl",
        ["image_id"] = 15682379695
    },
    ["queenslander_bed"] = {
        ["name"] = "Queensland Bed",
        ["cost"] = 102,
        ["model_name"] = "QueenslanderBed",
        ["image_id"] = 15682383024
    },
    ["queenslander_pet_bed"] = {
        ["name"] = "Queensland Pet Bed",
        ["cost"] = 98,
        ["model_name"] = "QueenslanderPetBed",
        ["image_id"] = 15682385723
    },
    ["queenslander_shower"] = {
        ["name"] = "Queensland Shower",
        ["cost"] = 163,
        ["model_name"] = "QueenslanderShower",
        ["image_id"] = 15682388489
    },
    ["queenslander_wall_inner_corner"] = {
        ["name"] = "Queensland Wall: Inner Corner",
        ["cost"] = 10,
        ["model_name"] = "QueenslanderWallInnerCorner",
        ["image_id"] = 15682391295
    },
    ["queenslander_wall_straight"] = {
        ["name"] = "Queensland Wall: Straight",
        ["cost"] = 8,
        ["model_name"] = "QueenslanderWallStraight",
        ["image_id"] = 15682394310
    },
    ["queenslander_paradise_plant"] = {
        ["name"] = "Queensland Paradise Plant",
        ["cost"] = 19,
        ["model_name"] = "QueenslanderParadisePlant",
        ["image_id"] = 15682397640
    },
    ["queenslander_sliding_door"] = {
        ["name"] = "Queensland Sliding Door",
        ["cost"] = 21,
        ["model_name"] = "QueenslanderSlidingDoor",
        ["image_id"] = 15682399974,
        ["behavior"] = v1("FurnitureUseHelperDB").INTERIOR_SLIDING_DOOR()
    },
    ["queenslander_wall_outer_corner"] = {
        ["name"] = "Queensland Wall: Outer Corner",
        ["cost"] = 10,
        ["model_name"] = "QueenslanderWallOuterCorner",
        ["image_id"] = 15682402860
    },
    ["queenslander_fridge"] = {
        ["name"] = "Queensland Fridge",
        ["cost"] = 64,
        ["model_name"] = "QueenslanderFridge",
        ["image_id"] = 15682405990
    },
    ["queenslander_door_frame"] = {
        ["name"] = "Queensland Door Frame",
        ["cost"] = 13,
        ["model_name"] = "QueenslanderDoorFrame",
        ["image_id"] = 15682408578
    },
    ["queenslander_rubber_tree"] = {
        ["name"] = "Queensland Rubber Tree",
        ["cost"] = 27,
        ["model_name"] = "QueenslanderRubberTree",
        ["image_id"] = 15682411517
    }
}
for _, v4 in v3 do
    v4.tags = { "QueenslanderHouse2024" }
end
return v2.furniture(v3)