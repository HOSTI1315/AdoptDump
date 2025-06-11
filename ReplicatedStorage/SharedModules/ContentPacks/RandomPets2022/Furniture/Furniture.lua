--// ReplicatedStorage.SharedModules.ContentPacks.RandomPets2022.Furniture (ModuleScript)

local v1 = {
    ["random_pets_2022_winged_horse"] = {
        ["name"] = "Winged Horse",
        ["model_name"] = "RandomPets2022WingedHorse"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)