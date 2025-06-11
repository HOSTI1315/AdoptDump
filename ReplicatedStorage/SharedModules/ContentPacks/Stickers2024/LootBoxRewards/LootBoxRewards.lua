--// ReplicatedStorage.SharedModules.ContentPacks.Stickers2024.LootBoxRewards (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("LootBoxRewardsHelper")
local v2 = {
    ["common"] = 0.4,
    ["uncommon"] = 0.25,
    ["rare"] = 0.17,
    ["ultra_rare"] = 0.14,
    ["legendary"] = 0.0399
}
local v3 = {
    ["uncommon"] = 0.35,
    ["rare"] = 0.3,
    ["ultra_rare"] = 0.25,
    ["legendary"] = 0.0999
}
local v4 = {}
local v5 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v6 = v1.group_loot_chances
local v7 = {}
local v8 = {
    ["chance"] = v2.common,
    ["possible_rewards"] = {
        {
            ["kind"] = "stickers_2024_dog_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_donkey_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_toad_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_parakeet_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_beaver_pet",
            ["category"] = "stickers"
        }
    }
}
local v9 = {
    ["chance"] = v2.uncommon,
    ["possible_rewards"] = {
        {
            ["kind"] = "stickers_2024_kiwi_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_koi_fish_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_ocelot_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_seahorse_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_sloth_pet",
            ["category"] = "stickers"
        }
    }
}
local v10 = {
    ["chance"] = v2.rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "stickers_2024_zebra_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_lamb_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_red_panda_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_silly_duck_pet",
            ["category"] = "stickers"
        }
    }
}
local v11 = {
    ["chance"] = v2.ultra_rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "stickers_2024_ladybug_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_bee_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_penguin_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_toucan_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_fallow_deer_pet",
            ["category"] = "stickers"
        }
    }
}
local v12 = {
    ["chance"] = v2.legendary,
    ["possible_rewards"] = {
        {
            ["kind"] = "stickers_2024_diamond_ladybug_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_diamond_bee_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_dragon_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_unicorn_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_squid_pet",
            ["category"] = "stickers"
        }
    }
}
local v13 = {
    ["chance"] = 0.0001,
    ["possible_rewards"] = {
        {
            ["kind"] = "stickers_2024_dragon_animated_pet",
            ["category"] = "stickers",
            ["force_show_chance"] = true
        }
    }
}
__set_list(v7, 1, {v8, v9, v10, v11, v12, v13})
v5.possible_loot = v6(v7)
v4.stickers_2024_standard_pack = v5
local v14 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v15 = v1.group_loot_chances
local v16 = {}
local v17 = {
    ["chance"] = v3.uncommon,
    ["possible_rewards"] = {
        {
            ["kind"] = "stickers_2024_red_fox_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_frog_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_otter_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_shiba_inu_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_rat_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_walrus_pet",
            ["category"] = "stickers"
        }
    }
}
local v18 = {
    ["chance"] = v3.rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "stickers_2024_koala_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_silly_rock_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_pig_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_sasquatch_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_poodle_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_orange_cat_pet",
            ["category"] = "stickers"
        }
    }
}
local v19 = {
    ["chance"] = v3.ultra_rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "stickers_2024_elephant_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_panda_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_flamingo_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_turtle_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_cow_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_dalmation_pet",
            ["category"] = "stickers"
        }
    }
}
local v20 = {
    ["chance"] = v3.legendary,
    ["possible_rewards"] = {
        {
            ["kind"] = "stickers_2024_bat_dragon_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_parrot_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_space_whale_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_winged_horse_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_kitsune_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "stickers_2024_phoenix_pet",
            ["category"] = "stickers"
        }
    }
}
local v21 = {
    ["chance"] = 0.0001,
    ["possible_rewards"] = {
        {
            ["kind"] = "stickers_2024_bat_dragon_animated_pet",
            ["category"] = "stickers",
            ["force_show_chance"] = true
        }
    }
}
__set_list(v16, 1, {v17, v18, v19, v20, v21})
v14.possible_loot = v15(v16)
v4.stickers_2024_premium_pack = v14
return v4