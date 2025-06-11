--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.Houses (ModuleScript)

local v1 = {
    ["micro_sandbox"] = {
        ["name"] = "Tiny Home",
        ["model_name"] = "Micro2023",
        ["exterior_name"] = "Micro",
        ["image"] = "rbxassetid://2014715420",
        ["order"] = 0,
        ["is_for_sale"] = false,
        ["no_parties"] = true,
        ["rarity"] = "house",
        ["max_furniture"] = 500,
        ["donatable"] = false
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").houses(v1)