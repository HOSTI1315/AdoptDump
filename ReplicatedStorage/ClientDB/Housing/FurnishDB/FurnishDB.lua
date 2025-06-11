--// ReplicatedStorage.ClientDB.Housing.FurnishDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("FurnitureDB")
local v3 = v1("TexturesDB")
local v4 = v1("HouseDB")
local v5 = v1("package:Sift")
local v_u_6 = {}
local function v10(p7)
    local v8 = {}
    for _, v9 in v_u_2 do
        if v9.tags and table.find(v9.tags, p7) then
            table.insert(v8, v9)
        end
    end
    return v8
end
local function v16(p11)
    local v12 = {}
    for _, v13 in pairs(v_u_2) do
        if v13.tags then
            local v14 = true
            for _, v15 in p11 do
                if not table.find(v13.tags, v15) then
                    v14 = false
                    break
                end
            end
            if v14 then
                table.insert(v12, v13)
            end
        end
    end
    return v12
end
local v_u_17 = {
    {
        ["name"] = "Starter Stuff",
        ["contents"] = v10("PetNeeds")
    },
    {
        ["name"] = "Moon House",
        ["tags"] = { "themed" },
        ["contents"] = v10("MoonHouse2025")
    },
    {
        ["name"] = "Comfy",
        ["tags"] = { "themed" },
        ["contents"] = v10("Comfy2025")
    },
    {
        ["name"] = "Ice Cream House",
        ["tags"] = { "themed" },
        ["contents"] = v10("IceCreamHouse2025")
    },
    {
        ["name"] = "Moon",
        ["tags"] = { "themed" },
        ["contents"] = v10("Moon2025")
    },
    {
        ["name"] = "Valentines",
        ["tags"] = { "themed" },
        ["contents"] = v10("Valentines2025")
    },
    {
        ["name"] = "Winter 2024",
        ["tags"] = { "themed" },
        ["contents"] = v10("Winter2024")
    },
    {
        ["name"] = "Plants",
        ["tags"] = { "themed" },
        ["contents"] = v10("Plants2024")
    },
    {
        ["name"] = "New Year 2024",
        ["tags"] = { "themed" },
        ["contents"] = v10("NYE2024")
    },
    {
        ["name"] = "Soccer Stadium",
        ["tags"] = { "themed" },
        ["contents"] = v10("Soccer2024")
    },
    {
        ["name"] = "Prehistoric",
        ["tags"] = { "themed" },
        ["contents"] = v10("Fossil2024")
    },
    {
        ["name"] = "Stands",
        ["contents"] = v10("Stand")
    },
    {
        ["name"] = "Korean",
        ["tags"] = { "themed" },
        ["contents"] = v10("LNY2024")
    },
    {
        ["name"] = "Diner",
        ["tags"] = { "themed" },
        ["contents"] = v10("SofahogDiner2024")
    },
    {
        ["name"] = "Dystopian",
        ["tags"] = { "themed" },
        ["contents"] = v10("SofahogPostApoc2024")
    },
    {
        ["name"] = "Medieval",
        ["tags"] = { "themed" },
        ["contents"] = v10("SofahogMedieval2024")
    }
}
local v18 = {
    ["name"] = "Queensland",
    ["tags"] = { "themed" },
    ["contents"] = v10("QueenslanderHouse2024")
}
local v19 = {
    ["name"] = "Haunted House",
    ["tags"] = { "themed" },
    ["contents"] = v10("HauntedHouse2023")
}
local v20 = {
    ["name"] = "Toyshop",
    ["tags"] = { "themed" },
    ["contents"] = v10("ToyshopPlaceable")
}
local v21 = {
    ["name"] = "Lures",
    ["tags"] = { "misc" },
    ["contents"] = v10("Lures2023")
}
local v22 = {
    ["name"] = "Expandable Houses",
    ["tags"] = { "themed" },
    ["contents"] = {
        {
            ["name"] = "Luxury",
            ["contents"] = v10("ExpandableHouses2023Luxury")
        },
        {
            ["name"] = "Friendly",
            ["contents"] = v10("ExpandableHouses2023Friendly")
        },
        {
            ["name"] = "Hillside",
            ["contents"] = v10("ExpandableHouses2023Hillside")
        }
    }
}
local v23 = {
    ["name"] = "Racetrack",
    ["tags"] = { "themed" },
    ["contents"] = {
        {
            ["name"] = "Pre-Built Racetracks",
            ["permitted_houses"] = { "racetrack_house" },
            ["contents"] = v16({ "Racehouse2023", "tracks" })
        },
        {
            ["name"] = "Custom Racetracks",
            ["permitted_houses"] = { "castle_house", "sandbox_island", "racetrack_house" },
            ["contents"] = v16({ "Racehouse2023", "track_parts" })
        },
        {
            ["name"] = "Exterior Furniture",
            ["contents"] = v16({ "Racehouse2023", "exterior" })
        },
        {
            ["name"] = "Interior Furniture",
            ["contents"] = v16({ "Racehouse2023", "interior" })
        }
    }
}
__set_list(v_u_17, 17, {v18, v19, v20, v21, v22, v23, {
    ["name"] = "Safari",
    ["tags"] = { "themed" },
    ["contents"] = v10("Safari2023Placeable")
}, {
    ["name"] = "School",
    ["tags"] = { "themed" },
    ["contents"] = v10("SchoolRefresh2023")
}, {
    ["name"] = "Hospital",
    ["tags"] = { "themed" },
    ["contents"] = v10("HospitalRefresh2023")
}, {
    ["name"] = "Mountain House",
    ["tags"] = { "themed" },
    ["contents"] = v10("ModularCastles2023")
}, {
    ["name"] = "Upcycled",
    ["tags"] = { "themed" },
    ["contents"] = v10("Reclaimed2023Placeable")
}, {
    ["name"] = "Meme 2023",
    ["tags"] = { "themed" },
    ["contents"] = v10("Meme2023Placeable")
}, {
    ["name"] = "Post-Apocalyptic",
    ["tags"] = { "themed" },
    ["contents"] = v10("Bunker2022")
}, {
    ["name"] = "Ancient Egyptian",
    ["tags"] = { "themed" },
    ["contents"] = v10("Egypt2023")
}, {
    ["name"] = "Beach",
    ["tags"] = { "themed" },
    ["contents"] = v10("Beach2023")
}, {
    ["name"] = "Farm",
    ["tags"] = { "themed" },
    ["contents"] = v10("Farm2023")
}})
local v24 = {
    ["name"] = "Winter 2022",
    ["tags"] = { "themed" },
    ["contents"] = v10("Winter2022Placeable")
}
local v25 = {
    ["name"] = "Halloween",
    ["tags"] = { "themed" },
    ["contents"] = v10("Halloween2022Placeable")
}
local v26 = {
    ["name"] = "Neanderthal",
    ["tags"] = { "themed" },
    ["contents"] = v10("Neanderthal2022")
}
local v27 = {
    ["name"] = "Influencer",
    ["tags"] = { "themed" },
    ["contents"] = v10("Influencer2022")
}
local v28 = {
    ["name"] = "Candy",
    ["tags"] = { "themed" },
    ["contents"] = v10("Candy2022")
}
local v29 = {
    ["name"] = "Japanese",
    ["tags"] = { "themed" },
    ["contents"] = v10("Japan2022Placeable")
}
local v30 = {
    ["name"] = "Royal Palace",
    ["tags"] = { "themed" },
    ["contents"] = v10("RoyalPalace2022")
}
local v31 = {
    ["name"] = "Botanical",
    ["tags"] = { "themed" },
    ["contents"] = v10("Botanical2022Placeable")
}
local v32 = {
    ["name"] = "Steampunk",
    ["tags"] = { "themed" },
    ["contents"] = v10("Steampunk2022")
}
local v33 = {
    ["name"] = "High Fantasy",
    ["tags"] = { "themed" },
    ["contents"] = v10("HighFantasy2022Placeable")
}
local v34 = {
    ["name"] = "VIP",
    ["tags"] = { "themed" },
    ["contents"] = v10("VIP2022")
}
local v35 = {
    ["name"] = "Biodome",
    ["tags"] = { "themed" },
    ["contents"] = v10("Biodome2022")
}
local v36 = {
    ["name"] = "1950s",
    ["tags"] = { "themed" },
    ["contents"] = v10("Fifties2022")
}
local v37 = {
    ["name"] = "Space",
    ["tags"] = { "themed" },
    ["contents"] = v10("SpaceHouse2022Placeable")
}
local v38 = {
    ["name"] = "Pride",
    ["tags"] = { "themed" },
    ["contents"] = {
        {
            ["name"] = "Furniture",
            ["contents"] = {
                v_u_2.pride_2022_pride_food_bowl,
                v_u_2.pride_2022_pride_water_bowl,
                v_u_2.pride_2022_pride_crib,
                v_u_2.pride_2022_pride_bed,
                v_u_2.pride_2022_pride_fridge,
                v_u_2.pride_2022_pride_shower,
                v_u_2.pride_2022_pride_sofa,
                v_u_2.pride_2022_pride_table,
                v_u_2.pride_2022_pride_lamp
            }
        },
        {
            ["name"] = "Flags",
            ["contents"] = {
                v_u_2.pride_flag,
                v_u_2.agender_flag,
                v_u_2.aromantic_flag,
                v_u_2.asexual_flag,
                v_u_2.bisexual_flag,
                v_u_2.demisexual_flag,
                v_u_2.gay_man_flag,
                v_u_2.genderfluid_flag,
                v_u_2.lesbian_flag,
                v_u_2.nonbinary_flag,
                v_u_2.pansexual_flag,
                v_u_2.transgender_flag,
                v_u_2.lgbtq_flag,
                v_u_2.genderqueer_flag,
                v_u_2.intersex_flag,
                v_u_2.omnisexual_flag
            }
        }
    }
}
__set_list(v_u_17, 33, {v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, {
    ["name"] = "Plain Shapes",
    ["tags"] = { "shapes" },
    ["priority"] = 2,
    ["contents"] = v10("Sandbox2022Primitive_plain")
}})
__set_list(v_u_17, 49, {{
    ["name"] = "Glass Shapes",
    ["tags"] = { "shapes" },
    ["priority"] = 2,
    ["contents"] = v10("Sandbox2022Primitive_glass")
}, {
    ["name"] = "Brick Shapes",
    ["tags"] = { "shapes" },
    ["priority"] = 2,
    ["contents"] = v10("Sandbox2022Primitive_brick")
}, {
    ["name"] = "Wood Shapes",
    ["tags"] = { "shapes" },
    ["priority"] = 2,
    ["contents"] = v10("Sandbox2022Primitive_wood")
}, {
    ["name"] = "Stone Shapes",
    ["tags"] = { "shapes" },
    ["priority"] = 2,
    ["contents"] = v10("Sandbox2022Primitive_stone")
}, {
    ["name"] = "Mounds",
    ["tags"] = { "shapes" },
    ["priority"] = 3,
    ["contents"] = v10("Sandbox2022Mound")
}, {
    ["name"] = "Ropes",
    ["tags"] = { "standard" },
    ["priority"] = 6,
    ["contents"] = v10("Sandbox2022Rope")
}, {
    ["name"] = "Driftwood",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.driftwood_bed,
        v_u_2.driftwood_chair,
        v_u_2.driftwood_crib,
        v_u_2.driftwood_foodbowl,
        v_u_2.driftwood_fridge,
        v_u_2.driftwood_hanginglamp,
        v_u_2.driftwood_petbed,
        v_u_2.driftwood_shower,
        v_u_2.driftwood_sofa,
        v_u_2.driftwood_waterbowl,
        v_u_2.driftwood_lamp
    }
}, {
    ["name"] = "Rattan",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.rattan_bed,
        v_u_2.rattan_chair,
        v_u_2.rattan_crib,
        v_u_2.rattan_foodbowl,
        v_u_2.rattan_fridge,
        v_u_2.rattan_petbed,
        v_u_2.rattan_shower,
        v_u_2.rattan_sofa,
        v_u_2.rattan_table,
        v_u_2.rattan_waterbowl
    }
}, {
    ["name"] = "Island House",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.island_rock,
        v_u_2.large_island_rock,
        v_u_2.mound,
        v_u_2.rocky_mound,
        v_u_2.small_island_tree,
        v_u_2.medium_island_tree,
        v_u_2.lit_island_tree,
        v_u_2.board_walk,
        v_u_2.board_walk_turn
    }
}, {
    ["name"] = "Cozy House",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "cozy" },
    ["contents"] = {
        v_u_2.cozy_2021_log_bed,
        v_u_2.cozy_2021_log_crib,
        v_u_2.cozy_2021_log_sofa,
        v_u_2.cozy_2021_log_chair,
        v_u_2.cozy_2021_log_stool,
        v_u_2.cozy_2021_log_large_table,
        v_u_2.cozy_2021_log_shower,
        v_u_2.cozy_2021_log_food_bowl,
        v_u_2.cozy_2021_log_water_bowl,
        v_u_2.cozy_2021_log_fridge
    }
}, {
    ["name"] = "Spooky House",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "scary" },
    ["contents"] = {
        v_u_2.scary_2021_slime_cauldron_bath,
        v_u_2.scary_2021_stone_dragon_statue,
        v_u_2.scary_2021_squat_potion_mushroom,
        v_u_2.scary_2021_short_potion_mushroom,
        v_u_2.scary_2021_tall_potion_mushroom,
        v_u_2.scary_2021_metal_hanging_chain,
        v_u_2.scary_2021_metal_hanging_chains,
        v_u_2.scary_2021_stone_human_pillar,
        v_u_2.scary_2021_scary_branch_mounted_lantern,
        v_u_2.scary_2021_scary_pillar_mounted_lantern,
        v_u_2.scary_2021_scary_wall_mounted_lantern,
        v_u_2.scary_2021_stay_out_sign_raven,
        v_u_2.scary_2021_stay_out_sign_skull,
        v_u_2.scary_2021_stone_throne,
        v_u_2.scary_2021_stone_pedestal_table,
        v_u_2.scary_2021_stone_dining_table,
        v_u_2.scary_2021_scattered_skulls,
        v_u_2.scary_2021_stone_tomb_table,
        v_u_2.scary_2021_spider_web_bed,
        v_u_2.scary_2021_cage_crib,
        v_u_2.scary_2021_toxic_waste_shower,
        v_u_2.scary_2021_pumpkin_pet_food_bowl,
        v_u_2.scary_2021_pumpkin_pet_water_bowl,
        v_u_2.scary_2021_coffin_fridge,
        v_u_2.scary_2021_grave_pet_bed
    }
}, {
    ["name"] = "Baby Shop",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.a_block,
        v_u_2.b_block,
        v_u_2.c_block,
        v_u_2.baby_shop_mobile,
        v_u_2.small_cloud_light,
        v_u_2.large_cloud_light,
        v_u_2.baby_shop_counter,
        v_u_2.baby_pink_hanging_shelf,
        v_u_2.neon_rainbow_light,
        v_u_2.baby_bottle_sign,
        v_u_2.baby_shop_wall_sconce,
        v_u_2.cloud
    }
}, {
    ["name"] = "Artsy",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.sasquatch_wall_art,
        v_u_2.ocean_friends_wall_art,
        v_u_2.owl_garden_wall_art,
        v_u_2.bat_friends_wall_art,
        v_u_2.imagination_wall_art,
        v_u_2.the_petverse_wall_art,
        v_u_2.to_the_stars_wall_art,
        v_u_2.skelerex_wall_art,
        v_u_2.lazy_days_wall_art,
        v_u_2.shiba_fields_wall_art,
        v_u_2.raincloud_shower,
        v_u_2.dog_table,
        v_u_2.banana_pet_bed,
        v_u_2.frosty_fridge,
        v_u_2.toilet_water_bowl,
        v_u_2.tire_food_bowl,
        v_u_2.box_trap_bed,
        v_u_2.moon_crib,
        v_u_2.sub_sofa,
        v_u_2.long_cat_wardrobe,
        v_u_2.bookish_book_case,
        v_u_2.tree_lamp
    }
}, {
    ["name"] = "Easter",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.chick_fridge,
        v_u_2.egg_shower,
        v_u_2.bunny_bed,
        v_u_2.cracked_egg_water_bowl,
        v_u_2.cracked_egg_food_bowl,
        v_u_2.plush_bunny_pet_bed,
        v_u_2.egg_crib
    }
}, {
    ["name"] = "Retro Aquatic",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.retro_aquatic_bed,
        v_u_2.retro_aquatic_crib,
        v_u_2.retro_aquatic_pet_bed,
        v_u_2.retro_aquatic_pet_bowl,
        v_u_2.retro_aquatic_shower,
        v_u_2.retro_aquatic_table,
        v_u_2.retro_aquatic_fridge
    }
}, {
    ["name"] = "Lunar Furniture",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "lunar" },
    ["contents"] = {
        v_u_2.lacquer_crib,
        v_u_2.lacquer_day_bed,
        v_u_2.lacquer_dragon_lamp,
        v_u_2.lacquer_fridge,
        v_u_2.lacquer_moon_display,
        v_u_2.lacquer_pagoda_bed,
        v_u_2.lacquer_pet_bed,
        v_u_2.lacquer_scroll_chair,
        v_u_2.lacquer_cabinet,
        v_u_2.lacquer_dresser,
        v_u_2.porcelain_food_bowl,
        v_u_2.porcelain_water_bowl,
        v_u_2.wooden_shower,
        v_u_2.wooden_tub
    }
}})
__set_list(v_u_17, 65, {{
    ["name"] = "Winter",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "winter" },
    ["contents"] = {
        v_u_2.ice_pedestal,
        v_u_2.frost_fury_statue,
        v_u_2.snowflake,
        v_u_2.sconce,
        v_u_2.ice_flower
    }
}, {
    ["name"] = "Fall",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.umbrella,
        v_u_2.big_lantern,
        v_u_2.planted_bamboo,
        v_u_2.small_lantern,
        v_u_2.small_red_panda_statue,
        v_u_2.big_red_panda_statue,
        v_u_2.wooden_fence,
        v_u_2.tall_pumpkin,
        v_u_2.stubby_pumpkin,
        v_u_2.pumpkin,
        v_u_2.fall_bed,
        v_u_2.cozy_table,
        v_u_2.fall_dining_chair,
        v_u_2.poofy_chair,
        v_u_2.vintage_lantern,
        v_u_2.wood_rail,
        v_u_2.hot_spring,
        v_u_2.vintage_lamp_post,
        v_u_2.tombstone
    }
}, {
    ["name"] = "Pirate",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "pirate" },
    ["contents"] = {
        v_u_2.ship_bed,
        v_u_2.boat_crib,
        v_u_2.ship_couch,
        v_u_2.plank_chair,
        v_u_2.barrel_table,
        v_u_2.shark_desk,
        v_u_2.pirate_jukebox,
        v_u_2.barrel_tv,
        v_u_2.crate_fridge,
        v_u_2.pirate_food_bowl,
        v_u_2.pirate_water_bowl,
        v_u_2.scroll_closed,
        v_u_2.scroll_open,
        v_u_2.bottled_ship,
        v_u_2.skull_candle_01,
        v_u_2.skull_candle_02,
        v_u_2.globe_stand,
        v_u_2.pirate_telescope
    }
}, {
    ["name"] = "Modern",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "modern" },
    ["contents"] = {
        v_u_2.modern_bed_2,
        v_u_2.modern_chair_2,
        v_u_2.modern_coffee_table_2,
        v_u_2.modern_couch,
        v_u_2.modern_dining_chair,
        v_u_2.modern_dining_table,
        v_u_2.modern_feature_tv,
        v_u_2.modern_lamp,
        v_u_2.modern_fridge,
        v_u_2.modern_toilet,
        v_u_2.walk_in_shower
    }
}, {
    ["name"] = "Sleek",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.sleek_bed,
        v_u_2.sleek_chair,
        v_u_2.sleek_couch,
        v_u_2.sleek_fridge,
        v_u_2.sleek_floor_lamp,
        v_u_2.sleek_feeder,
        v_u_2.small_terrarium,
        v_u_2.medium_terrarium,
        v_u_2.large_terrarium
    }
}, {
    ["name"] = "Simple Shapes",
    ["tags"] = { "shapes" },
    ["priority"] = 1,
    ["contents"] = {
        v_u_2.brick,
        v_u_2.medium_block,
        v_u_2.large_block,
        v_u_2.medium_cylinder,
        v_u_2.large_cylinder,
        v_u_2.medium_disk,
        v_u_2.large_disk,
        v_u_2.medium_wedge,
        v_u_2.large_wedge
    }
}, {
    ["name"] = "Magic",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.magic_coffee_table,
        v_u_2.magic_cupboard,
        v_u_2.magic_nightstand,
        v_u_2.magic_dining_table,
        v_u_2.magic_wardrobe,
        v_u_2.magic_fridge,
        v_u_2.magic_floor_lamp,
        v_u_2.magic_bed,
        v_u_2.magic_sofa,
        v_u_2.magic_arm_chair,
        v_u_2.magic_dining_chair,
        v_u_2.magic_suitcase,
        v_u_2.magic_stool,
        v_u_2.magic_candles,
        v_u_2.magic_short_candle,
        v_u_2.magic_medium_candle,
        v_u_2.magic_tall_candle,
        v_u_2.magic_book_stack,
        v_u_2.magic_tall_book_stack,
        v_u_2.magic_open_book,
        v_u_2.magic_closed_book
    }
}, {
    ["name"] = "Eastern",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.bamboo_plant,
        v_u_2.shoji_screen,
        v_u_2.drum,
        v_u_2.drum_sticks,
        v_u_2.lantern,
        v_u_2.eastern_table,
        v_u_2.eastern_couch,
        v_u_2.eastern_sofa,
        v_u_2.eastern_coffee_table,
        v_u_2.green_tea_cup,
        v_u_2.green_tea_kettle,
        v_u_2.oolong_tea_cup,
        v_u_2.oolong_tea_kettle,
        v_u_2.jasmine_tea_cup,
        v_u_2.jasmine_tea_kettle
    }
}, {
    ["name"] = "Gingerbread",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "gingerbread" },
    ["contents"] = {
        v_u_2.gingerbread_shower,
        v_u_2.gingerbread_tv,
        v_u_2.gingerbread_jukebox,
        v_u_2.gingerbread_bed,
        v_u_2.gingerbread_sofa,
        v_u_2.gingerbread_chair,
        v_u_2.gingerbread_floor_lamp,
        v_u_2.gingerbread_table,
        v_u_2.gingerbread_fridge
    }
}, {
    ["name"] = "Tropical",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.rolling_ball,
        v_u_2.tiki_torch,
        v_u_2.volcano_food_bowl,
        v_u_2.island_water_bowl,
        v_u_2.large_palm_tree,
        v_u_2.small_palm_tree,
        v_u_2.ancient_staircase,
        v_u_2.legendary_crystal,
        v_u_2.fairy_tree,
        v_u_2.pirate_bed,
        v_u_2.coconut_chair,
        v_u_2.sand_castle_throne,
        v_u_2.treasure_chest_sofa,
        v_u_2.golden_cash_register,
        v_u_2.hammock,
        v_u_2.floating_balloon,
        v_u_2.human_cannon,
        v_u_2.confetti_cannon
    }
}, {
    ["name"] = "Pets",
    ["tags"] = { "standard" },
    ["priority"] = 1,
    ["contents"] = {
        v_u_2.water_trough,
        v_u_2.pet_food_bowl,
        v_u_2.pet_water_bowl,
        v_u_2.sleek_feeder,
        v_u_2.modern_pet_bowls,
        v_u_2.bone_pet_bowls,
        v_u_2.circular_pet_bed,
        v_u_2.rectangular_pet_bed,
        v_u_2.fancy_pet_bed,
        v_u_2.royal_pet_bed,
        v_u_2.pet_house,
        v_u_2.castle_pet_bed,
        v_u_2.modern_pet_bed,
        v_u_2.crib_pet_bed,
        v_u_2.circular_pet_bathtub,
        v_u_2.oval_pet_bathtub,
        v_u_2.pet_bathtub,
        v_u_2.cheap_pet_bathtub,
        v_u_2.dog_bone_rug,
        v_u_2.unicorn_horn_rug,
        v_u_2.cat_ear_rug
    }
}, {
    ["name"] = "Fairy",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "fairy" },
    ["contents"] = {
        v_u_2.flowerbed,
        v_u_2.royalfairybench,
        v_u_2.flowerbench,
        v_u_2.royalfairychair,
        v_u_2.royalfairythrone,
        v_u_2.tulipchair,
        v_u_2.flowerchair,
        v_u_2.logseat,
        v_u_2.royalfairytable,
        v_u_2.butterflytable,
        v_u_2.flowertable,
        v_u_2.petaltable,
        v_u_2.leaftv,
        v_u_2.flowerlamp,
        v_u_2.tinyfairytree,
        v_u_2.largefairytree,
        v_u_2.smallfairytree
    }
}, {
    ["name"] = "Forest",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.star_sleeping_bag,
        v_u_2.grill,
        v_u_2.royal_tent,
        v_u_2.forest_chair,
        v_u_2.forest_bench,
        v_u_2.stump_chair,
        v_u_2.tree_house_bed,
        v_u_2.forest_arch,
        v_u_2.magical_forest_bench,
        v_u_2.big_rock,
        v_u_2.bird_bath,
        v_u_2.forest_well
    }
}, {
    ["name"] = "Mermaid",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "mermaid" },
    ["contents"] = {
        v_u_2.mermaidtreasurechest,
        v_u_2.mermaidthrone,
        v_u_2.mermaidtv,
        v_u_2.mermaidhottub,
        v_u_2.mermaidfridge,
        v_u_2.fishtank,
        v_u_2.shellseat,
        v_u_2.shellcouch,
        v_u_2.mermaidlamp,
        v_u_2.mermaidcouch,
        v_u_2.mermaidchair,
        v_u_2.mermaidcrib,
        v_u_2.mermaidbed
    }
}, {
    ["name"] = "The Future",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "future" },
    ["contents"] = {
        v_u_2.cinemascreen,
        v_u_2.futuristichottub,
        v_u_2.curvedseat,
        v_u_2.futuristicbed,
        v_u_2.futuristiccrib,
        v_u_2.spaceshipcouch,
        v_u_2.futuristictv,
        v_u_2.futuristicsofa,
        v_u_2.floatingchair,
        v_u_2.futuristicchair,
        v_u_2.futuristicfridge
    }
}, {
    ["name"] = "Donut Shop",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "donutshop" },
    ["contents"] = {
        v_u_2.donuts,
        v_u_2.donutrug,
        v_u_2.vanilla_icing,
        v_u_2.chocolate_icing,
        v_u_2.strawberry_icing,
        v_u_2.donut_oven,
        v_u_2.donut_fountain,
        v_u_2.donut_table,
        v_u_2.small_donut_chair,
        v_u_2.donut_lamp,
        v_u_2.donut_bed,
        v_u_2.donut_craft_table,
        v_u_2.donut_crib,
        v_u_2.cute_donut_sofa,
        v_u_2.basic_donut_table,
        v_u_2.donut_chair,
        v_u_2.donut_sofa,
        v_u_2.circular_donut_seat,
        v_u_2.donut_crib_bed
    }
}})
local v39 = {
    ["name"] = "Baby Stuff",
    ["tags"] = { "standard" },
    ["priority"] = 2,
    ["contents"] = {
        v_u_2.age_o_matic,
        v_u_2.basiccrib,
        v_u_2.poshcrib,
        v_u_2.royalcrib,
        v_u_2.normalcrib,
        v_u_2.parentchildtable,
        v_u_2.cribbed,
        v_u_2.hottub,
        v_u_2.parentchildthrone,
        v_u_2.parentchildchair,
        v_u_2.twokidsthrone,
        v_u_2.ballpit,
        v_u_2.bouncycastle,
        v_u_2.boxofted,
        v_u_2.highchair,
        v_u_2.bigdrawing,
        v_u_2.metaldrawing,
        v_u_2.woodendrawing
    }
}
local v40 = {
    ["name"] = "Pizza Place",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "pizzaplace" },
    ["contents"] = {
        v_u_2.pizzadough,
        v_u_2.tomato_topping,
        v_u_2.cheese_topping,
        v_u_2.pepperoni_topping,
        v_u_2.peppers_topping,
        v_u_2.squarewoodpagoda,
        v_u_2.firepit,
        v_u_2.hangingpots,
        v_u_2.pot,
        v_u_2.largepot,
        v_u_2.pagoda,
        v_u_2.pizzaoven,
        v_u_2.pizzabench,
        v_u_2.placemat,
        v_u_2.circulareatingtable,
        v_u_2.longdiningbench,
        v_u_2.squarediningbench,
        v_u_2.sculpture,
        v_u_2.towelrack,
        v_u_2.woodbowl,
        v_u_2.kettle,
        v_u_2.cashregister,
        v_u_2.modesteatingtable,
        v_u_2.largeeatingtable,
        v_u_2.choppingboard,
        v_u_2.pan,
        v_u_2.plate,
        v_u_2.smallplate,
        v_u_2.bowl,
        v_u_2.blender
    }
}
local v41 = {
    ["name"] = "Party",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "party" },
    ["contents"] = {
        v_u_2.discoball,
        v_u_2.piano,
        v_u_2.dj,
        v_u_2.trusslights,
        v_u_2.star,
        v_u_2.ballpit,
        v_u_2.balloons,
        v_u_2.truss,
        v_u_2.photowall,
        v_u_2.bouncycastle,
        v_u_2.dancefloor,
        v_u_2.catwalk,
        v_u_2.thickfloorplate,
        v_u_2.mediumfloorplate,
        v_u_2.thinfloorplate,
        v_u_2.catwalkstairs,
        v_u_2.mic,
        v_u_2.glassbarrier,
        v_u_2.barrier,
        v_u_2.sodafountain,
        v_u_2.fogmachine,
        v_u_2.jukebox,
        v_u_2.podium,
        v_u_2.chocolatefountain,
        v_u_2.neonarrow,
        v_u_2.cashregister,
        v_u_2.ropebarrier,
        v_u_2.boombox,
        v_u_2.boxofted,
        v_u_2.tent,
        v_u_2.fireplace,
        v_u_2.bigdrawing,
        v_u_2.metaldrawing,
        v_u_2.woodendrawing
    }
}
local v42 = {
    ["name"] = "Living Room",
    ["tags"] = { "standard" },
    ["priority"] = 3,
    ["contents"] = {
        {
            ["name"] = "Seating",
            ["contents"] = {
                v_u_2.cheapsofa,
                v_u_2.modern_chair_2,
                v_u_2.sleek_chair,
                v_u_2.modern_couch,
                v_u_2.sleek_couch,
                v_u_2.modernchair,
                v_u_2.cutesofa,
                v_u_2.beanbag,
                v_u_2.boothsofa,
                v_u_2.vintagechair,
                v_u_2.parentchildchair,
                v_u_2.smallchair,
                v_u_2.cheapchair,
                v_u_2.foldupchair,
                v_u_2.poshchair,
                v_u_2.highchair,
                v_u_2.poshsofa,
                v_u_2.fancysofa,
                v_u_2.stylishsofa,
                v_u_2.modernsofa,
                v_u_2.lshapedsofa,
                v_u_2.eggchair,
                v_u_2.poofchair,
                v_u_2.curvedchair,
                v_u_2.mushroomchair,
                v_u_2.heartchair,
                v_u_2.parentchildthrone,
                v_u_2.twokidsthrone,
                v_u_2.heartthrone,
                v_u_2.goldenthrone,
                v_u_2.dragonthrone,
                v_u_2.royalchair,
                v_u_2.diningbench,
                v_u_2.directorschair,
                v_u_2.diningseat,
                v_u_2.modern_dining_chair,
                v_u_2.fancychair,
                v_u_2.loungechair,
                v_u_2.gingerbread_sofa
            }
        },
        {
            ["name"] = "Rugs",
            ["contents"] = {
                v_u_2.stripedrug,
                v_u_2.squarerug,
                v_u_2.basicrug,
                v_u_2.heartrug,
                v_u_2.royalrug,
                v_u_2.modernrug,
                v_u_2.poshrug
            }
        },
        {
            ["name"] = "TVs",
            ["contents"] = {
                v_u_2.poshtv,
                v_u_2.modern_feature_tv,
                v_u_2.moderntv,
                v_u_2.stylishtv,
                v_u_2.normaltv,
                v_u_2.cheaptv,
                v_u_2.gingerbread_tv
            }
        },
        {
            ["name"] = "Tables",
            ["contents"] = {
                v_u_2.smalltable,
                v_u_2.poshtable,
                v_u_2.glasstable,
                v_u_2.modern_dining_table,
                v_u_2.parentchildtable,
                v_u_2.circularcoffeetable,
                v_u_2.stylishcoffeetable,
                v_u_2.modern_coffee_table_2,
                v_u_2.basictable,
                v_u_2.cheaptable,
                v_u_2.moderntable,
                v_u_2.logtable,
                v_u_2.stylishtable,
                v_u_2.basicdesk,
                v_u_2.recycledtable,
                v_u_2.stylishdesk,
                v_u_2.expensivenightstand,
                v_u_2.cheapnightstand,
                v_u_2.poshnightstand,
                v_u_2.modernnightstand,
                v_u_2.shelf,
                v_u_2.stackedshelf,
                v_u_2.moderncoffeetable,
                v_u_2.poshcoffeetable,
                v_u_2.basiccoffeetable,
                v_u_2.moderndesk,
                v_u_2.circulartable,
                v_u_2.rickshaw,
                v_u_2.feasttable,
                v_u_2.diningtable,
                v_u_2.gingerbread_table
            }
        },
        {
            ["name"] = "Office",
            ["contents"] = {
                v_u_2.largebookshelf,
                v_u_2.smallbookshelf,
                v_u_2.fireplace,
                v_u_2.piano,
                v_u_2.ballpit,
                v_u_2.laptop,
                v_u_2.pc,
                v_u_2.normaltrashcan,
                v_u_2.fancytrashcan,
                v_u_2.boombox,
                v_u_2.office_chair
            }
        },
        {
            ["name"] = "Storage",
            ["contents"] = {
                v_u_2.moderncupboard,
                v_u_2.cheapcupboard,
                v_u_2.expensivecupboard,
                v_u_2.nicecupboard,
                v_u_2.normalcupboard,
                v_u_2.expensivewardrobe,
                v_u_2.fancywardrobe,
                v_u_2.basicwardrobe,
                v_u_2.cheapwardrobe,
                v_u_2.stylishwardrobe
            }
        },
        {
            ["name"] = "Trees",
            ["contents"] = {
                v_u_2.smallcurvedtree,
                v_u_2.smallsquaretree,
                v_u_2.smallstylishtree,
                v_u_2.largestylishtree,
                v_u_2.largesquaretree,
                v_u_2.largecurvedtree,
                v_u_2.moneytree,
                v_u_2.tinysquaretree,
                v_u_2.tinystylishtree,
                v_u_2.tinyfairytree,
                v_u_2.tinycurvedtree,
                v_u_2.largefairytree,
                v_u_2.smallfairytree
            }
        }
    }
}
local v43 = {
    ["name"] = "Rare",
    ["folder_color"] = "YELLOW",
    ["tags"] = { "misc" },
    ["priority"] = 1,
    ["contents"] = v10("Rare")
}
local v44 = {
    ["name"] = "Bathroom",
    ["tags"] = { "standard" },
    ["priority"] = 3,
    ["contents"] = {
        {
            ["name"] = "Mirrors",
            ["contents"] = {
                v_u_2.massivemirror,
                v_u_2.tallmirror,
                v_u_2.basicmirror,
                v_u_2.standingmirror,
                v_u_2.modernmirror,
                v_u_2.circularvanitymirror,
                v_u_2.vanitymirror,
                v_u_2.fancymirror,
                v_u_2.parentchildmirror
            }
        },
        {
            ["name"] = "Counters",
            ["contents"] = {
                v_u_2.cheapcounter,
                v_u_2.cheapcountercorner,
                v_u_2.vintagecountercorner,
                v_u_2.vintagecounter,
                v_u_2.poshcountercorner,
                v_u_2.poshcounter,
                v_u_2.stylishcounter,
                v_u_2.stylishcountercorner,
                v_u_2.moderncounter,
                v_u_2.moderncountercorner
            }
        },
        {
            ["name"] = "Sinks",
            ["contents"] = {
                v_u_2.cheapsinkcounter,
                v_u_2.vintagesinkcounter,
                v_u_2.poshsinkcounter,
                v_u_2.stylishsinkcounter,
                v_u_2.modernsinkcounter,
                v_u_2.normalsink,
                v_u_2.simplesink
            }
        },
        {
            ["name"] = "Cleanliness",
            ["contents"] = {
                v_u_2.bathtub,
                v_u_2.modernshower,
                v_u_2.cheapbathtub,
                v_u_2.stylishshower,
                v_u_2.gingerbread_shower,
                v_u_2.towels,
                v_u_2.hottub,
                v_u_2.toilet
            }
        }
    }
}
local v45 = {
    ["name"] = "Kitchen",
    ["tags"] = { "standard" },
    ["priority"] = 3,
    ["contents"] = {
        {
            ["name"] = "Counters",
            ["contents"] = {
                v_u_2.cheapcounter,
                v_u_2.cheapcountercorner,
                v_u_2.vintagecountercorner,
                v_u_2.vintagecounter,
                v_u_2.poshcountercorner,
                v_u_2.poshcounter,
                v_u_2.stylishcounter,
                v_u_2.stylishcountercorner,
                v_u_2.moderncounter,
                v_u_2.moderncountercorner,
                v_u_2.cheapcabinet,
                v_u_2.vintagecabinet,
                v_u_2.poshcabinet,
                v_u_2.stylishcabinet,
                v_u_2.moderncabinet
            }
        },
        {
            ["name"] = "Sinks",
            ["contents"] = {
                v_u_2.normalsink,
                v_u_2.cheapsinkcounter,
                v_u_2.vintagesinkcounter,
                v_u_2.poshsinkcounter,
                v_u_2.stylishsinkcounter,
                v_u_2.modernsinkcounter,
                v_u_2.simplesink
            }
        },
        {
            ["name"] = "Cooking",
            ["contents"] = { v_u_2.ovenhood, v_u_2.oven, v_u_2.microwave }
        },
        {
            ["name"] = "Trashcans",
            ["contents"] = { v_u_2.normaltrashcan, v_u_2.fancytrashcan }
        },
        {
            ["name"] = "Fridges",
            ["contents"] = {
                v_u_2.cutefridge,
                v_u_2.sleek_fridge,
                v_u_2.normalfridge,
                v_u_2.minifridge,
                v_u_2.modern_fridge
            }
        },
        {
            ["name"] = "Storage",
            ["contents"] = {
                v_u_2.moderncupboard,
                v_u_2.cheapcupboard,
                v_u_2.expensivecupboard,
                v_u_2.nicecupboard,
                v_u_2.normalcupboard
            }
        },
        {
            ["name"] = "Tables",
            ["contents"] = {
                v_u_2.smalltable,
                v_u_2.poshtable,
                v_u_2.basictable,
                v_u_2.stackedshelf,
                v_u_2.glasstable,
                v_u_2.parentchildtable,
                v_u_2.shelf,
                v_u_2.circulartable,
                v_u_2.rickshaw,
                v_u_2.modern_dining_table,
                v_u_2.feasttable,
                v_u_2.diningtable,
                v_u_2.cheaptable,
                v_u_2.moderntable,
                v_u_2.stylishtable
            }
        },
        {
            ["name"] = "Trees",
            ["contents"] = {
                v_u_2.smallcurvedtree,
                v_u_2.smallsquaretree,
                v_u_2.smallstylishtree,
                v_u_2.largestylishtree,
                v_u_2.largesquaretree,
                v_u_2.largecurvedtree,
                v_u_2.moneytree,
                v_u_2.tinysquaretree,
                v_u_2.tinystylishtree,
                v_u_2.tinyfairytree,
                v_u_2.tinycurvedtree,
                v_u_2.largefairytree,
                v_u_2.smallfairytree
            }
        }
    }
}
local v46 = {
    ["name"] = "Bedroom",
    ["tags"] = { "standard" },
    ["priority"] = 3,
    ["contents"] = {
        {
            ["name"] = "Beds",
            ["contents"] = {
                v_u_2.poshbed,
                v_u_2.modern_bed_2,
                v_u_2.sleek_bed,
                v_u_2.modernbed,
                v_u_2.cutebed,
                v_u_2.basicbed,
                v_u_2.stylishbed,
                v_u_2.gingerbread_bed,
                v_u_2.basiccrib,
                v_u_2.poshcrib,
                v_u_2.royalcrib,
                v_u_2.cribbed,
                v_u_2.bunkbed,
                v_u_2.royalbed,
                v_u_2.normalcrib
            }
        },
        {
            ["name"] = "Rugs",
            ["contents"] = {
                v_u_2.stripedrug,
                v_u_2.squarerug,
                v_u_2.basicrug,
                v_u_2.heartrug,
                v_u_2.royalrug,
                v_u_2.modernrug,
                v_u_2.poshrug
            }
        },
        {
            ["name"] = "Trashcans",
            ["contents"] = { v_u_2.normaltrashcan, v_u_2.fancytrashcan }
        },
        {
            ["name"] = "Tables",
            ["contents"] = {
                v_u_2.smalltable,
                v_u_2.poshtable,
                v_u_2.parentchildtable,
                v_u_2.recycledtable,
                v_u_2.circularcoffeetable,
                v_u_2.stylishcoffeetable,
                v_u_2.basictable,
                v_u_2.cheaptable,
                v_u_2.modern_dining_table,
                v_u_2.moderntable,
                v_u_2.stylishtable,
                v_u_2.glasstable,
                v_u_2.basicdesk,
                v_u_2.stylishdesk,
                v_u_2.shelf,
                v_u_2.stackedshelf,
                v_u_2.expensivenightstand,
                v_u_2.cheapnightstand,
                v_u_2.poshnightstand,
                v_u_2.modernnightstand,
                v_u_2.moderncoffeetable,
                v_u_2.poshcoffeetable,
                v_u_2.basiccoffeetable,
                v_u_2.circulartable,
                v_u_2.diningtable,
                v_u_2.moderndesk
            }
        },
        {
            ["name"] = "Storage",
            ["contents"] = {
                v_u_2.moderncupboard,
                v_u_2.cheapcupboard,
                v_u_2.expensivecupboard,
                v_u_2.nicecupboard,
                v_u_2.normalcupboard,
                v_u_2.expensivewardrobe,
                v_u_2.fancywardrobe,
                v_u_2.basicwardrobe,
                v_u_2.cheapwardrobe,
                v_u_2.stylishwardrobe
            }
        },
        {
            ["name"] = "Seats",
            ["contents"] = {
                v_u_2.cheapsofa,
                v_u_2.modern_chair_2,
                v_u_2.sleek_chair,
                v_u_2.modernchair,
                v_u_2.modernsofa,
                v_u_2.sleek_couch,
                v_u_2.cutesofa,
                v_u_2.vintagechair,
                v_u_2.smallchair,
                v_u_2.cheapchair,
                v_u_2.directorschair,
                v_u_2.foldupchair,
                v_u_2.poshchair,
                v_u_2.highchair,
                v_u_2.poshsofa,
                v_u_2.fancysofa,
                v_u_2.stylishsofa,
                v_u_2.mushroomchair,
                v_u_2.heartchair,
                v_u_2.heartthrone,
                v_u_2.goldenthrone,
                v_u_2.parentchildchair,
                v_u_2.dragonthrone,
                v_u_2.royalchair,
                v_u_2.modern_dining_chair,
                v_u_2.diningbench,
                v_u_2.diningseat,
                v_u_2.lshapedsofa,
                v_u_2.eggchair,
                v_u_2.poofchair,
                v_u_2.curvedchair,
                v_u_2.fancychair,
                v_u_2.loungechair,
                v_u_2.gingerbread_sofa,
                v_u_2.gingerbread_chair
            }
        },
        {
            ["name"] = "Trees",
            ["contents"] = {
                v_u_2.smallcurvedtree,
                v_u_2.smallsquaretree,
                v_u_2.smallstylishtree,
                v_u_2.largestylishtree,
                v_u_2.largesquaretree,
                v_u_2.largecurvedtree,
                v_u_2.moneytree,
                v_u_2.tinysquaretree,
                v_u_2.tinystylishtree,
                v_u_2.tinyfairytree,
                v_u_2.tinycurvedtree,
                v_u_2.largefairytree,
                v_u_2.smallfairytree
            }
        }
    }
}
__set_list(v_u_17, 81, {v39, v40, v41, v42, v43, v44, v45, v46, {
    ["name"] = "Windows",
    ["tags"] = { "standard" },
    ["priority"] = 3,
    ["contents"] = {
        v_u_2.massivewindow,
        v_u_2.normalwindow,
        v_u_2.stripedwindow,
        v_u_2.smallwindow,
        v_u_2.tinywindow,
        v_u_2.tallwindow,
        v_u_2.massiveheartwindow,
        v_u_2.bigheartwindow,
        v_u_2.smallheartwindow,
        v_u_2.tinyheartwindow,
        v_u_2.largewindow
    }
}, {
    ["name"] = "Doors",
    ["tags"] = { "standard" },
    ["priority"] = 3,
    ["contents"] = {
        v_u_2.woodendoor,
        v_u_2.normaldoor,
        v_u_2.fancydoor,
        v_u_2.superglassdoor,
        v_u_2.basicdoor,
        v_u_2.glassdoor
    }
}, {
    ["name"] = "Castle",
    ["tags"] = { "themed" },
    ["furniture_tags"] = { "castle" },
    ["contents"] = {
        v_u_2.mushroomchair,
        v_u_2.heartchair,
        v_u_2.standingmirror,
        v_u_2.heartrug,
        v_u_2.heartlamp,
        v_u_2.royalrug,
        v_u_2.heartthrone,
        v_u_2.parentchildthrone,
        v_u_2.treasurechest,
        v_u_2.podium,
        v_u_2.decorativearch,
        v_u_2.flowerpot,
        v_u_2.goldenthrone,
        v_u_2.dragonthrone,
        v_u_2.twokidsthrone,
        v_u_2.twinthrone,
        v_u_2.royalcrib,
        v_u_2.walltourch,
        v_u_2.wheel,
        v_u_2.rickshaw,
        v_u_2.axemount,
        v_u_2.banner,
        v_u_2.shieldmount,
        v_u_2.royalchair,
        v_u_2.royalbed,
        v_u_2.flatbook,
        v_u_2.standingbook,
        v_u_2.openbook,
        v_u_2.largecandlestick,
        v_u_2.smallcandlestick,
        v_u_2.feasttable,
        v_u_2.earthpotion,
        v_u_2.fairyspotion,
        v_u_2.mermaidspotion,
        v_u_2.dragonbreathpotion,
        v_u_2.godlypotion,
        v_u_2.levitationpotion,
        v_u_2.mysticpotion,
        v_u_2.rollingpin,
        v_u_2.tinyfairytree,
        v_u_2.smallfairytree,
        v_u_2.largefairytree
    }
}, {
    ["name"] = "Posters",
    ["tags"] = { "standard" },
    ["priority"] = 5,
    ["hide_names"] = true,
    ["contents"] = {
        v_u_2.throwposter,
        v_u_2.treasureposter,
        v_u_2.eggposter,
        v_u_2.bethinkposter,
        v_u_2.newfissyposter,
        v_u_2.fashionposter,
        v_u_2.workposter,
        v_u_2.bookposter,
        v_u_2.beachsimposter,
        v_u_2.hackrposter,
        v_u_2.nightposter,
        v_u_2.girlposter,
        v_u_2.flyposter,
        v_u_2.wild,
        v_u_2.oak,
        v_u_2.azure,
        v_u_2.miner,
        v_u_2.buccaneers,
        v_u_2.coffee,
        v_u_2.annaballoon,
        v_u_2.kids,
        v_u_2.bloxy,
        v_u_2.monoscooter
    }
}, {
    ["name"] = "Lights",
    ["tags"] = { "standard" },
    ["priority"] = 3,
    ["contents"] = {
        v_u_2.modernhanginglight,
        v_u_2.basicceilinglight,
        v_u_2.stylishhanginglamp,
        v_u_2.poshlamp,
        v_u_2.lightbulb,
        v_u_2.walltourch,
        v_u_2.heartlamp,
        v_u_2.coneceilinglight,
        v_u_2.stagelight,
        v_u_2.photographylight,
        v_u_2.curvedlamp,
        v_u_2.expensivelamp,
        v_u_2.trihanginglights,
        v_u_2.cheaptablelamp,
        v_u_2.cheapfloorlamp,
        v_u_2.fancyfloorlamp,
        v_u_2.dogfloorlamp,
        v_u_2.basictablelamp,
        v_u_2.basicfloorlamp,
        v_u_2.fancytablelamp,
        v_u_2.dogtablelamp,
        v_u_2.modern_lamp,
        v_u_2.sleek_floor_lamp,
        v_u_2.moderntablelamp,
        v_u_2.modernfloorlamp,
        v_u_2.gingerbread_floor_lamp,
        v_u_2.pride_2022_pride_lamp
    }
}, {
    ["name"] = "Fashion",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.clothingrack,
        v_u_2.hairdresserstall,
        v_u_2.bleachers,
        v_u_2.sewingmachine,
        v_u_2.makeupbench,
        v_u_2.hairdryerchair,
        v_u_2.directorschair,
        v_u_2.parentchildchair,
        v_u_2.massiveheartwindow,
        v_u_2.bigheartwindow,
        v_u_2.smallheartwindow,
        v_u_2.tinyheartwindow,
        v_u_2.superglassdoor,
        v_u_2.parentchildtable,
        v_u_2.circularvanitymirror,
        v_u_2.vanitymirror,
        v_u_2.parentchildmirror,
        v_u_2.catwalk,
        v_u_2.catwalkstairs,
        v_u_2.voting_paddle,
        v_u_2.voting_table,
        v_u_2.voting_chair,
        v_u_2.boombox,
        v_u_2.glassbarrier,
        v_u_2.ropebarrier,
        v_u_2.mic,
        v_u_2.fogmachine,
        v_u_2.jukebox,
        v_u_2.dancefloor,
        v_u_2.dj,
        v_u_2.photowall,
        v_u_2.photographylight,
        v_u_2.stagelight,
        v_u_2.truss,
        v_u_2.star,
        v_u_2.neonarrow,
        v_u_2.trusslights
    }
}, {
    ["name"] = "Fans",
    ["tags"] = { "standard" },
    ["priority"] = 4,
    ["contents"] = {
        v_u_2.smallfan,
        v_u_2.cheapfan,
        v_u_2.nicefan,
        v_u_2.expensivefan,
        v_u_2.fancyfan
    }
}, {
    ["name"] = "Decoration",
    ["tags"] = { "standard" },
    ["priority"] = 4,
    ["contents"] = {
        v_u_2.ketchup,
        v_u_2.mustard,
        v_u_2.telescope,
        v_u_2.hatstand,
        v_u_2.smallcandle,
        v_u_2.mediumcandle,
        v_u_2.largecandle,
        v_u_2.largeyellowflowers,
        v_u_2.largeredflowers,
        v_u_2.decorativepot,
        v_u_2.coffeecuprack,
        v_u_2.knifeblock,
        v_u_2.clothingrack,
        v_u_2.crate,
        v_u_2.glass,
        v_u_2.backpack,
        v_u_2.swordwallmount,
        v_u_2.cardboardbox,
        v_u_2.hellosign,
        v_u_2.briefcase,
        v_u_2.woodencrate,
        v_u_2.barrel,
        v_u_2.fireextinguisher,
        v_u_2.safe,
        v_u_2.bottles,
        v_u_2.treasurechest,
        v_u_2.podium,
        v_u_2.chocolatefountain,
        v_u_2.decorativearch,
        v_u_2.neonarrow,
        v_u_2.flowerpot,
        v_u_2.bread,
        v_u_2.kniferack,
        v_u_2.wheel,
        v_u_2.smallbottle,
        v_u_2.axemount,
        v_u_2.banner,
        v_u_2.shieldmount,
        v_u_2.flatbook,
        v_u_2.standingbook,
        v_u_2.openbook,
        v_u_2.largecandlestick,
        v_u_2.smallcandlestick,
        v_u_2.apple,
        v_u_2.rollingpin,
        v_u_2.smallredflowers,
        v_u_2.smallyellowflowers,
        v_u_2.cheesegrater,
        v_u_2.coffee_maker,
        v_u_2.water_cooler,
        v_u_2.standing_mic,
        v_u_2.digital_mic,
        v_u_2.retro_mic,
        v_u_2.green_screen,
        v_u_2.neon_sign,
        v_u_2.rustic_sign,
        v_u_2.modern_sign,
        v_u_2.dumbbell,
        v_u_2.lockers
    }
}})
__set_list(v_u_17, 97, {{
    ["name"] = "Cute",
    ["tags"] = { "themed" },
    ["contents"] = {
        v_u_2.rocking_crib,
        v_u_2.cloud_chair,
        v_u_2.unicorn_lamp,
        v_u_2.penguin_lamp,
        v_u_2.puppy_high_chair,
        v_u_2.cloud_bed,
        v_u_2.cloud_tv
    }
}})
local function v_u_51(p47)
    if p47.contents then
        for _, v48 in p47.contents do
            if v48.contents then
                v_u_51(v48)
            elseif p47.furniture_tags then
                v48.tags = v48.tags or {}
                for _, v49 in p47.furniture_tags do
                    if not table.find(v48.tags, v49) then
                        local v50 = v48.tags
                        table.insert(v50, v49)
                    end
                end
            end
        end
    end
end
local function v53(p52)
    return v_u_6[p52]
end
local v54 = {}
for _, v55 in v_u_17 do
    if v55.tags then
        local v56 = {}
        for _, v57 in v55.tags do
            v56[v57] = true
        end
        v55.tags = v56
    end
    v_u_51(v55)
end
for v58, v59 in v4 do
    local v60 = {}
    local v61 = {
        ["name"] = "Starter Stuff",
        ["tags"] = { "misc" },
        ["contents"] = v10("PetNeeds")
    }
    table.insert(v60, v61)
    local v62 = {
        ["name"] = "Stands",
        ["tags"] = { "misc" },
        ["contents"] = v10("Stand")
    }
    table.insert(v60, v62)
    local v63 = {
        ["name"] = "Lures",
        ["tags"] = { "misc" },
        ["contents"] = v10("Lures2023")
    }
    table.insert(v60, v63)
    local v64 = v59.recommended_furniture
    if v64 then
        for _, v65 in v_u_2 do
            if v65.cost then
                if v64.content_packs and v64.content_packs[v65.contentpack] then
                    table.insert(v60, v65)
                elseif v65.tags then
                    for _, v66 in v65.tags do
                        if v64.tags[v66] then
                            table.insert(v60, v65)
                            break
                        end
                    end
                end
            end
        end
    end
    v_u_6[v58] = v60
end
local function v75(p67, p68)
    local v69 = {}
    for _, v70 in v_u_17 do
        if v70.tags and v70.tags[p67] then
            table.insert(v69, v70)
        end
    end
    if p68 then
        table.sort(v69, function(p71, p72)
            local v73 = p71.priority or (1 / 0)
            local v74 = p72.priority or (1 / 0)
            if v73 == v74 then
                return p71.name < p72.name
            else
                return v73 < v74
            end
        end)
    end
    return v69
end
local v78 = {
    ["name"] = "Stuff",
    ["contents"] = {
        v_u_2.build_with_friends,
        {
            ["name"] = "NEW!",
            ["folder_color"] = "YELLOW",
            ["contents"] = v_u_17
        },
        {
            ["name"] = "Recommended",
            ["get_contents"] = v53
        },
        {
            ["name"] = "Stands",
            ["contents"] = v10("Stand")
        },
        {
            ["name"] = "Standard Furniture",
            ["contents"] = v75("standard", true)
        },
        {
            ["name"] = "Themed Furniture",
            ["contents"] = v75("themed", false)
        },
        {
            ["name"] = "Shapes",
            ["contents"] = v75("shapes", true)
        },
        {
            ["name"] = "A-Z",
            ["contents"] = v5.List.sort(v_u_17, function(p76, p77)
                return p76.name < p77.name
            end)
        },
        {
            ["name"] = "Miscellaneous",
            ["contents"] = v5.List.concat({ v_u_2.build_with_friends }, (v75("misc", true)))
        }
    }
}
v54.stuff = v78
v54.walls = {
    ["name"] = "Walls",
    ["hide_names"] = true,
    ["tile_preview"] = true,
    ["contents"] = {
        v3.walls.presents,
        v3.walls.snowflakes,
        v3.walls.bluestripes,
        v3.walls.circles,
        v3.walls.hex,
        v3.walls.lineart,
        v3.walls.sword,
        v3.walls.heart,
        v3.walls.unicorns,
        v3.walls.spiralpattern,
        v3.walls.pinkstripes,
        v3.walls.bluetriangles,
        v3.walls.whiteleaf,
        v3.walls.toilets,
        v3.walls.flowers,
        v3.walls.stripedpattern,
        v3.walls.white,
        v3.walls.black,
        v3.walls.red,
        v3.walls.orange,
        v3.walls.yellow,
        v3.walls.green,
        v3.walls.pink,
        v3.walls.purple,
        v3.walls.blue,
        v3.walls.butterflies,
        v3.walls.pink_panda,
        v3.walls.geometric_tiles,
        v3.walls.love_is_love,
        v3.walls.ornate_map,
        v3.walls.summer_harvest,
        v3.walls.baby_blue_terra_cotta,
        v3.walls.birds_eye_view,
        v3.walls.leopard_print,
        v3.walls.white_brick,
        v3.walls.purple_terra_cotta,
        v3.walls.rainbow_brush_strokes,
        v3.walls.chilly_peaks,
        v3.walls.festive_cats,
        v3.walls.pretty_lily_pads,
        v3.walls.a_lot_of_ducks,
        v3.walls.starry_sky,
        v3.walls.mint_terra_cotta,
        v3.walls.bubbles,
        v3.walls.pastel_zag,
        v3.walls.cheery_clouds,
        v3.walls.glittering_scales,
        v3.walls.great_waves,
        v3.walls.burried_bricks,
        v3.walls.dino_princess,
        v3.walls.pepperoni_pizza,
        v3.walls.magma,
        v3.walls.toon_teak,
        v3.walls.comic_book_print,
        v3.walls.sleepy_unicorn,
        v3.walls.pastel_squares,
        v3.walls.pink_punk_skulls,
        v3.walls.spooky_orange,
        v3.walls.yellow_tartan,
        v3.walls.i_heart_strawberries,
        v3.walls.cups_of_coffee,
        v3.walls.autumn_rings,
        v3.walls.a_panda_summer,
        v3.walls.goldenrod_terra_cotta,
        v3.walls.unicorn_magic,
        v3.walls.steampunk_hearts,
        v3.walls.fine_china_tiles,
        v3.walls.blue_panda,
        v3.walls.gilded_wicker,
        v3.walls.kittycorn,
        v3.walls.pretty_alphabet,
        v3.walls.zebra_print,
        v3.walls.gold_leafed,
        v3.walls.fall_mountains,
        v3.walls.dinos_in_the_dark,
        v3.walls.orange_stripes,
        v3.walls.blue_stripes,
        v3.walls.purple_pattern,
        v3.walls.pink_zag,
        v3.walls.yellow_zag,
        v3.walls.magic
    }
}
v54.floors = {
    ["name"] = "Floors",
    ["hide_names"] = true,
    ["tile_preview"] = true,
    ["contents"] = {
        v3.floors.woodenplanks,
        v3.floors.checkers,
        v3.floors.floorswords,
        v3.floors.unicornfloor,
        v3.floors.heartfloor,
        v3.floors.pinklinepattern,
        v3.floors.pinkfloorpattern,
        v3.floors.bluetiles,
        v3.floors.stones,
        v3.floors.floortoilets,
        v3.floors.blackcarpet,
        v3.floors.floorflowers,
        v3.floors.expensivepurplecarpet,
        v3.floors.expensivecreamcarpet,
        v3.floors.expensivedarkcreamcarpet,
        v3.floors.expensivebluecarpet,
        v3.floors.redcarpet,
        v3.floors.yellowcarpet,
        v3.floors.orangecarpet,
        v3.floors.greencarpet,
        v3.floors.pinkcarpet,
        v3.floors.purplecarpet,
        v3.floors.bluecarpet,
        v3.floors.whitecarpet,
        v3.floors.dinos_in_the_dark,
        v3.floors.pink_panda,
        v3.floors.geometric_tiles,
        v3.floors.love_is_love,
        v3.floors.ornate_map,
        v3.floors.summer_harvest,
        v3.floors.baby_blue_terra_cotta,
        v3.floors.birds_eye_view,
        v3.floors.leopard_print,
        v3.floors.white_brick,
        v3.floors.purple_terra_cotta,
        v3.floors.rainbow_brush_strokes,
        v3.floors.chilly_peaks,
        v3.floors.festive_cats,
        v3.floors.pretty_lily_pads,
        v3.floors.a_lot_of_ducks,
        v3.floors.starry_sky,
        v3.floors.mint_terra_cotta,
        v3.floors.bubbles,
        v3.floors.pastel_zag,
        v3.floors.cheery_clouds,
        v3.floors.glittering_scales,
        v3.floors.great_waves,
        v3.floors.burried_bricks,
        v3.floors.dino_princess,
        v3.floors.pepperoni_pizza,
        v3.floors.magma,
        v3.floors.toon_teak,
        v3.floors.comic_book_print,
        v3.floors.sleepy_unicorn,
        v3.floors.pastel_squares,
        v3.floors.pink_punk_skulls,
        v3.floors.spooky_orange,
        v3.floors.yellow_tartan,
        v3.floors.i_heart_strawberries,
        v3.floors.cups_of_coffee,
        v3.floors.autumn_rings,
        v3.floors.a_panda_summer,
        v3.floors.goldenrod_terra_cotta,
        v3.floors.unicorn_magic,
        v3.floors.steampunk_hearts,
        v3.floors.fine_china_tiles,
        v3.floors.blue_panda,
        v3.floors.gilded_wicker,
        v3.floors.kittycorn,
        v3.floors.pretty_alphabet,
        v3.floors.zebra_print,
        v3.floors.gold_leafed,
        v3.floors.fall_mountains,
        v3.floors.orange_stripes,
        v3.floors.blue_stripes,
        v3.floors.purple_pattern,
        v3.floors.pink_zag,
        v3.floors.yellow_zag,
        v3.floors.magic
    }
}
local v79 = v3.walls
local v80 = {
    v79.bold_red,
    v79.brown,
    v79.cream,
    v79.cyan,
    v79.dark_grey,
    v79.earth_green,
    v79.half_stripes_blue,
    v79.half_stripes_green,
    v79.half_stripes_grey,
    v79.half_stripes_orange,
    v79.half_stripes_pink,
    v79.half_stripes_purple,
    v79.half_stripes_red,
    v79.half_stripes_yellow,
    v79.hot_pink,
    v79.ice_blue,
    v79.indigo,
    v79.lavender,
    v79.light_grey,
    v79.ocean_green,
    v79.oil_paint_splash,
    v79.pale_orange,
    v79.pale_pink,
    v79.palm_leaves_black_white,
    v79.pastel_yellow,
    v79.plaid_red_black,
    v79.plaid_white_red,
    v79.plaid_yellow_black,
    v79.rose,
    v79.royal_purple,
    v79.stripes_white,
    v79.stripes_yellow,
    v79.stone_bricks_beige,
    v79.stone_bricks_dark,
    v79.stone_bricks_light,
    v79.stripes_black_gold,
    v79.stripes_blue,
    v79.stripes_green,
    v79.stripes_orange,
    v79.stripes_pink,
    v79.stripes_purple,
    v79.stripes_red,
    v79.stripes_white_black,
    v79.tile_black,
    v79.tile_blue,
    v79.tile_green,
    v79.tile_orange,
    v79.tile_pink,
    v79.tile_purple,
    v79.tile_red,
    v79.tile_white,
    v79.tile_yellow,
    v79.ventilation,
    v79.vibrant_orange,
    v79.vines_black_white,
    v79.vines_green,
    v79.wood_planks_beige,
    v79.wood_planks_light,
    v79.wood_planks_dark,
    v79.wood_planks_mahogany,
    v79.wood_planks_pink,
    v79.wood_planks_white
}
v54.walls.contents = v5.List.concat(v54.walls.contents, v80)
local v81 = v54.walls.contents
table.insert(v81, {
    ["layout_order"] = -1,
    ["name"] = "NEW!",
    ["folder_color"] = "YELLOW",
    ["hide_names"] = true,
    ["tile_preview"] = true,
    ["contents"] = v80
})
local v82 = v3.floors
local v83 = {
    v82.bold_red,
    v82.brown,
    v82.cream,
    v82.cyan,
    v82.dark_grey,
    v82.earth_green,
    v82.half_stripes_blue,
    v82.half_stripes_green,
    v82.half_stripes_grey,
    v82.half_stripes_orange,
    v82.half_stripes_pink,
    v82.half_stripes_purple,
    v82.half_stripes_red,
    v82.half_stripes_yellow,
    v82.hot_pink,
    v82.ice_blue,
    v82.indigo,
    v82.lavender,
    v82.light_grey,
    v82.ocean_green,
    v82.oil_paint_splash,
    v82.pale_orange,
    v82.pale_pink,
    v82.palm_leaves_black_white,
    v82.pastel_yellow,
    v82.plaid_red_black,
    v82.plaid_white_red,
    v82.plaid_yellow_black,
    v82.rose,
    v82.royal_purple,
    v82.stripes_white,
    v82.stripes_yellow,
    v82.stone_bricks_beige,
    v82.stone_bricks_dark,
    v82.stone_bricks_light,
    v82.stripes_black_gold,
    v82.stripes_blue,
    v82.stripes_green,
    v82.stripes_orange,
    v82.stripes_pink,
    v82.stripes_purple,
    v82.stripes_red,
    v82.stripes_white_black,
    v82.tile_black,
    v82.tile_blue,
    v82.tile_green,
    v82.tile_orange,
    v82.tile_pink,
    v82.tile_purple,
    v82.tile_red,
    v82.tile_white,
    v82.tile_yellow,
    v82.ventilation,
    v82.vibrant_orange,
    v82.vines_black_white,
    v82.vines_green,
    v82.wood_planks_beige,
    v82.wood_planks_light,
    v82.wood_planks_dark,
    v82.wood_planks_mahogany,
    v82.wood_planks_pink,
    v82.wood_planks_white
}
v54.floors.contents = v5.List.concat(v54.floors.contents, v83)
local v84 = v54.floors.contents
table.insert(v84, {
    ["layout_order"] = -1,
    ["name"] = "NEW!",
    ["folder_color"] = "YELLOW",
    ["hide_names"] = true,
    ["tile_preview"] = true,
    ["contents"] = v83
})
local v_u_85 = {}
local function v_u_91(p86, p87)
    v_u_85[p87] = true
    for v88 = 1, #p86 do
        local v89 = p86[v88]
        assert(v89, ("FurishDB contains a nil or nonexistant value. %s category, entry %d"):format(p87, v88))
        local v90 = v89.contents
        if v90 and not v_u_85[v89.name] then
            v_u_91(v90, v89.name)
        end
    end
end
for _, v92 in v54 do
    v_u_91(v92.contents, v92.name)
end
return v54