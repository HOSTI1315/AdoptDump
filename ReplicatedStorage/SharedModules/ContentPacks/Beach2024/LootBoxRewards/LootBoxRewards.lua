--// ReplicatedStorage.SharedModules.ContentPacks.Beach2024.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "food",
        ["kind"] = "beach_2024_mahi_spinning_rod"
    }
}
local v3 = {}
local v4 = {
    ["chance"] = 0.78,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "beach_2024_mahi_mahi"
        }
    }
}
local v5 = {
    ["chance"] = 0.2,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "beach_2024_gold_mahi_mahi"
        }
    }
}
local v6 = {
    ["chance"] = 0.02,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "beach_2024_diamond_mahi_mahi"
        }
    }
}
__set_list(v3, 1, {v4, v5, v6})
v2.possible_loot = v3
v1.beach_2024_mahi_spinning_rod = v2
return v1