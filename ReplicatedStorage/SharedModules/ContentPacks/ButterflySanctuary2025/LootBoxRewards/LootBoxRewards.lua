--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2025.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "food",
        ["kind"] = "butterfly_2025_bluebell_flower"
    }
}
local v3 = {}
local v4 = {
    ["chance"] = 0.6,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "butterfly_2025_blue_butterfly"
        }
    }
}
local v5 = {
    ["chance"] = 0.375,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "butterfly_2025_amber_butterfly"
        }
    }
}
local v6 = {
    ["chance"] = 0.025,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "butterfly_2025_seafoam_butterfly"
        }
    }
}
__set_list(v3, 1, {v4, v5, v6})
v2.possible_loot = v3
v1.butterfly_2025_bluebell_flower = v2
local v7 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "food",
        ["kind"] = "butterfly_2025_goldenrod_flower"
    }
}
local v8 = {}
local v9 = {
    ["chance"] = 0.6,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "butterfly_2025_vermilion_butterfly"
        }
    }
}
local v10 = {
    ["chance"] = 0.375,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "butterfly_2025_violet_butterfly"
        }
    }
}
local v11 = {
    ["chance"] = 0.025,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "butterfly_2025_orchid_butterfly"
        }
    }
}
__set_list(v8, 1, {v9, v10, v11})
v7.possible_loot = v8
v1.butterfly_2025_goldenrod_flower = v7
local v12 = {
    ["public"] = true,
    ["restriction_override"] = true,
    ["exchangeable"] = {
        ["category"] = "food",
        ["kind"] = "butterfly_2025_snapdragon_flower"
    }
}
local v13 = {}
local v14 = {
    ["chance"] = 0.56,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "butterfly_2025_blue_butterfly"
        }
    }
}
local v15 = {
    ["chance"] = 0.375,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "butterfly_2025_amber_butterfly"
        }
    }
}
local v16 = {
    ["chance"] = 0.025,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "butterfly_2025_seafoam_butterfly"
        }
    }
}
local v17 = {
    ["chance"] = 0.04,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "butterfly_2025_prismatic_butterfly"
        }
    }
}
__set_list(v13, 1, {v14, v15, v16, v17})
v12.possible_loot = v13
v1.butterfly_2025_snapdragon_flower = v12
return v1