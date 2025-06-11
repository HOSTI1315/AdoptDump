--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.Furniture (ModuleScript)

local v1 = {
    ["winter_2023_santa_throne"] = {
        ["name"] = "Santa Throne",
        ["model_name"] = "Winter2023SantaThrone"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)