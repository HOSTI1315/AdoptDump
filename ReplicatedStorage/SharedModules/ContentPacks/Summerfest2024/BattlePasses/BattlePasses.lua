--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2024.BattlePasses (ModuleScript)

local v1 = {}
local v2 = {
    ["display_name"] = "Pony Pass",
    ["event_end_timestamp"] = require(game.ReplicatedStorage.Fsys).load("TimeZoneHelper").from_region_datetime("PT", 2024, 7, 12, 8).UnixTimestamp,
    ["minigame_reward_image"] = {
        ["phone"] = "rbxassetid://17758690002",
        ["desktop"] = "rbxassetid://17758687636"
    },
    ["icon_image"] = "rbxassetid://17810266067"
}
local v3 = {}
local v4 = {
    ["xp_needed"] = 8,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 500
    }
}
local v5 = {
    ["xp_needed"] = 12,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 650
    }
}
local v6 = {
    ["xp_needed"] = 12,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 650
    }
}
local v7 = {
    ["xp_needed"] = 20,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 1000
    }
}
local v8 = {
    ["xp_needed"] = 20,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 1
    }
}
local v9 = {
    ["xp_needed"] = 25,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 1000
    }
}
local v10 = {
    ["xp_needed"] = 25,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 1000
    }
}
local v11 = {
    ["xp_needed"] = 25,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 2000
    }
}
local v12 = {
    ["xp_needed"] = 25,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 1000
    }
}
local v13 = {
    ["xp_needed"] = 25,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_show_pony",
        ["amount"] = 1
    }
}
local v14 = {
    ["xp_needed"] = 32,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 1250
    }
}
local v15 = {
    ["xp_needed"] = 32,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 1250
    }
}
local v16 = {
    ["xp_needed"] = 32,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 3000
    }
}
local v17 = {
    ["xp_needed"] = 32,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 1250
    }
}
local v18 = {
    ["xp_needed"] = 32,
    ["reward"] = {
        ["category"] = "food",
        ["kind"] = "pet_age_potion",
        ["amount"] = 2
    }
}
local v19 = {
    ["xp_needed"] = 38,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_show_pony",
        ["amount"] = 1
    }
}
__set_list(v3, 1, {v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19})
local v20 = {
    ["xp_needed"] = 38,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 1500
    }
}
local v21 = {
    ["xp_needed"] = 38,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 1500
    }
}
local v22 = {
    ["xp_needed"] = 38,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 3500
    }
}
local v23 = {
    ["xp_needed"] = 38,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 1500
    }
}
local v24 = {
    ["xp_needed"] = 50,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_show_pony",
        ["amount"] = 1
    }
}
local v25 = {
    ["xp_needed"] = 50,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 2000
    }
}
local v26 = {
    ["xp_needed"] = 50,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 2000
    }
}
local v27 = {
    ["xp_needed"] = 50,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_show_pony",
        ["amount"] = 1
    }
}
local v28 = {
    ["xp_needed"] = 50,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_punk_pony",
        ["amount"] = 1
    }
}
local v29 = {
    ["xp_needed"] = 50,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 2000
    }
}
local v30 = {
    ["xp_needed"] = 50,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 2000
    }
}
local v31 = {
    ["xp_needed"] = 50,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 6000
    }
}
local v32 = {
    ["xp_needed"] = 50,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_show_pony",
        ["amount"] = 1
    }
}
local v33 = {
    ["xp_needed"] = 50,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 2000
    }
}
local v34 = {
    ["xp_needed"] = 64,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 2750
    }
}
local v35 = {
    ["xp_needed"] = 64,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_show_pony",
        ["amount"] = 1
    }
}
__set_list(v3, 17, {v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35})
local v36 = {
    ["xp_needed"] = 64,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 2750
    }
}
local v37 = {
    ["xp_needed"] = 64,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 2750
    }
}
local v38 = {
    ["xp_needed"] = 64,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_pretty_pony",
        ["amount"] = 1
    }
}
local v39 = {
    ["xp_needed"] = 64,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_show_pony",
        ["amount"] = 1
    }
}
local v40 = {
    ["xp_needed"] = 64,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 7000
    }
}
local v41 = {
    ["xp_needed"] = 64,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_show_pony",
        ["amount"] = 1
    }
}
local v42 = {
    ["xp_needed"] = 64,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_punk_pony",
        ["amount"] = 1
    }
}
local v43 = {
    ["xp_needed"] = 64,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 2750
    }
}
local v44 = {
    ["xp_needed"] = 76,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_show_pony",
        ["amount"] = 1
    }
}
local v45 = {
    ["xp_needed"] = 76,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 3000
    }
}
local v46 = {
    ["xp_needed"] = 76,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 3000
    }
}
local v47 = {
    ["xp_needed"] = 76,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_show_pony",
        ["amount"] = 1
    }
}
local v48 = {
    ["xp_needed"] = 76,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 3000
    }
}
local v49 = {
    ["xp_needed"] = 76,
    ["reward"] = {
        ["category"] = "currency",
        ["kind"] = "tickets",
        ["amount"] = 10000
    }
}
local v50 = {
    ["xp_needed"] = 76,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_show_pony",
        ["amount"] = 1
    }
}
local v51 = {
    ["xp_needed"] = 76,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_punk_pony",
        ["amount"] = 1
    }
}
__set_list(v3, 33, {v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51})
local v52 = {
    ["xp_needed"] = 76,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_pretty_pony",
        ["amount"] = 1
    }
}
local v53 = {
    ["xp_needed"] = 76,
    ["reward"] = {
        ["category"] = "pets",
        ["kind"] = "summerfest_2024_majestic_pony",
        ["amount"] = 1
    }
}
__set_list(v3, 49, {v52, v53})
v2.track = v3
v1.show_horse = v2
return v1