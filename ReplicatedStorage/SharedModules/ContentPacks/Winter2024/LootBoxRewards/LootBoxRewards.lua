--// ReplicatedStorage.SharedModules.ContentPacks.Winter2024.LootBoxRewards (ModuleScript)

local v1 = {
    ["common"] = 0.4,
    ["uncommon"] = 0.25,
    ["rare"] = 0.17,
    ["ultra_rare"] = 0.14,
    ["legendary"] = 0.0395
}
local v2 = {}
local v3 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "gifts",
        ["kind"] = "winter_2024_ice_tray"
    }
}
local v4 = {}
local v5 = {
    ["chance"] = 0.7,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2024_ice_cube"
        }
    }
}
local v6 = {
    ["chance"] = 0.25,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2024_cold_cube"
        }
    }
}
local v7 = {
    ["chance"] = 0.05,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2024_berry_cool_cube"
        }
    }
}
__set_list(v4, 1, {v5, v6, v7})
v3.possible_loot = v4
v2.winter_2024_ice_tray = v3
local v8 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v9 = require(game.ReplicatedStorage.Fsys).load("LootBoxRewardsHelper").group_loot_chances
local v10 = {}
local v11 = {
    ["chance"] = v1.common,
    ["possible_rewards"] = {
        {
            ["kind"] = "winter_2024_robin_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_snowman_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_christmas_tree_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_ratatoskr_sticker",
            ["category"] = "stickers"
        }
    }
}
local v12 = {
    ["chance"] = v1.uncommon,
    ["possible_rewards"] = {
        {
            ["kind"] = "winter_2024_reindeer_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_shetland_pony_dark_brown_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_nutcracker_squirrel_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_santas_throne_sticker",
            ["category"] = "stickers"
        }
    }
}
local v13 = {
    ["chance"] = v1.rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "winter_2024_husky_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_partridge_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_winter_doe_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_great_pyrenees_sticker",
            ["category"] = "stickers"
        }
    }
}
local v14 = {
    ["chance"] = v1.ultra_rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "winter_2024_yeti_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_gingerbread_hare_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_bauble_buddies_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_merry_mistletroll_sticker",
            ["category"] = "stickers"
        }
    }
}
local v15 = {
    ["chance"] = v1.legendary,
    ["possible_rewards"] = {
        {
            ["kind"] = "winter_2024_peppermint_penguin_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_fairy_bat_dragon_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_aurora_fox_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "winter_2024_naughty_mistletroll_sticker",
            ["category"] = "stickers"
        }
    }
}
local v16 = {
    ["chance"] = 0.0005,
    ["possible_rewards"] = {
        {
            ["kind"] = "winter_2024_frostclaw_animated_sticker",
            ["category"] = "stickers",
            ["force_show_chance"] = true
        }
    }
}
__set_list(v10, 1, {v11, v12, v13, v14, v15, v16})
v8.possible_loot = v9(v10)
v2.winter_2024_sticker_pack = v8
local v17 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "gifts",
        ["kind"] = "winter_2024_golden_mistletoe"
    }
}
local v18 = {}
local v19 = {
    ["chance"] = 0.8,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2024_merry_mistletroll",
            ["force_show_chance"] = true
        }
    }
}
local v20 = {
    ["chance"] = 0.15,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2024_naughty_mistletroll",
            ["force_show_chance"] = true
        }
    }
}
local v21 = {
    ["chance"] = 0.05,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2024_royal_mistletroll",
            ["force_show_chance"] = true
        }
    }
}
__set_list(v18, 1, {v19, v20, v21})
v17.possible_loot = v18
v2.winter_2024_golden_mistletoe = v17
local v22 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v23 = {}
local v24 = {
    ["chance"] = 0.7,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2024_winter_fawn"
        }
    }
}
local v25 = {
    ["chance"] = 0.22,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2024_winter_doe"
        }
    }
}
local v26 = {
    ["chance"] = 0.08,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "winter_2024_winter_buck"
        }
    }
}
__set_list(v23, 1, {v24, v25, v26})
v22.possible_loot = v23
v2.winter_2024_winter_deer_bait = v22
return v2