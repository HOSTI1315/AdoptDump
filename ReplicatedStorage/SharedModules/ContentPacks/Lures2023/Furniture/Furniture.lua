--// ReplicatedStorage.SharedModules.ContentPacks.Lures2023.Furniture (ModuleScript)

local v1 = {
    ["lures_2023_normal_lure"] = {
        ["name"] = "Box Lure",
        ["model_name"] = "Lures2023NormalLure",
        ["cost"] = 0,
        ["tags"] = { "BasicLure", "Lures2023" },
        ["image_id"] = 14689167568,
        ["limit_per_house"] = 1
    },
    ["lures_2023_cozy_home_lure"] = {
        ["name"] = "Cozy Home Lure",
        ["model_name"] = "Lures2023CozyHomeLure",
        ["tags"] = { "PremiumLure", "Lures2023" },
        ["image_id"] = 14689167081,
        ["limit_per_house"] = 1,
        ["gamepass"] = "lures_2023_cozy_home_lure",
        ["donatable"] = false
    },
    ["lures_2023_castle_tim_1"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023MainTim"
    },
    ["lures_2023_castle_tim_2"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023CoolTim"
    },
    ["lures_2023_castle_tim_3"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023CrazyTim"
    },
    ["lures_2023_castle_tim_4"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023EmperorTim"
    },
    ["lures_2023_castle_tim_5"] = {
        ["name"] = "Cool Tim",
        ["model_name"] = "Lures2023MainTim"
    },
    ["lures_2023_castle_tim_6"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023MainTim"
    },
    ["lures_2023_castle_tim_7"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023MainTim"
    },
    ["lures_2023_castle_tim_8"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023MainTim"
    },
    ["lures_2023_castle_tim_9"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023MainTim"
    },
    ["lures_2023_castle_tim_10"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023MainTim"
    },
    ["lures_2023_castle_tim_11"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023MainTim"
    },
    ["lures_2023_castle_tim_12"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023MainTim"
    },
    ["lures_2023_castle_tim_13"] = {
        ["name"] = "Tim",
        ["model_name"] = "Lures2023MainTim"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)