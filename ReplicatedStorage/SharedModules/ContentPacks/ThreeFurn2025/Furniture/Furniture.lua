--// ReplicatedStorage.SharedModules.ContentPacks.ThreeFurn2025.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("EntryHelper")
local v3 = v1("FurnitureUseHelperDB")
local v4 = v1("package:Sift")
local v5 = {
    ["threefurn_2025_valentine_food_bowl"] = {
        ["name"] = "Valentine Food Bowl",
        ["cost"] = 129,
        ["model_name"] = "ThreeFurn2025ValentineFoodBowl",
        ["image_id"] = 118739882667574
    },
    ["threefurn_2025_valentine_water_bowl"] = {
        ["name"] = "Valentine Water Bowl",
        ["cost"] = 129,
        ["model_name"] = "ThreeFurn2025ValentineWaterBowl",
        ["image_id"] = 126106460184869
    },
    ["threefurn_2025_valentine_pet_bed"] = {
        ["name"] = "Valentine Pet Bed",
        ["cost"] = 170,
        ["model_name"] = "ThreeFurn2025ValentinePetBed",
        ["image_id"] = 77189085556099
    },
    ["threefurn_2025_valentine_crib"] = {
        ["name"] = "Valentine Crib",
        ["cost"] = 290,
        ["model_name"] = "ThreeFurn2025ValentineCrib",
        ["image_id"] = 104784184054267
    },
    ["threefurn_2025_valentine_bed"] = {
        ["name"] = "Valentine Bed",
        ["cost"] = 198,
        ["model_name"] = "ThreeFurn2025ValentineBed",
        ["image_id"] = 138055272589373
    },
    ["threefurn_2025_valentine_fridge"] = {
        ["name"] = "Valentine Fridge",
        ["cost"] = 65,
        ["model_name"] = "ThreeFurn2025ValentineFridge",
        ["image_id"] = 117405778792363
    },
    ["threefurn_2025_valentine_balloons"] = {
        ["name"] = "Valentine Balloons",
        ["cost"] = 75,
        ["model_name"] = "ThreeFurn2025ValentineBalloons",
        ["image_id"] = 72574742351349
    },
    ["threefurn_2025_heart_effects"] = {
        ["name"] = "Heart Effects",
        ["cost"] = 950,
        ["model_name"] = "ThreeFurn2025HeartEffects",
        ["image_id"] = 122701702848167
    },
    ["threefurn_2025_heart_bunting"] = {
        ["name"] = "Heart Bunting",
        ["cost"] = 33,
        ["model_name"] = "ThreeFurn2025HeartBunting",
        ["image_id"] = 90027063981863
    },
    ["threefurn_2025_heart_toilet"] = {
        ["name"] = "Heart Toilet",
        ["cost"] = 47,
        ["model_name"] = "ThreeFurn2025HeartToilet",
        ["image_id"] = 94921326354095
    }
}
local v6 = {
    ["threefurn_2025_crater_food_bowl"] = {
        ["name"] = "Crater Food Bowl",
        ["cost"] = 127,
        ["model_name"] = "ThreeFurn2025CraterFoodBowl",
        ["image_id"] = 106135515873770
    },
    ["threefurn_2025_crater_water_bowl"] = {
        ["name"] = "Crater Water Bowl",
        ["cost"] = 127,
        ["model_name"] = "ThreeFurn2025CraterWaterBowl",
        ["image_id"] = 71317594066381
    },
    ["threefurn_2025_ringed_planet_pet_bed"] = {
        ["name"] = "Ringed Planet Pet Bed",
        ["cost"] = 265,
        ["model_name"] = "ThreeFurn2025RingedPlanetPetBed",
        ["image_id"] = 97005873057809
    },
    ["threefurn_2025_satellite_crib"] = {
        ["name"] = "Satellite Crib",
        ["cost"] = 260,
        ["model_name"] = "ThreeFurn2025SatelliteCrib",
        ["image_id"] = 94264567657681
    },
    ["threefurn_2025_dreamchaser_bed"] = {
        ["name"] = "Dreamchaser Bed",
        ["cost"] = 255,
        ["model_name"] = "ThreeFurn2025DreamchaserBed",
        ["image_id"] = 118573276914578
    },
    ["threefurn_2025_space_shuttle_shower"] = {
        ["name"] = "Space Shuttle Shower",
        ["cost"] = 201,
        ["model_name"] = "ThreeFurn2025SpaceShuttleShower",
        ["image_id"] = 103330560759696
    },
    ["threefurn_2025_rocket_fridge"] = {
        ["name"] = "Rocket Fridge",
        ["cost"] = 198,
        ["model_name"] = "ThreeFurn2025RocketFridge",
        ["image_id"] = 110341845432691
    },
    ["threefurn_2025_moon_lamp"] = {
        ["name"] = "Moon Lamp",
        ["cost"] = 130,
        ["model_name"] = "ThreeFurn2025MoonLamp",
        ["image_id"] = 132852337834630,
        ["behavior"] = v3.LIGHT("ThreeFurn2025MoonLamp")
    },
    ["threefurn_2025_crater_pet_display"] = {
        ["name"] = "Crater Pet Display",
        ["cost"] = 1000,
        ["model_name"] = "ThreeFurn2025CraterPetDisplay",
        ["image_id"] = 119066582546622,
        ["tags"] = { "DisplayStand", "Stand", "Moon2025" },
        ["behavior"] = v3.DISPLAY_STAND("pet")
    },
    ["threefurn_2025_starfield_light"] = {
        ["name"] = "Starfield Light",
        ["cost"] = 550,
        ["model_name"] = "ThreeFurn2025StarfieldLight",
        ["image_id"] = 117710597362291
    },
    ["threefurn_2025_black_hole"] = {
        ["name"] = "Black Hole",
        ["cost"] = 1000,
        ["model_name"] = "ThreeFurn2025BlackHole",
        ["image_id"] = 72157737619492
    },
    ["threefurn_2025_crater_litter_box"] = {
        ["name"] = "Crater Litter Box",
        ["cost"] = 57,
        ["model_name"] = "ThreeFurn2025CraterLitterBox",
        ["image_id"] = 108815089545703
    }
}
local v7 = {
    ["threefurn_2025_neat_food_bowl"] = {
        ["name"] = "Neat Food Bowl",
        ["cost"] = 24,
        ["model_name"] = "ThreeFurn2025NeatFoodBowl",
        ["image_id"] = 89895133624058
    },
    ["threefurn_2025_neat_water_bowl"] = {
        ["name"] = "Neat Water Bowl",
        ["cost"] = 24,
        ["model_name"] = "ThreeFurn2025NeatWaterBowl",
        ["image_id"] = 106653962542506
    },
    ["threefurn_2025_comfy_pet_bed"] = {
        ["name"] = "Comfy Pet Bed",
        ["cost"] = 132,
        ["model_name"] = "ThreeFurn2025ComfyPetBed",
        ["image_id"] = 109239396319373
    },
    ["threefurn_2025_comfy_crib"] = {
        ["name"] = "Comfy Crib",
        ["cost"] = 65,
        ["model_name"] = "ThreeFurn2025ComfyCrib",
        ["image_id"] = 121183260311625
    },
    ["threefurn_2025_big_comfy_bed"] = {
        ["name"] = "Big Comfy Bed",
        ["cost"] = 91,
        ["model_name"] = "ThreeFurn2025BigComfyBed",
        ["image_id"] = 108905262535028
    },
    ["threefurn_2025_corner_shower"] = {
        ["name"] = "Corner Shower",
        ["cost"] = 220,
        ["model_name"] = "ThreeFurn2025CornerShower",
        ["image_id"] = 109025229721102
    },
    ["threefurn_2025_decorated_fridge"] = {
        ["name"] = "Decorated Fridge",
        ["cost"] = 205,
        ["model_name"] = "ThreeFurn2025DecoratedFridge",
        ["image_id"] = 71652844533054
    },
    ["threefurn_2025_comfy_sofa"] = {
        ["name"] = "Comfy Sofa",
        ["cost"] = 57,
        ["model_name"] = "ThreeFurn2025ComfySofa",
        ["image_id"] = 113131219297342
    },
    ["threefurn_2025_comfy_pillow_pile"] = {
        ["name"] = "Comfy Pillow Pile",
        ["cost"] = 28,
        ["model_name"] = "ThreeFurn2025ComfyPillowPile",
        ["image_id"] = 139660091635528
    },
    ["threefurn_2025_circular_ceiling_light"] = {
        ["name"] = "Circular Ceiling Light",
        ["cost"] = 43,
        ["model_name"] = "ThreeFurn2025CircularCeilingLight",
        ["image_id"] = 120661213244949,
        ["behavior"] = v3.LIGHT("ThreeFurn2025CircularCeilingLight")
    },
    ["threefurn_2025_tidy_litter_box"] = {
        ["name"] = "Tidy Litter Box",
        ["cost"] = 27,
        ["model_name"] = "ThreeFurn2025TidyLitterBox",
        ["image_id"] = 112489957972005
    }
}
for _, v8 in v5 do
    if not v8.tags then
        v8.tags = { "Valentines2025" }
    end
end
for _, v9 in v6 do
    if not v9.tags then
        v9.tags = { "Moon2025" }
    end
end
for _, v10 in v7 do
    if not v10.tags then
        v10.tags = { "Comfy2025" }
    end
end
return v2.furniture(v4.Dictionary.merge(v5, v6, v7))