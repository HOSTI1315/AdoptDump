--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.Eggs (ModuleScript)

local v1 = {}
local v2 = {
    ["winter_2023_story_game_egg"] = {
        ["common"] = 0,
        ["uncommon"] = 1,
        ["rare"] = 0,
        ["ultra_rare"] = 0,
        ["legendary"] = 0
    }
}
v1.eggs = v2
local v3 = {
    ["winter_2023_story_game_egg"] = {
        ["uncommon"] = {
            { "pets", "winter_2023_eggnog_dog" }
        }
    }
}
v1.pets = v3
return v1