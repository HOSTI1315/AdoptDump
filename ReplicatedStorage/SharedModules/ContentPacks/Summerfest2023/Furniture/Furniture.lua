--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2023.Furniture (ModuleScript)

local v1 = {
    ["summerfest_2023_red_tulip_chair"] = {
        ["name"] = "Red Tulip Chair",
        ["model_name"] = "Summerfest2023RedTulipChair"
    },
    ["summerfest_2023_blue_tulip_chair"] = {
        ["name"] = "Blue Tulip Chair",
        ["model_name"] = "Summerfest2023BlueTulipChair"
    },
    ["summerfest_2023_bench_log"] = {
        ["name"] = "Bench Log",
        ["model_name"] = "Summerfest2023BenchLog"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)