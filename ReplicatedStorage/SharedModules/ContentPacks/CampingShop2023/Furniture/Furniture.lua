--// ReplicatedStorage.SharedModules.ContentPacks.CampingShop2023.Furniture (ModuleScript)

local v1 = {
    ["camping_2023_sleeping_bag"] = {
        ["name"] = "Camper\'s Sleeping Bag",
        ["model_name"] = "Camping2023SleepingBag"
    },
    ["camping_2023_camping_tent"] = {
        ["name"] = "Camper\'s Tent",
        ["model_name"] = "Camping2023CampingTent"
    },
    ["camping_2023_log_bench"] = {
        ["name"] = "Camper\'s Bench",
        ["model_name"] = "Camping2023LogBench"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)