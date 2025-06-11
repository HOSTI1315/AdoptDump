--// ReplicatedStorage.SharedModules.ContentPacks.Snow2022.Furniture (ModuleScript)

local v1 = {
    ["snow_2022_aurora"] = {
        ["name"] = "Aurora",
        ["model_name"] = "Snow2022Aurora"
    },
    ["snow_2022_ribbon_seal"] = {
        ["name"] = "Ribbon Seal",
        ["model_name"] = "Snow2022RibbonSeal"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)