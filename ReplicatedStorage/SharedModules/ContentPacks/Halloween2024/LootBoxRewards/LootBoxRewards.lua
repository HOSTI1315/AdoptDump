--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2024.LootBoxRewards (ModuleScript)

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
        ["kind"] = "halloween_2024_chick_box"
    }
}
local v4 = {}
local v5 = {
    ["chance"] = 0.7,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "halloween_2024_zombie_chick"
        }
    }
}
local v6 = {
    ["chance"] = 0.25,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "halloween_2024_ghost_chick"
        }
    }
}
local v7 = {
    ["chance"] = 0.05,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "halloween_2024_evil_chick"
        }
    }
}
__set_list(v4, 1, {v5, v6, v7})
v3.possible_loot = v4
v2.halloween_2024_chick_box = v3
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
            ["kind"] = "halloween_2024_trick_or_treat_basket_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_frankenfeline_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_chickatrice_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_slug_sticker",
            ["category"] = "stickers"
        }
    }
}
local v12 = {
    ["chance"] = v1.uncommon,
    ["possible_rewards"] = {
        {
            ["kind"] = "halloween_2024_scarecrow_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_sea_skeleton_panda_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_cuteacabra_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_bat_sticker",
            ["category"] = "stickers"
        }
    }
}
local v13 = {
    ["chance"] = v1.rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "halloween_2024_white_skeleton_dog_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_ghost_bunny_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_marabou_stork_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_basilisk_sticker",
            ["category"] = "stickers"
        }
    }
}
local v14 = {
    ["chance"] = v1.ultra_rare,
    ["possible_rewards"] = {
        {
            ["kind"] = "halloween_2024_indian_flying_fox_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_zombie_wolf_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_slime_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_ghost_sticker",
            ["category"] = "stickers"
        }
    }
}
local v15 = {
    ["chance"] = v1.legendary,
    ["possible_rewards"] = {
        {
            ["kind"] = "halloween_2024_jousting_horse_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_scarebear_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_evil_unicorn_sticker",
            ["category"] = "stickers"
        },
        {
            ["kind"] = "halloween_2024_grim_dragon_sticker",
            ["category"] = "stickers"
        }
    }
}
local v16 = {
    ["chance"] = 0.0005,
    ["possible_rewards"] = {
        {
            ["kind"] = "halloween_2024_jekyll_hydra_animated_sticker",
            ["category"] = "stickers",
            ["force_show_chance"] = true
        }
    }
}
__set_list(v10, 1, {v11, v12, v13, v14, v15, v16})
v8.possible_loot = v9(v10)
v2.halloween_2024_sticker_pack = v8
return v2