--// ReplicatedStorage.SharedModules.ContentPacks.Sunshine2024.BattlePasses (ModuleScript)

local v1 = {}
local v2 = {
    ["display_name"] = "Sunshine Games Pass",
    ["event_end_timestamp"] = require(game.ReplicatedStorage.Fsys).load("TimeZoneHelper").from_region_datetime("PT", 2024, 8, 12, 8).UnixTimestamp,
    ["minigame_reward_image"] = {
        ["phone"] = "rbxassetid://18618093607",
        ["desktop"] = "rbxassetid://18618093607"
    },
    ["icon_image"] = "rbxassetid://18651934275",
    ["reset_options"] = {
        ["daily_reset_limit"] = 3
    }
}
local v3 = {}
local v4 = {
    ["xp_needed"] = 125,
    ["reward"] = {
        ["category"] = "toys",
        ["kind"] = "sunshine_2024_bouquet_chew_toy",
        ["amount"] = 1
    }
}
local v5 = {
    ["xp_needed"] = 167,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "cure_all_potion",
        ["amount"] = 1
    }
}
local v6 = {
    ["xp_needed"] = 167,
    ["reward"] = {
        ["category"] = "pet_accessories",
        ["kind"] = "sunshine_2024_sports_shoes",
        ["amount"] = 1
    }
}
local v7 = {
    ["xp_needed"] = 250,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "cure_all_potion",
        ["amount"] = 1
    }
}
local v8 = {
    ["xp_needed"] = 250,
    ["reward"] = {
        ["category"] = "pet_accessories",
        ["kind"] = "sunshine_2024_bronze_medal",
        ["amount"] = 1
    }
}
local v9 = {
    ["xp_needed"] = 333,
    ["reward"] = {
        ["category"] = "gifts",
        ["kind"] = "smallgift",
        ["amount"] = 1
    }
}
local v10 = {
    ["xp_needed"] = 333,
    ["reward"] = {
        ["category"] = "gifts",
        ["kind"] = "legend_hat_2022_simple_chest",
        ["amount"] = 1
    }
}
local v11 = {
    ["xp_needed"] = 333,
    ["reward"] = {
        ["category"] = "toys",
        ["kind"] = "sunshine_2024_tennis_racket_toy",
        ["amount"] = 1
    }
}
local v12 = {
    ["xp_needed"] = 333,
    ["reward"] = {
        ["category"] = "gifts",
        ["kind"] = "smallgift",
        ["amount"] = 1
    }
}
local v13 = {
    ["xp_needed"] = 333,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "sunshine_2024_black_marlin",
        ["amount"] = 1
    }
}
local v14 = {
    ["xp_needed"] = 417,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 1
    }
}
local v15 = {
    ["xp_needed"] = 417,
    ["reward"] = {
        ["category"] = "gifts",
        ["kind"] = "legend_hat_2022_simple_chest",
        ["amount"] = 1
    }
}
local v16 = {
    ["xp_needed"] = 417,
    ["reward"] = {
        ["category"] = "pet_accessories",
        ["kind"] = "sunshine_2024_sports_shirt",
        ["amount"] = 1
    }
}
local v17 = {
    ["xp_needed"] = 417,
    ["reward"] = {
        ["category"] = "gifts",
        ["kind"] = "biggift",
        ["amount"] = 1
    }
}
local v18 = {
    ["xp_needed"] = 417,
    ["reward"] = {
        ["category"] = "gifts",
        ["kind"] = "stickers_2024_standard_pack",
        ["amount"] = 1
    }
}
local v19 = {
    ["xp_needed"] = 500,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "sunshine_2024_black_marlin",
        ["amount"] = 1
    }
}
__set_list(v3, 1, {v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19})
local v20 = {
    ["xp_needed"] = 500,
    ["reward"] = {
        ["category"] = "pet_accessories",
        ["kind"] = "sunshine_2024_silver_medal",
        ["amount"] = 1
    }
}
local v21 = {
    ["xp_needed"] = 500,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 1
    }
}
local v22 = {
    ["xp_needed"] = 500,
    ["reward"] = {
        ["category"] = "gifts",
        ["kind"] = "stickers_2024_standard_pack",
        ["amount"] = 1
    }
}
local v23 = {
    ["xp_needed"] = 500,
    ["reward"] = {
        ["category"] = "pet_accessories",
        ["kind"] = "sunshine_2024_sports_hat",
        ["amount"] = 1
    }
}
local v24 = {
    ["xp_needed"] = 667,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "sunshine_2024_black_marlin",
        ["amount"] = 1
    }
}
local v25 = {
    ["xp_needed"] = 667,
    ["reward"] = {
        ["category"] = "gifts",
        ["kind"] = "biggift",
        ["amount"] = 1
    }
}
local v26 = {
    ["xp_needed"] = 667,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 1
    }
}
local v27 = {
    ["xp_needed"] = 667,
    ["reward"] = {
        ["category"] = "pet_accessories",
        ["kind"] = "sunshine_2024_gold_medal",
        ["amount"] = 1
    }
}
local v28 = {
    ["xp_needed"] = 667,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "sunshine_2024_black_marlin",
        ["amount"] = 1
    }
}
local v29 = {
    ["xp_needed"] = 667,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "sunshine_2024_peregrine_falcon",
        ["amount"] = 1
    }
}
local v30 = {
    ["xp_needed"] = 667,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 1
    }
}
local v31 = {
    ["xp_needed"] = 667,
    ["reward"] = {
        ["category"] = "gifts",
        ["kind"] = "biggift",
        ["amount"] = 1
    }
}
local v32 = {
    ["xp_needed"] = 667,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "sunshine_2024_black_marlin",
        ["amount"] = 1
    }
}
local v33 = {
    ["xp_needed"] = 667,
    ["reward"] = {
        ["category"] = "gifts",
        ["kind"] = "legend_hat_2022_regal_chest",
        ["amount"] = 1
    }
}
local v34 = {
    ["xp_needed"] = 833,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 1
    }
}
local v35 = {
    ["xp_needed"] = 833,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "sunshine_2024_black_marlin",
        ["amount"] = 1
    }
}
__set_list(v3, 17, {v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35})
local v36 = {
    ["xp_needed"] = 833,
    ["reward"] = {
        ["category"] = "gifts",
        ["kind"] = "massivegift",
        ["amount"] = 1
    }
}
local v37 = {
    ["xp_needed"] = 833,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 1
    }
}
local v38 = {
    ["xp_needed"] = 833,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "sunshine_2024_black_marlin",
        ["amount"] = 1
    }
}
local v39 = {
    ["xp_needed"] = 833,
    ["reward"] = {
        ["category"] = "pet_accessories",
        ["kind"] = "sunshine_2024_laurel_wreath",
        ["amount"] = 1
    }
}
local v40 = {
    ["xp_needed"] = 833,
    ["reward"] = {
        ["category"] = "transport",
        ["kind"] = "sunshine_2024_sunshine_chariot",
        ["amount"] = 1
    }
}
local v41 = {
    ["xp_needed"] = 833,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "sunshine_2024_black_marlin",
        ["amount"] = 1
    }
}
local v42 = {
    ["xp_needed"] = 833,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "sunshine_2024_peregrine_falcon",
        ["amount"] = 1
    }
}
local v43 = {
    ["xp_needed"] = 833,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "sunshine_2024_cheetah",
        ["amount"] = 1
    }
}
__set_list(v3, 33, {v36, v37, v38, v39, v40, v41, v42, v43})
v2.track = v3
v1.sunshine_games = v2
return v1