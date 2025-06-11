--// ReplicatedStorage.SharedModules.ContentPacks.Hamstertime2024.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "food",
        ["kind"] = "hamstertime_2024_golden_corn"
    }
}
local v3 = {}
local v4 = {
    ["chance"] = 0.875,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "hamstertime_2024_hamster"
        }
    }
}
local v5 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "hamstertime_2024_golden_hamster"
        }
    }
}
local v6 = {
    ["chance"] = 0.025,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "hamstertime_2024_diamond_hamster"
        }
    }
}
__set_list(v3, 1, {v4, v5, v6})
v2.possible_loot = v3
v1.hamstertime_2024_golden_corn = v2
return v1