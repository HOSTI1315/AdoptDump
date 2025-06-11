--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2023.Furniture (ModuleScript)

local v1 = {
    ["lny_2023_placeable_lantern"] = {
        ["name"] = "Lunar New Year Lantern",
        ["model_name"] = "LNY2023PlaceableLantern"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)