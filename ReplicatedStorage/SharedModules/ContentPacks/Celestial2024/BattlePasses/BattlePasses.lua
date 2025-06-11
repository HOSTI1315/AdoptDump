--// ReplicatedStorage.SharedModules.ContentPacks.Celestial2024.BattlePasses (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("TimeZoneHelper")
local v2 = {}
local v3 = {
    ["display_name"] = "Galactic Pass",
    ["event_has_ended"] = true,
    ["sprout_images"] = {
        ["A"] = "rbxassetid://18742673645",
        ["B"] = "rbxassetid://18742677743"
    },
    ["hint_text"] = "Complete Taskboard tasks and pet needs to earn XP!",
    ["event_end_reset_prompt"] = "This week\'s %s is ending soon, so it can no longer be restarted.",
    ["icon_image"] = "rbxassetid://18739784684"
}
local v4 = {
    ["can_reset_until_timestamp"] = v1.from_region_datetime("PT", 2024, 8, 23, 0).UnixTimestamp,
    ["reset_prompt"] = "Pay off Sean %d %s to restart the %s?",
    ["cost"] = {
        ["amount"] = 3000
    }
}
v3.reset_options = v4
local v5 = {}
local v6 = {
    ["xp_needed"] = 256,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 1
    }
}
local v7 = {
    ["xp_needed"] = 256,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 1
    }
}
local v8 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "tiny_pet_age_potion",
        ["amount"] = 2
    }
}
local v9 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 2
    }
}
local v10 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 2
    }
}
local v11 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "pet_accessories",
        ["kind"] = "celestial_2024_galaxy_boots",
        ["amount"] = 1
    }
}
local v12 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v13 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v14 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v15 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 1
    }
}
local v16 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v17 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 5
    }
}
local v18 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "celestial_2024_singularity_beetle",
        ["amount"] = 1
    }
}
local v19 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 5
    }
}
local v20 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v21 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 2
    }
}
__set_list(v5, 1, {v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21})
local v22 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 6
    }
}
local v23 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v24 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "celestial_2024_singularity_beetle",
        ["amount"] = 1
    }
}
local v25 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 25
    }
}
__set_list(v5, 17, {v22, v23, v24, v25})
v3.track = v5
v2.celestial_2024_pass_1 = v3
local v26 = {
    ["display_name"] = "Galactic Pass",
    ["event_has_ended"] = true,
    ["sprout_images"] = {
        ["A"] = "rbxassetid://18742673645",
        ["B"] = "rbxassetid://18742677743"
    },
    ["hint_text"] = "Complete Taskboard tasks and pet needs to earn XP!",
    ["event_end_reset_prompt"] = "This week\'s %s is ending soon, so it can no longer be restarted.",
    ["icon_image"] = "rbxassetid://18739784684"
}
local v27 = {
    ["can_reset_until_timestamp"] = v1.from_region_datetime("PT", 2024, 8, 30, 0).UnixTimestamp,
    ["reset_prompt"] = "Pay off Sean %d %s to restart the %s?",
    ["cost"] = {
        ["amount"] = 3000
    }
}
v26.reset_options = v27
local v28 = {}
local v29 = {
    ["xp_needed"] = 256,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 1
    }
}
local v30 = {
    ["xp_needed"] = 256,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 1
    }
}
local v31 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "tiny_pet_age_potion",
        ["amount"] = 2
    }
}
local v32 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 2
    }
}
local v33 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 2
    }
}
local v34 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "pet_accessories",
        ["kind"] = "celestial_2024_galaxy_helmet",
        ["amount"] = 1
    }
}
local v35 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v36 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v37 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v38 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 1
    }
}
local v39 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v40 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 5
    }
}
local v41 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "celestial_2024_starhopper",
        ["amount"] = 1
    }
}
local v42 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 5
    }
}
local v43 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v44 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 2
    }
}
__set_list(v28, 1, {v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44})
local v45 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 6
    }
}
local v46 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v47 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "celestial_2024_starhopper",
        ["amount"] = 1
    }
}
local v48 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 25
    }
}
__set_list(v28, 17, {v45, v46, v47, v48})
v26.track = v28
v2.celestial_2024_pass_2 = v26
local v49 = {
    ["display_name"] = "Galactic Pass",
    ["event_has_ended"] = true,
    ["sprout_images"] = {
        ["A"] = "rbxassetid://18742673645",
        ["B"] = "rbxassetid://18742677743"
    },
    ["hint_text"] = "Complete Taskboard tasks and pet needs to earn XP!",
    ["event_end_reset_prompt"] = "This week\'s %s is ending soon, so it can no longer be restarted.",
    ["icon_image"] = "rbxassetid://18739784684"
}
local v50 = {
    ["can_reset_until_timestamp"] = v1.from_region_datetime("PT", 2024, 9, 6, 0).UnixTimestamp,
    ["reset_prompt"] = "Pay off Sean %d %s to restart the %s?",
    ["cost"] = {
        ["amount"] = 3000
    }
}
v49.reset_options = v50
local v51 = {}
local v52 = {
    ["xp_needed"] = 256,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 1
    }
}
local v53 = {
    ["xp_needed"] = 256,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 1
    }
}
local v54 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "tiny_pet_age_potion",
        ["amount"] = 2
    }
}
local v55 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 2
    }
}
local v56 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 2
    }
}
local v57 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "pet_accessories",
        ["kind"] = "celestial_2024_galaxy_collar",
        ["amount"] = 1
    }
}
local v58 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v59 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v60 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v61 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 1
    }
}
local v62 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v63 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 5
    }
}
local v64 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "celestial_2024_singularity_pisces",
        ["amount"] = 1
    }
}
local v65 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 5
    }
}
local v66 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v67 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 2
    }
}
__set_list(v51, 1, {v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67})
local v68 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 6
    }
}
local v69 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v70 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "celestial_2024_singularity_pisces",
        ["amount"] = 1
    }
}
local v71 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 25
    }
}
__set_list(v51, 17, {v68, v69, v70, v71})
v49.track = v51
v2.celestial_2024_pass_3 = v49
local v72 = {
    ["display_name"] = "Galactic Pass",
    ["event_has_ended"] = false,
    ["sprout_images"] = {
        ["A"] = "rbxassetid://18742673645",
        ["B"] = "rbxassetid://18742677743"
    },
    ["hint_text"] = "Complete Taskboard tasks and pet needs to earn XP!",
    ["icon_image"] = "rbxassetid://18739784684"
}
local v73 = {
    ["can_reset_until_timestamp"] = v1.from_region_datetime("PT", 2024, 9, 13, 0).UnixTimestamp,
    ["reset_prompt"] = "Pay off Sean %d %s to restart the %s?",
    ["cost"] = {
        ["amount"] = 3000
    }
}
v72.reset_options = v73
local v74 = {}
local v75 = {
    ["xp_needed"] = 256,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 1
    }
}
local v76 = {
    ["xp_needed"] = 256,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 1
    }
}
local v77 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "tiny_pet_age_potion",
        ["amount"] = 2
    }
}
local v78 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 2
    }
}
local v79 = {
    ["xp_needed"] = 513,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 2
    }
}
local v80 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "transport",
        ["kind"] = "celestial_2024_galactic_hoverboard",
        ["amount"] = 1
    }
}
local v81 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v82 = {
    ["xp_needed"] = 770,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v83 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v84 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 1
    }
}
local v85 = {
    ["xp_needed"] = 1026,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 3
    }
}
local v86 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 5
    }
}
local v87 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "celestial_2024_moonlight_moth",
        ["amount"] = 1
    }
}
local v88 = {
    ["xp_needed"] = 1282,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 5
    }
}
local v89 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v90 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 2
    }
}
__set_list(v74, 1, {v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90})
local v91 = {
    ["xp_needed"] = 1539,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 6
    }
}
local v92 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 10
    }
}
local v93 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "celestial_2024_moonlight_moth",
        ["amount"] = 1
    }
}
local v94 = {
    ["xp_needed"] = 2052,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "galactic_shards",
        ["amount"] = 25
    }
}
__set_list(v74, 17, {v91, v92, v93, v94})
v72.track = v74
v2.celestial_2024_pass_4 = v72
return v2