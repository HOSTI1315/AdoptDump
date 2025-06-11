--// ReplicatedStorage.SharedModules.ContentPacks.Birthday2022.Furniture (ModuleScript)

local v1 = {
    ["birthday_2022_botanical_pet_food_bowl"] = {
        ["name"] = "Botanical Pet Food Bowl",
        ["cost"] = 100,
        ["model_name"] = "Birthday2022BotanicalPetFoodBowl",
        ["image_id"] = 10383531124,
        ["tags"] = { "Botanical2022Placeable" }
    },
    ["birthday_2022_botanical_pet_water_bowl"] = {
        ["name"] = "Botanical Pet Water Bowl",
        ["cost"] = 100,
        ["model_name"] = "Birthday2022BotanicalPetWaterBowl",
        ["image_id"] = 10383531870,
        ["tags"] = { "Botanical2022Placeable" }
    },
    ["birthday_2022_botanical_pet_bed"] = {
        ["name"] = "Botanical Pet Bed",
        ["cost"] = 320,
        ["model_name"] = "Birthday2022BotanicalPetBed",
        ["image_id"] = 10324436615,
        ["tags"] = { "Botanical2022Placeable" }
    },
    ["birthday_2022_botanical_crib"] = {
        ["name"] = "Botanical Crib",
        ["cost"] = 330,
        ["model_name"] = "Birthday2022BotanicalCrib",
        ["image_id"] = 10324431094,
        ["tags"] = { "Botanical2022Placeable" }
    },
    ["birthday_2022_botanical_bed"] = {
        ["name"] = "Botanical Bed",
        ["cost"] = 300,
        ["model_name"] = "Birthday2022BotanicalBed",
        ["image_id"] = 10324435628,
        ["tags"] = { "Botanical2022Placeable" }
    },
    ["birthday_2022_botanical_fridge"] = {
        ["name"] = "Botanical Fridge",
        ["cost"] = 90,
        ["model_name"] = "Birthday2022BotanicalFridge",
        ["image_id"] = 10324433514,
        ["tags"] = { "Botanical2022Placeable" }
    },
    ["birthday_2022_botanical_shower"] = {
        ["name"] = "Botanical Shower",
        ["cost"] = 170,
        ["model_name"] = "Birthday2022BotanicalShower",
        ["image_id"] = 10324432071,
        ["tags"] = { "Botanical2022Placeable" }
    },
    ["birthday_2022_botanical_chair"] = {
        ["name"] = "Botanical Chair",
        ["cost"] = 70,
        ["model_name"] = "Birthday2022BotanicalChair",
        ["image_id"] = 10324429474,
        ["tags"] = { "Botanical2022Placeable" }
    },
    ["birthday_2022_botanical_table"] = {
        ["name"] = "Botanical Table",
        ["cost"] = 50,
        ["model_name"] = "Birthday2022BotanicalTable",
        ["image_id"] = 10324438821,
        ["tags"] = { "Botanical2022Placeable" }
    },
    ["birthday_2022_botanical_lamp"] = {
        ["name"] = "Botanical Lamp",
        ["cost"] = 40,
        ["model_name"] = "Birthday2022BotanicalLamp",
        ["image_id"] = 10324434548,
        ["tags"] = { "Botanical2022Placeable" }
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)