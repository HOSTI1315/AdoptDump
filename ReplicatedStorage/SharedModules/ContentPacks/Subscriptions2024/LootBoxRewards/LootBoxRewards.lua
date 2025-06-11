--// ReplicatedStorage.SharedModules.ContentPacks.Subscriptions2024.LootBoxRewards (ModuleScript)

local v1 = {
    ["rare"] = 0.7,
    ["ultra_rare"] = 0.2,
    ["legendary"] = 0.0995
}
local v2 = {}
local v3 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v4 = require(game.ReplicatedStorage.Fsys).load("LootBoxRewardsHelper").group_loot_chances
local v5 = {}
local v6 = {
    ["chance"] = v1.rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "subscription_2024_pudding_cat_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_yule_log_dog_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_ram_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_african_painted_dog_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_butterfly_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_chick_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_starfish_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_pelican_pet",
            ["category"] = "stickers"
        }
    }
}
local v7 = {
    ["chance"] = v1.ultra_rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "subscription_2024_axolotl_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_lavender_dragon_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_puffin_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_gold_penguin_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_capricorn_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_goldhorn_pet",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_chameleon_pet",
            ["category"] = "stickers"
        }
    }
}
local v8 = {
    ["chance"] = v1.legendary,
    ["possible_rewards"] = {
        {
            ["kind"] = "subscription_2024_cat_meme",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_owl_meme",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_snowball_meme",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_red_panda_meme",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_hamster_meme",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "subscription_2024_strawberry_shortcake_bat_dragon_pet",
            ["category"] = "stickers"
        }
    }
}
local v9 = {
    ["chance"] = 0.0005,
    ["possible_rewards"] = {
        {
            ["kind"] = "subscription_2024_seagull_meme_animated",
            ["category"] = "stickers",
            ["force_show_chance"] = true
        }
    }
}
__set_list(v5, 1, {v6, v7, v8, v9})
v3.possible_loot = v4(v5)
v2.subscription_2024_sticker_pack = v3
local v10 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "food",
        ["kind"] = "subscription_2024_golden_flower"
    }
}
local v11 = {}
local v12 = {
    ["chance"] = 0.875,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "subscription_2024_hummingbird"
        }
    }
}
local v13 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "subscription_2024_gold_hummingbird"
        }
    }
}
local v14 = {
    ["chance"] = 0.025,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "subscription_2024_diamond_hummingbird"
        }
    }
}
__set_list(v11, 1, {v12, v13, v14})
v10.possible_loot = v11
v2.subscription_2024_golden_flower = v10
return v2