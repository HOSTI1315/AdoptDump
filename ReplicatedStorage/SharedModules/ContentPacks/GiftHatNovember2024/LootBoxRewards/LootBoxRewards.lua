--// ReplicatedStorage.SharedModules.ContentPacks.GiftHatNovember2024.LootBoxRewards (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("LootBoxRewardsHelper")
local v2 = {
    ["common"] = 0.6,
    ["uncommon"] = 0.3,
    ["rare"] = 0.075,
    ["ultra_rare"] = 0.02,
    ["legendary"] = 0.0047
}
local v3 = {
    ["common"] = 0.2,
    ["uncommon"] = 0.5,
    ["rare"] = 0.2,
    ["ultra_rare"] = 0.085,
    ["legendary"] = 0.013999999999999999
}
local v4 = {}
local v5 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "gifts",
        ["kind"] = "legend_hat_2022_simple_chest"
    }
}
local v6 = v1.group_loot_chances
local v7 = {}
local v8 = {
    ["chance"] = v2.common,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_balloon_flower_hat",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_cactus_bat",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_gothic_necklace",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_microphone",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_star_hoodie",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_bush_backpack",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_raven_hood",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_grape_earrings",
            ["category"] = "pet_accessories"
        }
    }
}
local v9 = {
    ["chance"] = v2.uncommon,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_flower_drop_earrings",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_radish_friend",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_love_letter",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_raven_collar",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_steel_toe_heel",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_tv_hood",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_heart_eyepatch",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_cherry_blossom_glasses",
            ["category"] = "pet_accessories"
        }
    }
}
local v10 = {
    ["chance"] = v2.rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_shooting_star_glasses",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_orange_hat",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_jailers_keys",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_stylish_neckerchief",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_butterfly_headphones",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_flower_scarf",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_bow_shoes",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_watermelon_shoes",
            ["category"] = "pet_accessories"
        }
    }
}
local v11 = {
    ["chance"] = v2.ultra_rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_ice_cream_heels",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_dog_backpack",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_sky_wings",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_constellation_cape",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_mystic_wing_crown",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_fortune_teller_hood",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_ponytail",
            ["category"] = "pet_accessories"
        }
    }
}
local v12 = {
    ["chance"] = v2.legendary,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_kraken_hat",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_natures_crown",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_fishbowl_hat",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_rocket_ship_hat",
            ["category"] = "pet_accessories"
        }
    }
}
local v13 = {
    ["chance"] = 0.0003,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_strawberry_shortcake_bat_dragon_backpack",
            ["category"] = "pet_accessories",
            ["force_show_chance"] = true
        }
    }
}
__set_list(v7, 1, {v8, v9, v10, v11, v12, v13})
v5.possible_loot = v6(v7)
v4.legend_hat_2022_simple_chest = v5
local v14 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "gifts",
        ["kind"] = "legend_hat_2022_regal_chest"
    }
}
local v15 = v1.group_loot_chances
local v16 = {}
local v17 = {
    ["chance"] = v3.common,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_balloon_flower_hat",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_cactus_bat",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_gothic_necklace",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_microphone",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_star_hoodie",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_bush_backpack",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_raven_hood",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_grape_earrings",
            ["category"] = "pet_accessories"
        }
    }
}
local v18 = {
    ["chance"] = v3.uncommon,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_flower_drop_earrings",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_radish_friend",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_love_letter",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_raven_collar",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_steel_toe_heel",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_tv_hood",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_heart_eyepatch",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_cherry_blossom_glasses",
            ["category"] = "pet_accessories"
        }
    }
}
local v19 = {
    ["chance"] = v3.rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_shooting_star_glasses",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_orange_hat",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_jailers_keys",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_stylish_neckerchief",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_butterfly_headphones",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_flower_scarf",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_bow_shoes",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_watermelon_shoes",
            ["category"] = "pet_accessories"
        }
    }
}
local v20 = {
    ["chance"] = v3.ultra_rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_ice_cream_heels",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_dog_backpack",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_sky_wings",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_constellation_cape",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_mystic_wing_crown",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_fortune_teller_hood",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_ponytail",
            ["category"] = "pet_accessories"
        }
    }
}
local v21 = {
    ["chance"] = v3.legendary,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_kraken_hat",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_natures_crown",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_fishbowl_hat",
            ["category"] = "pet_accessories"
        },
        {
            ["kind"] = "gifthat_november_2024_rocket_ship_hat",
            ["category"] = "pet_accessories"
        }
    }
}
local v22 = {
    ["chance"] = 0.001,
    ["possible_rewards"] = {
        {
            ["kind"] = "gifthat_november_2024_strawberry_shortcake_bat_dragon_backpack",
            ["category"] = "pet_accessories",
            ["force_show_chance"] = true
        }
    }
}
__set_list(v16, 1, {v17, v18, v19, v20, v21, v22})
v14.possible_loot = v15(v16)
v4.legend_hat_2022_regal_chest = v14
return v4