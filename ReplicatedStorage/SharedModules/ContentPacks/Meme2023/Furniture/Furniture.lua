--// ReplicatedStorage.SharedModules.ContentPacks.Meme2023.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["meme_2023_inflated_shower"] = {
        ["cost"] = 165,
        ["image_id"] = 12345311328,
        ["model_name"] = "Meme2023InflatedShower",
        ["name"] = "Inflated Shower"
    },
    ["meme_2023_inflated_fridge"] = {
        ["cost"] = 85,
        ["image_id"] = 12345305547,
        ["model_name"] = "Meme2023InflatedFridge",
        ["name"] = "Inflated Fridge"
    },
    ["meme_2023_crash_mat_bed"] = {
        ["cost"] = 110,
        ["image_id"] = 12345303444,
        ["model_name"] = "Meme2023CrashMatBed",
        ["name"] = "Crash Mat Bed"
    },
    ["meme_2023_inflated_pit_crib"] = {
        ["cost"] = 75,
        ["image_id"] = 12345306909,
        ["model_name"] = "Meme2023InflatedPitCrib",
        ["name"] = "Inflated PitCrib"
    },
    ["meme_2023_padded_pet_bed"] = {
        ["cost"] = 88,
        ["image_id"] = 12345306196,
        ["model_name"] = "Meme2023PaddedPetBed",
        ["name"] = "Padded Pet Bed"
    },
    ["meme_2023_inflated_food_bowl"] = {
        ["cost"] = 87,
        ["image_id"] = 12345304914,
        ["model_name"] = "Meme2023InflatedFoodBowl",
        ["name"] = "Inflated Food Bowl"
    },
    ["meme_2023_inflated_water_bowl"] = {
        ["cost"] = 87,
        ["image_id"] = 12345312151,
        ["model_name"] = "Meme2023InflatedWaterBowl",
        ["name"] = "Inflated Water Bowl"
    },
    ["meme_2023_bouncy_ball"] = {
        ["cost"] = 150,
        ["image_id"] = 12345302183,
        ["model_name"] = "Meme2023BouncyBall",
        ["name"] = "Bouncy Ball"
    },
    ["meme_2023_padded_arrow_sign"] = {
        ["cost"] = 40,
        ["image_id"] = 12345312578,
        ["model_name"] = "Meme2023PaddedArrowSign",
        ["name"] = "Padded Arrow Sign"
    },
    ["meme_2023_padded_danger_sign"] = {
        ["cost"] = 45,
        ["image_id"] = 12345315816,
        ["model_name"] = "Meme2023PaddedDangerSign",
        ["name"] = "Padded Danger Sign"
    },
    ["meme_2023_padded_cube"] = {
        ["cost"] = 80,
        ["image_id"] = 12345313019,
        ["model_name"] = "Meme2023PaddedCube",
        ["name"] = "Padded Cube"
    },
    ["meme_2023_padded_mat"] = {
        ["cost"] = 90,
        ["image_id"] = 12345316108,
        ["model_name"] = "Meme2023PaddedMat",
        ["name"] = "Padded Mat"
    },
    ["meme_2023_padded_wedge"] = {
        ["cost"] = 100,
        ["image_id"] = 12345317914,
        ["model_name"] = "Meme2023PaddedWedge",
        ["name"] = "Padded Wedge"
    },
    ["meme_2023_padded_cylinder"] = {
        ["cost"] = 110,
        ["image_id"] = 12345315124,
        ["model_name"] = "Meme2023PaddedCylinder",
        ["name"] = "Padded Cylinder"
    },
    ["meme_2023_inflated_trampoline"] = {
        ["cost"] = 450,
        ["image_id"] = 12345311676,
        ["model_name"] = "Meme2023InflatedTrampoline",
        ["name"] = "Inflated Trampoline"
    },
    ["meme_2023_finish_line_checkered_rug"] = {
        ["cost"] = 47,
        ["image_id"] = 12345302812,
        ["model_name"] = "Meme2023FinishLineCheckeredRug",
        ["name"] = "Finish Line Checkered Rug"
    },
    ["meme_2023_inflated_conveyor_belt"] = {
        ["cost"] = 400,
        ["image_id"] = 12345304198,
        ["model_name"] = "Meme2023InflatedConveyorBelt",
        ["name"] = "Inflated Conveyor Belt"
    },
    ["meme_2023_padded_punchy"] = {
        ["cost"] = 425,
        ["image_id"] = 12345317546,
        ["model_name"] = "Meme2023PaddedPunchy",
        ["name"] = "Padded Punchy"
    },
    ["meme_2023_inflated_archway"] = {
        ["cost"] = 300,
        ["image_id"] = 12345303880,
        ["model_name"] = "Meme2023InflatedArchway",
        ["name"] = "Inflated Archway"
    }
}
for _, v3 in v2 do
    if v3.cost then
        v3.tags = { "Meme2023Placeable" }
    end
end
return v1.furniture(v2)