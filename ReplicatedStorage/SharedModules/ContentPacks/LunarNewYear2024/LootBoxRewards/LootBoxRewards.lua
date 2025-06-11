--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2024.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = false,
    ["exchangeable"] = {
        ["category"] = "gifts",
        ["kind"] = "lunar_2024_silk_bag"
    }
}
local v3 = {}
local v4 = {
    ["chance"] = 1,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 1000
        }
    }
}
__set_list(v3, 1, {v4})
v2.possible_loot = v3
v1.lunar_2024_silk_bag = v2
local v5 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "gifts",
        ["kind"] = "lunar_2024_lunar_new_year_gift_box"
    }
}
local v6 = {}
local v7 = {
    ["chance"] = 0.195,
    ["rewards"] = {
        {
            ["category"] = "food",
            ["kind"] = "lunar_2024_sweet_rice_drink"
        }
    }
}
local v8 = {
    ["chance"] = 0.195,
    ["rewards"] = {
        {
            ["category"] = "food",
            ["kind"] = "lunar_2024_rice_cake_soup"
        }
    }
}
local v9 = {
    ["chance"] = 0.075,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_lunar_moon_throw_toy"
        }
    }
}
local v10 = {
    ["chance"] = 0.075,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_diamond_fanghorn_kite"
        }
    }
}
local v11 = {
    ["chance"] = 0.075,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_rice_cake_rabbit_kite"
        }
    }
}
local v12 = {
    ["chance"] = 0.075,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "lunar_2024_rice_cake_hat"
        }
    }
}
local v13 = {
    ["chance"] = 0.05,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_doltokki_kite"
        }
    }
}
local v14 = {
    ["chance"] = 0.05,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_fanghorn_kite"
        }
    }
}
local v15 = {
    ["chance"] = 0.05,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_jegi_throw_toy"
        }
    }
}
local v16 = {
    ["chance"] = 0.05,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "lunar_2024_hanbok"
        }
    }
}
local v17 = {
    ["chance"] = 0.02,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "lunar_2024_fanghorn_tortoise"
        }
    }
}
local v18 = {
    ["chance"] = 0.02,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "lunar_2024_rice_cake_rabbit"
        }
    }
}
local v19 = {
    ["chance"] = 0.02,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "lunar_2024_rainbow_dragon_hat"
        }
    }
}
local v20 = {
    ["chance"] = 0.02,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_midnight_dragon_kite"
        }
    }
}
local v21 = {
    ["chance"] = 0.02,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_rainbow_dragon_kite"
        }
    }
}
local v22 = {
    ["chance"] = 0.005,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "lunar_2024_rainbow_dragon"
        }
    }
}
__set_list(v6, 1, {v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22})
local v23 = {
    ["chance"] = 0.005,
    ["rewards"] = {
        {
            ["category"] = "transport",
            ["kind"] = "lunar_2024_dragonster"
        }
    }
}
__set_list(v6, 17, {v23})
v5.possible_loot = v6
v1.lunar_2024_lunar_new_year_gift_box = v5
local v24 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "gifts",
        ["kind"] = "lunar_2024_special_lunar_new_year_gift_box"
    }
}
local v25 = {}
local v26 = {
    ["chance"] = 0.06,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_doltokki_kite"
        }
    }
}
local v27 = {
    ["chance"] = 0.06,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_fanghorn_kite"
        }
    }
}
local v28 = {
    ["chance"] = 0.06,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_jegi_throw_toy"
        }
    }
}
local v29 = {
    ["chance"] = 0.06,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "lunar_2024_hanbok"
        }
    }
}
local v30 = {
    ["chance"] = 0.136,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "lunar_2024_fanghorn_tortoise"
        }
    }
}
local v31 = {
    ["chance"] = 0.136,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "lunar_2024_rice_cake_rabbit"
        }
    }
}
local v32 = {
    ["chance"] = 0.136,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "lunar_2024_rainbow_dragon_hat"
        }
    }
}
local v33 = {
    ["chance"] = 0.136,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_midnight_dragon_kite"
        }
    }
}
local v34 = {
    ["chance"] = 0.136,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "lunar_2024_rainbow_dragon_kite"
        }
    }
}
local v35 = {
    ["chance"] = 0.04,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "lunar_2024_rainbow_dragon"
        }
    }
}
local v36 = {
    ["chance"] = 0.04,
    ["rewards"] = {
        {
            ["category"] = "transport",
            ["kind"] = "lunar_2024_dragonster"
        }
    }
}
__set_list(v25, 1, {v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36})
v24.possible_loot = v25
v1.lunar_2024_special_lunar_new_year_gift_box = v24
return v1