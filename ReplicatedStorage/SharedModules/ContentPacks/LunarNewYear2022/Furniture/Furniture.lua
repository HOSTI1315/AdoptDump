--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2022.Furniture (ModuleScript)

local v1 = {
    ["lny_2022_bench"] = {
        ["name"] = "Moon Viewing Bench",
        ["model_name"] = "LNY2022PlaceableBench"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)