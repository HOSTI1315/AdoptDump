--// ReplicatedStorage.SharedModules.ContentPacks.VIP2022.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["vip_house_2022_bed"] = {
        ["name"] = "VVIP Bed",
        ["cost"] = 330,
        ["model_name"] = "VIPHouse2022Bed",
        ["image_id"] = 9863966195
    },
    ["vip_house_2022_cabinet"] = {
        ["name"] = "VVIP Cabinet",
        ["cost"] = 180,
        ["model_name"] = "VIPHouse2022Cabinet",
        ["image_id"] = 9863966353
    },
    ["vip_house_2022_corner_cabinet"] = {
        ["name"] = "VVIP Corner Cabinet",
        ["cost"] = 150,
        ["model_name"] = "VIPHouse2022CornerCabinet",
        ["image_id"] = 9863966461
    },
    ["vip_house_2022_crib"] = {
        ["name"] = "VVIP Crib",
        ["cost"] = 450,
        ["model_name"] = "VIPHouse2022Crib",
        ["image_id"] = 9863966611
    },
    ["vip_house_2022_end_table"] = {
        ["name"] = "VVIP End Table",
        ["cost"] = 150,
        ["model_name"] = "VIPHouse2022EndTable",
        ["image_id"] = 9863966736
    },
    ["vip_house_2022_food_bowl"] = {
        ["name"] = "VVIP Pet Food Bowl",
        ["cost"] = 255,
        ["model_name"] = "VIPHouse2022FoodBowl",
        ["image_id"] = 9863966781
    },
    ["vip_house_2022_fridge"] = {
        ["name"] = "VVIP Fridge",
        ["cost"] = 250,
        ["model_name"] = "VIPHouse2022Fridge",
        ["image_id"] = 9863974901
    },
    ["vip_house_2022_pet_bed"] = {
        ["name"] = "VVIP Pet Bed",
        ["cost"] = 425,
        ["model_name"] = "VIPHouse2022PetBed",
        ["image_id"] = 9863975030
    },
    ["vip_house_2022_shower"] = {
        ["name"] = "VVIP Shower",
        ["cost"] = 350,
        ["model_name"] = "VIPHouse2022Shower",
        ["image_id"] = 9863975145
    },
    ["vip_house_2022_sink"] = {
        ["name"] = "VVIP Sink",
        ["cost"] = 30,
        ["model_name"] = "VIPHouse2022Sink",
        ["image_id"] = 9863975214
    },
    ["vip_house_2022_sofa_corner"] = {
        ["name"] = "VVIP Corner Sofa",
        ["cost"] = 108,
        ["model_name"] = "VIPHouse2022SofaCorner",
        ["image_id"] = 9863975269
    },
    ["vip_house_2022_sofa_single"] = {
        ["name"] = "VVIP Sofa Section",
        ["cost"] = 109,
        ["model_name"] = "VIPHouse2022SofaSingle",
        ["image_id"] = 9863975317
    },
    ["vip_house_2022_sofa_double"] = {
        ["name"] = "VVIP Double Sofa",
        ["cost"] = 140,
        ["model_name"] = "VIPHouse2022SofaDouble",
        ["image_id"] = 9863975389
    },
    ["vip_house_2022_wall_art"] = {
        ["name"] = "VVIP Modern Wall Art",
        ["cost"] = 240,
        ["model_name"] = "VIPHouse2022WallArt",
        ["image_id"] = 9863975509
    },
    ["vip_house_2022_water_bowl"] = {
        ["name"] = "VVIP Pet Water Bowl",
        ["cost"] = 255,
        ["model_name"] = "VIPHouse2022WaterBowl",
        ["image_id"] = 9863975583
    },
    ["vip_2022_lounge_chair"] = {
        ["name"] = "VIP Lounge Chair",
        ["model_name"] = "VIP2022LoungeChair"
    },
    ["vip_2022_lounge_l_shaped_sofa"] = {
        ["name"] = "VIP Lounge L-Shaped Sofa",
        ["model_name"] = "VIP2022LoungeLShapedSofa"
    },
    ["vip_2022_balcony_chair"] = {
        ["name"] = "VIP Balcony Chair",
        ["model_name"] = "VIP2022BalconyChair"
    },
    ["vip_2022_balcony_sofa"] = {
        ["name"] = "VIP Balcony Sofa",
        ["model_name"] = "VIP2022BalconySofa"
    },
    ["vip_2022_chow_chow_light_brown"] = {
        ["name"] = "Chow Chow Light Brown",
        ["model_name"] = "VIP2022ChowChowLightBrown"
    },
    ["vip_2022_chow_chow_dark_brown"] = {
        ["name"] = "Chow Chow Dark Brown",
        ["model_name"] = "VIP2022ChowChowDarkBrown"
    },
    ["vip_2022_chow_chow_black"] = {
        ["name"] = "Chow Chow Black",
        ["model_name"] = "VIP2022ChowChowBlack"
    },
    ["vip_2022_chow_chow_gold"] = {
        ["name"] = "Chow Chow Gold",
        ["model_name"] = "VIP2022ChowChowGold"
    }
}
for _, v3 in pairs(v2) do
    if v3.cost then
        v3.tags = { "VIP2022" }
    end
end
return v1.furniture(v2)