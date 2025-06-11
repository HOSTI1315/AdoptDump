--// ReplicatedStorage.SharedModules.ContentPacks.Camping2025.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "food",
        ["kind"] = "camping_2025_maple_leaf_treat"
    }
}
local v3 = {}
local v4 = {
    ["chance"] = 0.875,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "camping_2025_mama_moose",
            ["force_show_chance"] = true
        }
    }
}
local v5 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "camping_2025_moose_calf",
            ["force_show_chance"] = true
        }
    }
}
local v6 = {
    ["chance"] = 0.025,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "camping_2025_papa_moose",
            ["force_show_chance"] = true
        }
    }
}
__set_list(v3, 1, {v4, v5, v6})
v2.possible_loot = v3
v1.camping_2025_maple_leaf_treat = v2
return v1