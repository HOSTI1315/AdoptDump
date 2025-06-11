--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["exchangeable"] = false
}
local v3 = {}
local v4 = {
    ["chance"] = 1,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2023_christmas_pudding_pup"
        }
    }
}
__set_list(v3, 1, {v4})
v2.possible_loot = v3
v1.winter_2023_christmas_pudding_pup_bait = v2
local v5 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "gifts",
        ["kind"] = "winter_2023_hare_box"
    }
}
local v6 = {}
local v7 = {
    ["chance"] = 0.6,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2023_arctic_hare"
        }
    }
}
local v8 = {
    ["chance"] = 0.25,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2023_eggnog_hare"
        }
    }
}
local v9 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2023_gingerbread_hare"
        }
    }
}
local v10 = {
    ["chance"] = 0.05,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2023_candy_hare"
        }
    }
}
__set_list(v6, 1, {v7, v8, v9, v10})
v5.possible_loot = v6
v1.winter_2023_hare_box = v5
return v1