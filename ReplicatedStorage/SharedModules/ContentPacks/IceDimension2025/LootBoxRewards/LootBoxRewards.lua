--// ReplicatedStorage.SharedModules.ContentPacks.IceDimension2025.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v3 = {}
local v4 = {
    ["chance"] = 0.3839,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 10
        }
    }
}
local v5 = {
    ["chance"] = 0.25,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 50
        }
    }
}
local v6 = {
    ["chance"] = 0.095,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 100
        }
    }
}
local v7 = {
    ["chance"] = 0.0001,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 10000
        }
    }
}
local v8 = {
    ["chance"] = 0.008333333333333333,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "ice_dimension_2025_placeable_snowperson"
        }
    }
}
local v9 = {
    ["chance"] = 0.008333333333333333,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "ice_dimension_2025_ice_cube_throw_toy"
        }
    }
}
local v10 = {
    ["chance"] = 0.008333333333333333,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "ice_dimension_2025_frozen_balloon"
        }
    }
}
local v11 = {
    ["chance"] = 0.008333333333333333,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "ice_dimension_2025_frozen_crown"
        }
    }
}
local v12 = {
    ["chance"] = 0.008333333333333333,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "ice_dimension_2025_ice_monocle"
        }
    }
}
local v13 = {
    ["chance"] = 0.008333333333333333,
    ["rewards"] = {
        {
            ["category"] = "pet_accessories",
            ["kind"] = "ice_dimension_2025_ice_cape"
        }
    }
}
local v14 = {
    ["chance"] = 0.015,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_snowy_mammoth_sticker"
        }
    }
}
local v15 = {
    ["chance"] = 0.015,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_icy_porcupine_sticker"
        }
    }
}
local v16 = {
    ["chance"] = 0.015,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_chilly_penguin_sticker"
        }
    }
}
local v17 = {
    ["chance"] = 0.015,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_frostbite_bear_sticker"
        }
    }
}
local v18 = {
    ["chance"] = 0.125,
    ["rewards"] = {
        {
            ["category"] = "food",
            ["kind"] = "pet_age_potion"
        }
    }
}
local v19 = {
    ["chance"] = 0.02,
    ["rewards"] = {
        {
            ["category"] = "toys",
            ["kind"] = "paint_2023_colored_hair_spray_sealer"
        }
    }
}
__set_list(v3, 1, {v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19})
local v20 = {
    ["chance"] = 0.004966666666666667,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "ice_dimension_2025_snowy_mammoth"
        }
    }
}
local v21 = {
    ["chance"] = 0.004966666666666667,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "ice_dimension_2025_chilly_penguin"
        }
    }
}
local v22 = {
    ["chance"] = 0.004966666666666667,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "ice_dimension_2025_icy_porcupine"
        }
    }
}
local v23 = {
    ["chance"] = 0.001,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_frostbite_bear_and_cub_animated_sticker"
        }
    }
}
local v24 = {
    ["chance"] = 0.0001,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "ice_dimension_2025_frostbite_bear"
        }
    }
}
__set_list(v3, 17, {v20, v21, v22, v23, v24})
v2.possible_loot = v3
v1.ice_dimension_2025_ice_soup_bait = v2
local v25 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v26 = {}
local v27 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_subzero_scorpion_sticker"
        }
    }
}
local v28 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_shiver_wolf_sticker"
        }
    }
}
local v29 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_ice_dimension_portal_sticker"
        }
    }
}
local v30 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_cold_tim_sticker"
        }
    }
}
local v31 = {
    ["chance"] = 0.25,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 50
        }
    }
}
local v32 = {
    ["chance"] = 0.13,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 100
        }
    }
}
local v33 = {
    ["chance"] = 0.12,
    ["rewards"] = {
        {
            ["category"] = "food",
            ["kind"] = "pet_age_potion"
        }
    }
}
local v34 = {
    ["chance"] = 0.0999,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "ice_dimension_2025_shiver_wolf"
        }
    }
}
local v35 = {
    ["chance"] = 0.0001,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "ice_dimension_2025_frostbite_bear"
        }
    }
}
__set_list(v26, 1, {v27, v28, v29, v30, v31, v32, v33, v34, v35})
v25.possible_loot = v26
v1.ice_dimension_2025_shiver_cone_bait = v25
local v36 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v37 = {}
local v38 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_subzero_scorpion_sticker"
        }
    }
}
local v39 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_shiver_wolf_sticker"
        }
    }
}
local v40 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_ice_dimension_portal_sticker"
        }
    }
}
local v41 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_cold_tim_sticker"
        }
    }
}
local v42 = {
    ["chance"] = 0.25,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 50
        }
    }
}
local v43 = {
    ["chance"] = 0.13,
    ["rewards"] = {
        {
            ["category"] = "currency",
            ["kind"] = "money",
            ["amount"] = 100
        }
    }
}
local v44 = {
    ["chance"] = 0.12,
    ["rewards"] = {
        {
            ["category"] = "food",
            ["kind"] = "pet_age_potion"
        }
    }
}
local v45 = {
    ["chance"] = 0.0999,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "ice_dimension_2025_subzero_scorpion"
        }
    }
}
local v46 = {
    ["chance"] = 0.0001,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "ice_dimension_2025_frostbite_bear"
        }
    }
}
__set_list(v37, 1, {v38, v39, v40, v41, v42, v43, v44, v45, v46})
v36.possible_loot = v37
v1.ice_dimension_2025_subzero_popsicle_bait = v36
local v47 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v48 = {}
local v49 = {
    ["chance"] = 0.2,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_ash_zebra_sticker"
        }
    }
}
local v50 = {
    ["chance"] = 0.2,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_campfire_cookies_bait_sticker"
        }
    }
}
local v51 = {
    ["chance"] = 0.125,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_fire_dimension_portal_sticker"
        }
    }
}
local v52 = {
    ["chance"] = 0.125,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_magma_snail_sticker"
        }
    }
}
local v53 = {
    ["chance"] = 0.085,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_flaming_zebra_sticker"
        }
    }
}
local v54 = {
    ["chance"] = 0.085,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_burning_bunny_sticker"
        }
    }
}
local v55 = {
    ["chance"] = 0.04666666666666667,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_magma_moose_sticker"
        }
    }
}
local v56 = {
    ["chance"] = 0.04666666666666667,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_wildfire_hawk_sticker"
        }
    }
}
local v57 = {
    ["chance"] = 0.04666666666666667,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_christmas_pudding_pup_sticker"
        }
    }
}
local v58 = {
    ["chance"] = 0.013166666666666667,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_flaming_fox_sticker"
        }
    }
}
local v59 = {
    ["chance"] = 0.013166666666666667,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_toasty_red_panda_sticker"
        }
    }
}
local v60 = {
    ["chance"] = 0.013166666666666667,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_volcanic_rhino_sticker"
        }
    }
}
local v61 = {
    ["chance"] = 0.0005,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "ice_dimension_2025_blazing_lion_animated_sticker",
            ["force_show_chance"] = true
        }
    }
}
__set_list(v48, 1, {v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61})
v47.possible_loot = v48
v1.ice_dimension_2025_fire_dimension_sticker_pack = v47
return v1