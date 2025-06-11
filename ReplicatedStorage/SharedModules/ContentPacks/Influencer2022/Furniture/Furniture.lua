--// ReplicatedStorage.SharedModules.ContentPacks.Influencer2022.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["influencer_2022_automatic_feeder"] = {
        ["name"] = "Influencer Automatic Feeder",
        ["cost"] = 146,
        ["model_name"] = "Influencer2022AutomaticFeeder",
        ["image_id"] = 10635825345
    },
    ["influencer_2022_ergonomic_chair"] = {
        ["name"] = "Influencer Ergonomic Chair",
        ["cost"] = 53,
        ["model_name"] = "Influencer2022ErgonomicChair",
        ["image_id"] = 10635825466
    },
    ["influencer_2022_bed"] = {
        ["name"] = "Influencer Bed",
        ["cost"] = 148,
        ["model_name"] = "Influencer2022Bed",
        ["image_id"] = 10635825615
    },
    ["influencer_2022_crib"] = {
        ["name"] = "Influencer Crib",
        ["cost"] = 107,
        ["model_name"] = "Influencer2022Crib",
        ["image_id"] = 10635825789
    },
    ["influencer_2022_pet_bed"] = {
        ["name"] = "Influencer Pet Bed",
        ["cost"] = 143,
        ["model_name"] = "Influencer2022PetBed",
        ["image_id"] = 10635825938
    },
    ["influencer_2022_shower"] = {
        ["name"] = "Influencer Shower",
        ["cost"] = 185,
        ["model_name"] = "Influencer2022Shower",
        ["image_id"] = 10635826061
    },
    ["influencer_2022_neon_light_strip"] = {
        ["name"] = "Influencer Neon Light Strip",
        ["cost"] = 35,
        ["model_name"] = "Influencer2022NeonLightStrip",
        ["image_id"] = 10635840879
    },
    ["influencer_2022_stainless_steel_fridge"] = {
        ["name"] = "Influencer Stainless Steel Fridge",
        ["cost"] = 155,
        ["model_name"] = "Influencer2022StainlessSteelFridge",
        ["image_id"] = 10635841047
    },
    ["influencer_2022_standing_desk"] = {
        ["name"] = "Influencer Standing Desk",
        ["cost"] = 80,
        ["model_name"] = "Influencer2022StandingDesk",
        ["image_id"] = 10635841258
    },
    ["influencer_2022_water_fountain"] = {
        ["name"] = "Influencer Water Fountain",
        ["cost"] = 105,
        ["model_name"] = "Influencer2022WaterFountain",
        ["image_id"] = 10635841376
    },
    ["influencer_2022_camera_and_tripod"] = {
        ["name"] = "Camera and Tripod",
        ["model_name"] = "Influencer2022CameraAndTripod"
    }
}
for _, v3 in v2 do
    if v3.cost then
        v3.tags = { "Influencer2022" }
    end
end
return v1.furniture(v2)