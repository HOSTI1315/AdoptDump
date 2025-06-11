--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.LootBoxRewards (ModuleScript)

local v1 = {}
local v2 = {
    ["public"] = true,
    ["exchangeable"] = {
        ["category"] = "gifts",
        ["kind"] = "spring_2025_kaijunior_box"
    }
}
local v3 = {}
local v4 = {
    ["chance"] = 0.7,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "spring_2025_spotted_kaijunior"
        }
    }
}
local v5 = {
    ["chance"] = 0.24,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "spring_2025_toxic_kaijunior"
        }
    }
}
local v6 = {
    ["chance"] = 0.05,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "spring_2025_spiked_kaijunior"
        }
    }
}
local v7 = {
    ["chance"] = 0.01,
    ["rewards"] = {
        {
            ["category"] = "pets",
            ["kind"] = "spring_2025_scorching_kaijunior"
        }
    }
}
__set_list(v3, 1, {v4, v5, v6, v7})
v2.possible_loot = v3
v1.spring_2025_kaijunior_box = v2
local v8 = {
    ["public"] = true,
    ["exchangeable"] = false
}
local v9 = {}
local v10 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_cherry_blossom_tree"
        }
    }
}
local v11 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_cherry_blossom_flower_sticker"
        }
    }
}
local v12 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_easter_egg_sticker"
        }
    }
}
local v13 = {
    ["chance"] = 0.1,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_egg_basket_sticker"
        }
    }
}
local v14 = {
    ["chance"] = 0.0625,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_bakeneko_sticker"
        }
    }
}
local v15 = {
    ["chance"] = 0.0625,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_kaijunior_sticker"
        }
    }
}
local v16 = {
    ["chance"] = 0.0625,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_hang_glider_sticker"
        }
    }
}
local v17 = {
    ["chance"] = 0.0625,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_wood_pigeon_sticker"
        }
    }
}
local v18 = {
    ["chance"] = 0.0425,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_dotted_eggy_sticker"
        }
    }
}
local v19 = {
    ["chance"] = 0.0425,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_flower_power_duckling_sticker"
        }
    }
}
local v20 = {
    ["chance"] = 0.0425,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_mirai_moth_sticker"
        }
    }
}
local v21 = {
    ["chance"] = 0.0425,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_primal_kaijunior_sticker"
        }
    }
}
local v22 = {
    ["chance"] = 0.035,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_kage_crow_sticker"
        }
    }
}
local v23 = {
    ["chance"] = 0.035,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_toxic_kaijunior_sticker"
        }
    }
}
local v24 = {
    ["chance"] = 0.035,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_cabbit_sticker"
        }
    }
}
local v25 = {
    ["chance"] = 0.035,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_mecha_rabbit_sticker"
        }
    }
}
__set_list(v9, 1, {v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25})
local v26 = {
    ["chance"] = 0.009875,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_sakura_spirit_sticker"
        }
    }
}
local v27 = {
    ["chance"] = 0.009875,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_kappakid_sticker"
        }
    }
}
local v28 = {
    ["chance"] = 0.009875,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_scorching_kaijunior_sticker"
        }
    }
}
local v29 = {
    ["chance"] = 0.009875,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_candyfloss_chick_sticker"
        }
    }
}
local v30 = {
    ["chance"] = 0.0005,
    ["rewards"] = {
        {
            ["category"] = "stickers",
            ["kind"] = "spring_2025_super_saru_sticker",
            ["force_show_chance"] = true
        }
    }
}
__set_list(v9, 17, {v26, v27, v28, v29, v30})
v8.possible_loot = v9
v1.spring_2025_cherry_blossom_sticker_pack = v8
return v1