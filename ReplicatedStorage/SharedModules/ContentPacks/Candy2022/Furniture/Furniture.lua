--// ReplicatedStorage.SharedModules.ContentPacks.Candy2022.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["candy_2022_gumball_machine_shower"] = {
        ["name"] = "Gumball Shower",
        ["cost"] = 193,
        ["model_name"] = "Candy2022GumballMachineShower",
        ["image_id"] = 10626204826
    },
    ["candy_2022_lollipop_lamp"] = {
        ["name"] = "Lollipop Lamp",
        ["cost"] = 44,
        ["model_name"] = "Candy2022LollipopLamp",
        ["image_id"] = 10626222200
    },
    ["candy_2022_melted_ice_cream_pet_bed"] = {
        ["name"] = "Melted Ice Cream Pet Bed",
        ["cost"] = 125,
        ["model_name"] = "Candy2022MeltedIceCreamPetBed",
        ["image_id"] = 10626222305
    },
    ["candy_2022_ice_cream_cone_food_bowl"] = {
        ["name"] = "Ice Cream Cone Pet Food Bowl",
        ["cost"] = 124,
        ["model_name"] = "Candy2022IceCreamConeFoodBowl",
        ["image_id"] = 10626204954
    },
    ["candy_2022_ice_cream_cone_water_bowl"] = {
        ["name"] = "Ice Cream Cone Pet Water Bowl",
        ["cost"] = 126,
        ["model_name"] = "Candy2022IceCreamConeWaterBowl",
        ["image_id"] = 10626222072
    },
    ["candy_2022_gumball_machine_crib"] = {
        ["name"] = "Gumball Crib",
        ["cost"] = 176,
        ["model_name"] = "Candy2022GumballMachineCrib",
        ["image_id"] = 10626204718
    },
    ["candy_2022_chocolate_cake_parent_bed"] = {
        ["name"] = "Chocolate Cake Bed",
        ["cost"] = 135,
        ["model_name"] = "Candy2022ChocolateCakeParentBed",
        ["image_id"] = 10626204601
    },
    ["candy_2022_candy_fridge"] = {
        ["name"] = "Candy Fridge",
        ["cost"] = 170,
        ["model_name"] = "Candy2022CandyFridge",
        ["image_id"] = 10626204471
    },
    ["candy_2022_candy_chair"] = {
        ["name"] = "Candy Chair",
        ["cost"] = 37,
        ["model_name"] = "Candy2022CandyChair",
        ["image_id"] = 10626204341
    },
    ["candy_2022_peppermint_table"] = {
        ["name"] = "Peppermint Table",
        ["cost"] = 27,
        ["model_name"] = "Candy2022PeppermintTable",
        ["image_id"] = 10626222444
    }
}
for _, v3 in pairs(v2) do
    v3.tags = { "Candy2022" }
end
return v1.furniture(v2)