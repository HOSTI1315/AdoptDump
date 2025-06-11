--// ReplicatedStorage.ClientDB.AvatarItemSupplementalDB (ModuleScript)

local v1 = {}
local v2 = {
    ["red_skirt"] = {
        ["image_id"] = 2802395049
    },
    ["purple_skirt"] = {
        ["image_id"] = 2802394888
    },
    ["pink_layered_skirt"] = {
        ["image_id"] = 2802394771
    },
    ["blue_layered_skirt"] = {
        ["image_id"] = 2802394601
    },
    ["blue_mini_skirt"] = {
        ["image_id"] = 2802394651,
        ["sit_orientation"] = -90
    },
    ["green_mini_skirt"] = {
        ["image_id"] = 2802394718,
        ["sit_orientation"] = -90
    },
    ["pink_skater_skirt"] = {
        ["image_id"] = 2802394830
    },
    ["purple_skater_skirt"] = {
        ["image_id"] = 2802394946
    },
    ["blue_cheerleader_skirt"] = {
        ["image_id"] = 2802394528
    },
    ["red_cheerleader_skirt"] = {
        ["image_id"] = 2802394995
    },
    ["yellow_cheerleader_skirt"] = {
        ["image_id"] = 2802395100
    }
}
v1.skirts = v2
local v3 = {
    ["royal_wings"] = {
        ["image_id"] = 2749690579,
        ["wing_decal_id"] = 2748149552,
        ["wing_decal_px_size"] = 400,
        ["wing_part_stud_size"] = 4
    },
    ["sapphire_wings"] = {
        ["image_id"] = 2749690428,
        ["wing_decal_id"] = 2749323143,
        ["wing_decal_px_size"] = 400,
        ["wing_part_stud_size"] = 4
    },
    ["angel_wings"] = {
        ["image_id"] = 2749690358,
        ["wing_decal_id"] = 2749525168,
        ["wing_decal_px_size"] = 500,
        ["wing_part_stud_size"] = 6,
        ["wing_y_position_adjustment"] = 0.3
    },
    ["emerald_wings"] = {
        ["image_id"] = 2749690488,
        ["wing_decal_id"] = 2749582144,
        ["wing_decal_px_size"] = 400,
        ["wing_part_stud_size"] = 4
    },
    ["gold_fairy_wings"] = {
        ["image_id"] = 2749690533,
        ["wing_decal_id"] = 2749591020,
        ["wing_decal_px_size"] = 400,
        ["wing_part_stud_size"] = 4
    }
}
v1.wings = v3
local v4 = {
    ["autumn_leaves"] = {
        ["image_id"] = 2743853502
    },
    ["music"] = {
        ["image_id"] = 2744286925
    },
    ["party"] = {
        ["image_id"] = 2744293262
    },
    ["electrifying"] = {
        ["image_id"] = 2744308266
    },
    ["pink_aura"] = {
        ["image_id"] = 2746233053
    },
    ["purple_aura"] = {
        ["image_id"] = 2746233063
    },
    ["blue_aura"] = {
        ["image_id"] = 2746235771
    },
    ["gold_aura"] = {
        ["image_id"] = 2746233065
    },
    ["famous"] = {
        ["image_id"] = 2746288743
    },
    ["stellar"] = {
        ["image_id"] = 2746411182,
        ["in_attachment"] = true
    },
    ["rose_petals"] = {
        ["image_id"] = 2747824817
    },
    ["bubbly"] = {
        ["image_id"] = 2747819701
    },
    ["starstruck"] = {
        ["image_id"] = 2747906423
    },
    ["balloons"] = {
        ["image_id"] = 2747807832
    },
    ["universe"] = {
        ["image_id"] = 2747791449
    }
}
v1.particles = v4
local v5 = {
    [5766892652] = {
        ["name"] = "Adopt Me!: BEES!",
        ["category"] = "wings"
    },
    [10648446748] = {
        ["name"] = "Rainbow Maker",
        ["category"] = "wings"
    },
    [12272063479] = {
        ["name"] = "Growing Flower Hat",
        ["category"] = "hats"
    }
}
v1.catalog_blacklist = v5
return v1