--// ReplicatedStorage.SharedModules.ContentPacks.Hamstertime2024.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("EntryHelper")
local v3 = v1("FurnitureUseHelperDB")
local v4 = v1("NPCHelper")
local v5 = {
    ["hamstertime_2024_volcanic_accessory_display"] = {
        ["name"] = "Volcanic Accessory Display",
        ["model_name"] = "Hamstertime2024VolcanicAccessoryDisplay",
        ["image_id"] = 16547191737,
        ["cost"] = 375,
        ["layout_order"] = 1201,
        ["behavior"] = v3.DISPLAY_STAND("pet_accessory")
    },
    ["hamstertime_2024_volcanic_holdables_display"] = {
        ["name"] = "Volcanic Holdables Display",
        ["model_name"] = "Hamstertime2024VolcanicHoldablesDisplay",
        ["image_id"] = 16547240490,
        ["cost"] = 300,
        ["layout_order"] = 1202,
        ["behavior"] = v3.DISPLAY_STAND("holdable")
    },
    ["hamstertime_2024_volcanic_stroller_display"] = {
        ["name"] = "Volcanic Stroller Display",
        ["model_name"] = "Hamstertime2024VolcanicStrollerDisplay",
        ["image_id"] = 16547448897,
        ["cost"] = 450,
        ["layout_order"] = 1203,
        ["behavior"] = v3.DISPLAY_STAND("stroller")
    },
    ["hamstertime_2024_volcanic_pet_display"] = {
        ["name"] = "Volcanic Pet Display",
        ["model_name"] = "Hamstertime2024VolcanicPetDisplay",
        ["image_id"] = 16547357671,
        ["cost"] = 1050,
        ["layout_order"] = 1204,
        ["behavior"] = v3.DISPLAY_STAND("pet")
    },
    ["hamstertime_2024_volcanic_vehicle_display"] = {
        ["name"] = "Volcanic Vehicle Display",
        ["model_name"] = "Hamstertime2024VolcanicVehicleDisplay",
        ["image_id"] = 16547370516,
        ["cost"] = 1200,
        ["layout_order"] = 1205,
        ["behavior"] = v3.DISPLAY_STAND("vehicle")
    },
    ["hamstertime_2024_glacial_accessory_display"] = {
        ["name"] = "Glacial Accessory Display",
        ["model_name"] = "Hamstertime2024GlacialAccessoryDisplay",
        ["image_id"] = 16547968657,
        ["cost"] = 375,
        ["layout_order"] = 1301,
        ["behavior"] = v3.DISPLAY_STAND("pet_accessory")
    },
    ["hamstertime_2024_glacial_holdables_display"] = {
        ["name"] = "Glacial Holdables Display",
        ["model_name"] = "Hamstertime2024GlacialHoldablesDisplay",
        ["image_id"] = 16547967199,
        ["cost"] = 300,
        ["layout_order"] = 1302,
        ["behavior"] = v3.DISPLAY_STAND("holdable")
    },
    ["hamstertime_2024_glacial_stroller_display"] = {
        ["name"] = "Glacial Stroller Display",
        ["model_name"] = "Hamstertime2024GlacialStrollerDisplay",
        ["image_id"] = 16548009729,
        ["cost"] = 450,
        ["layout_order"] = 1303,
        ["behavior"] = v3.DISPLAY_STAND("stroller")
    },
    ["hamstertime_2024_glacial_pet_display"] = {
        ["name"] = "Glacial Pet Display",
        ["model_name"] = "Hamstertime2024GlacialPetDisplay",
        ["image_id"] = 16547963567,
        ["cost"] = 1050,
        ["layout_order"] = 1304,
        ["behavior"] = v3.DISPLAY_STAND("pet")
    },
    ["hamstertime_2024_glacial_vehicle_display"] = {
        ["name"] = "Glacial Vehicle Display",
        ["model_name"] = "Hamstertime2024GlacialVehicleDisplay",
        ["image_id"] = 16548013228,
        ["cost"] = 1200,
        ["layout_order"] = 1305,
        ["behavior"] = v3.DISPLAY_STAND("vehicle")
    },
    ["hamstertime_2024_royal_accessory_display"] = {
        ["name"] = "Royal Accessory Display",
        ["model_name"] = "Hamstertime2024RoyalAccessoryDisplay",
        ["image_id"] = 16548296796,
        ["cost"] = 500,
        ["layout_order"] = 1101,
        ["behavior"] = v3.DISPLAY_STAND("pet_accessory")
    },
    ["hamstertime_2024_royal_holdables_display"] = {
        ["name"] = "Royal Holdables Display",
        ["model_name"] = "Hamstertime2024RoyalHoldablesDisplay",
        ["image_id"] = 16548295500,
        ["cost"] = 400,
        ["layout_order"] = 1102,
        ["behavior"] = v3.DISPLAY_STAND("holdable")
    },
    ["hamstertime_2024_royal_stroller_display"] = {
        ["name"] = "Royal Stroller Display",
        ["model_name"] = "Hamstertime2024RoyalStrollerDisplay",
        ["image_id"] = 16548300612,
        ["cost"] = 600,
        ["layout_order"] = 1103,
        ["behavior"] = v3.DISPLAY_STAND("stroller")
    },
    ["hamstertime_2024_royal_pet_display"] = {
        ["name"] = "Royal Pet Display",
        ["model_name"] = "Hamstertime2024RoyalPetDisplay",
        ["image_id"] = 16548305359,
        ["cost"] = 1400,
        ["layout_order"] = 1104,
        ["behavior"] = v3.DISPLAY_STAND("pet")
    },
    ["hamstertime_2024_royal_vehicle_display"] = {
        ["name"] = "Royal Vehicle Display",
        ["model_name"] = "Hamstertime2024RoyalVehicleDisplay",
        ["image_id"] = 16548304024,
        ["cost"] = 1600,
        ["layout_order"] = 1105,
        ["behavior"] = v3.DISPLAY_STAND("vehicle")
    }
}
local v6 = {
    ["hamstertime_2024_niles"] = {
        ["name"] = "Niles",
        ["model_name"] = "Hamstertime2024Niles",
        ["behavior"] = v4.NPC_SIMPLE("hamstertime_2024_niles")
    }
}
local v7 = {}
for v8, v9 in v5 do
    v9.tags = { "DisplayStand", "DisplayStands2024", "Stand" }
    v7[v8] = v9
end
for v10, v11 in v6 do
    v7[v10] = v11
end
return v2.furniture(v7)