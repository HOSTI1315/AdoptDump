--// ReplicatedStorage.SharedModules.ContentPacks.FireDimension2024.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v3 = {}
local v4 = {
    ["chance"] = 0.3,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "fire_dimension_2024_wildfire_hawk"
        }
    }
}
local v5 = {
    ["chance"] = 0.3,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "fire_dimension_2024_burning_bunny"
        }
    }
}
local v6 = {
    ["chance"] = 0.3,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "fire_dimension_2024_flaming_fox"
        }
    }
}
local v7 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "fire_dimension_2024_volcanic_rhino"
        }
    }
}
__set_list(v3, 1, {v4, v5, v6, v7})
v2.possible_loot = v3
v1.fire_dimension_2024_baked_alaska_bait = v2
local v8 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v9 = {}
local v10 = {
    ["chance"] = 0.42,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 10
        }
    }
}
local v11 = {
    ["chance"] = 0.24,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 50
        }
    }
}
local v12 = {
    ["chance"] = 0.09,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 100
        }
    }
}
local v13 = {
    ["chance"] = 0.016666666666666666,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "fire_dimension_2024_fire_helmet"
        }
    }
}
local v14 = {
    ["chance"] = 0.016666666666666666,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "fire_dimension_2024_flame_cape"
        }
    }
}
local v15 = {
    ["chance"] = 0.016666666666666666,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "fire_dimension_2024_fire_extinguisher_backpack"
        }
    }
}
local v16 = {
    ["chance"] = 0.016666666666666666,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "fire_dimension_2024_heat_vent_hat"
        }
    }
}
local v17 = {
    ["chance"] = 0.016666666666666666,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "fire_dimension_2024_volcanic_boots"
        }
    }
}
local v18 = {
    ["chance"] = 0.016666666666666666,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "fire_dimension_2024_flame_sword"
        }
    }
}
local v19 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "food",
            ["kind"] = "pet_age_potion"
        }
    }
}
local v20 = {
    ["chance"] = 0.015,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "fire_dimension_2024_wildfire_hawk"
        }
    }
}
local v21 = {
    ["chance"] = 0.015,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "fire_dimension_2024_burning_bunny"
        }
    }
}
local v22 = {
    ["chance"] = 0.015,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "fire_dimension_2024_flaming_fox"
        }
    }
}
local v23 = {
    ["chance"] = 0.005,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "fire_dimension_2024_volcanic_rhino"
        }
    }
}
__set_list(v9, 1, {v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23})
v8.possible_loot = v9
v1.fire_dimension_2024_burnt_bites_bait = v8
return v1