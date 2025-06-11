--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2024.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("EntryHelper")
local v3 = v1("FurnitureUseHelperDB")
local v4 = {
    ["lunar_2024_korean_food_bowl"] = {
        ["name"] = "Korean Food Bowl",
        ["cost"] = 122,
        ["model_name"] = "LNY2024KoreanFoodBowl",
        ["image_id"] = 16189706962
    },
    ["lunar_2024_korean_water_bowl"] = {
        ["name"] = "Korean Water Bowl",
        ["cost"] = 122,
        ["model_name"] = "LNY2024KoreanWaterBowl",
        ["image_id"] = 16189722449
    },
    ["lunar_2024_korean_pet_bed"] = {
        ["name"] = "Korean Pet Bed",
        ["cost"] = 135,
        ["model_name"] = "LNY2024KoreanPetBed",
        ["image_id"] = 16212067304
    },
    ["lunar_2024_korean_crib"] = {
        ["name"] = "Korean Crib",
        ["cost"] = 175,
        ["model_name"] = "LNY2024KoreanCrib",
        ["image_id"] = 16189706590
    },
    ["lunar_2024_korean_bed"] = {
        ["name"] = "Korean Bed",
        ["cost"] = 195,
        ["model_name"] = "LNY2024KoreanBed",
        ["image_id"] = 16189706432
    },
    ["lunar_2024_korean_shower"] = {
        ["name"] = "Korean Shower",
        ["cost"] = 180,
        ["model_name"] = "LNY2024KoreanShower",
        ["image_id"] = 16189722357
    },
    ["lunar_2024_korean_fridge"] = {
        ["name"] = "Korean Fridge",
        ["cost"] = 210,
        ["model_name"] = "LNY2024KoreanFridge",
        ["image_id"] = 16189722059
    },
    ["lunar_2024_korean_screen"] = {
        ["name"] = "Korean Screen",
        ["cost"] = 89,
        ["model_name"] = "LNY2024KoreanScreen",
        ["image_id"] = 16189722274
    },
    ["lunar_2024_korean_floor_seat"] = {
        ["name"] = "Korean Floor Seat",
        ["cost"] = 47,
        ["model_name"] = "LNY2024KoreanFloorSeat",
        ["image_id"] = 16189706828
    },
    ["lunar_2024_korean_ceiling_light"] = {
        ["name"] = "Korean Ceiling Light",
        ["cost"] = 39,
        ["model_name"] = "LNY2024KoreanCeilingLight",
        ["image_id"] = 16189706498,
        ["behavior"] = v3.LIGHT("LNY2024KoreanCeilingLight")
    },
    ["lunar_2024_korean_floor_lamp"] = {
        ["name"] = "Korean Floor Lamp",
        ["cost"] = 45,
        ["model_name"] = "LNY2024KoreanFloorLamp",
        ["image_id"] = 16189706723,
        ["behavior"] = v3.LIGHT("LNY2024KoreanFloorLamp")
    },
    ["lunar_2024_korean_low_table"] = {
        ["name"] = "Korean Low Table",
        ["cost"] = 52,
        ["model_name"] = "LNY2024KoreanLowTable",
        ["image_id"] = 16189722134
    }
}
for _, v5 in v4 do
    v5.tags = { "LNY2024" }
end
return v2.furniture(v4)