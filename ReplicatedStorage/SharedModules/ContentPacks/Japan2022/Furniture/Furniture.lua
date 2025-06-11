--// ReplicatedStorage.SharedModules.ContentPacks.Japan2022.Furniture (ModuleScript)

local v1 = {
    ["japan_2022_japanese_food_bowl"] = {
        ["name"] = "Japanese Pet Food Bowl",
        ["cost"] = 124,
        ["rarity"] = "uncommon",
        ["model_name"] = "Japan2022JapaneseFoodBowl",
        ["image_id"] = 10467811418,
        ["tags"] = { "Japan2022Placeable" }
    },
    ["japan_2022_japanese_water_bowl"] = {
        ["name"] = "Japanese Pet Water Bowl",
        ["cost"] = 126,
        ["rarity"] = "uncommon",
        ["model_name"] = "Japan2022JapaneseWaterBowl",
        ["image_id"] = 10467811944,
        ["tags"] = { "Japan2022Placeable" }
    },
    ["japan_2022_japanese_pet_bed"] = {
        ["name"] = "Japanese Pet Bed",
        ["cost"] = 165,
        ["rarity"] = "uncommon",
        ["model_name"] = "Japan2022JapanesePetBed",
        ["image_id"] = 10467812268,
        ["tags"] = { "Japan2022Placeable" }
    },
    ["japan_2022_japanese_crib"] = {
        ["name"] = "Japanese Crib",
        ["cost"] = 185,
        ["rarity"] = "uncommon",
        ["model_name"] = "Japan2022JapaneseCrib",
        ["image_id"] = 10467812735,
        ["tags"] = { "Japan2022Placeable" }
    },
    ["japan_2022_japanese_bed"] = {
        ["name"] = "Japanese Bed",
        ["cost"] = 149,
        ["rarity"] = "uncommon",
        ["model_name"] = "Japan2022JapaneseBed",
        ["image_id"] = 10467813400,
        ["tags"] = { "Japan2022Placeable" }
    },
    ["japan_2022_japanese_fridge"] = {
        ["name"] = "Japanese Fridge",
        ["cost"] = 123,
        ["rarity"] = "uncommon",
        ["model_name"] = "Japan2022JapaneseFridge",
        ["image_id"] = 10489706323,
        ["tags"] = { "Japan2022Placeable" }
    },
    ["japan_2022_japanese_shower"] = {
        ["name"] = "Japanese Shower",
        ["cost"] = 197,
        ["rarity"] = "uncommon",
        ["model_name"] = "Japan2022JapaneseShower",
        ["image_id"] = 10467816341,
        ["tags"] = { "Japan2022Placeable" }
    },
    ["japan_2022_japanese_bench"] = {
        ["name"] = "Japanese Bench",
        ["cost"] = 75,
        ["rarity"] = "uncommon",
        ["model_name"] = "Japan2022JapaneseBench",
        ["image_id"] = 10467821210,
        ["tags"] = { "Japan2022Placeable" }
    },
    ["japan_2022_japanese_tea_table"] = {
        ["name"] = "Japanese Tea Table",
        ["cost"] = 75,
        ["rarity"] = "uncommon",
        ["model_name"] = "Japan2022JapaneseTeaTable",
        ["image_id"] = 10467820213,
        ["tags"] = { "Japan2022Placeable" }
    },
    ["japan_2022_japanese_lamp"] = {
        ["name"] = "Japanese Lamp",
        ["cost"] = 49,
        ["rarity"] = "uncommon",
        ["model_name"] = "Japan2022JapaneseLamp",
        ["image_id"] = 10467823050,
        ["tags"] = { "Japan2022Placeable" }
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)