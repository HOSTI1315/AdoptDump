--// ReplicatedStorage.SharedModules.ContentPacks.DisplayStands2023.Furniture (ModuleScript)

local v1 = {
    ["display_stands_2023_pet_display"] = {
        ["name"] = "Pet Display",
        ["model_name"] = "DisplayStands2023PetDisplay",
        ["image_id"] = 13252784307,
        ["cost"] = 700,
        ["layout_order"] = 9104,
        ["tags"] = { "DisplayStand", "DisplayStands2023", "Stand" }
    },
    ["display_stands_2023_vehicle_display"] = {
        ["name"] = "Vehicle Display",
        ["model_name"] = "DisplayStands2023VehicleDisplay",
        ["image_id"] = 13252782365,
        ["cost"] = 800,
        ["layout_order"] = 9105,
        ["tags"] = { "DisplayStand", "DisplayStands2023", "Stand" }
    },
    ["display_stands_2023_holdables_display"] = {
        ["name"] = "Holdables Display",
        ["model_name"] = "DisplayStands2023HoldablesDisplay",
        ["image_id"] = 13252782976,
        ["cost"] = 200,
        ["layout_order"] = 9102,
        ["tags"] = { "DisplayStand", "DisplayStands2023", "Stand" }
    },
    ["display_stands_2023_stroller_display"] = {
        ["name"] = "Stroller Display",
        ["model_name"] = "DisplayStands2023StrollerDisplay",
        ["image_id"] = 13252783651,
        ["cost"] = 300,
        ["layout_order"] = 9103,
        ["tags"] = { "DisplayStand", "DisplayStands2023", "Stand" }
    },
    ["display_stands_2023_accessory_display"] = {
        ["name"] = "Accessory Display",
        ["model_name"] = "DisplayStands2023AccessoryDisplay",
        ["image_id"] = 13252785134,
        ["cost"] = 250,
        ["layout_order"] = 9101,
        ["tags"] = { "DisplayStand", "DisplayStands2023", "Stand" }
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)