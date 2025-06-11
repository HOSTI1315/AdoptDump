--// ReplicatedStorage.SharedModules.ContentPacks.Rain2023.Furniture (ModuleScript)

local v1 = {
    ["rain_2023_captain_fluffy"] = {
        ["name"] = "Captain Fluffy",
        ["model_name"] = "Rain2023CaptainFluffy"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)