--// ReplicatedStorage.SharedModules.ContentPacks.Easter2024.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "gifts",
        ["kind"] = "easter_2024_eggy_box"
    }
}
local v3 = {}
local v4 = {
    ["chance"] = 0.7,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "easter_2024_dotted_eggy"
        }
    }
}
local v5 = {
    ["chance"] = 0.25,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "easter_2024_floral_eggy"
        }
    }
}
local v6 = {
    ["chance"] = 0.05,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "easter_2024_striped_eggy"
        }
    }
}
__set_list(v3, 1, {v4, v5, v6})
v2.possible_loot = v3
v1.easter_2024_eggy_box = v2
return v1