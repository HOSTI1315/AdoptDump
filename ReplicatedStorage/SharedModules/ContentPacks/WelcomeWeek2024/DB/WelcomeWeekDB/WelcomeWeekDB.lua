--// ReplicatedStorage.SharedModules.ContentPacks.WelcomeWeek2024.DB.WelcomeWeekDB (ModuleScript)

local v1 = {}
local v2 = {
    ["color"] = Color3.fromHex("#F7444A"),
    ["quests"] = {
        {
            ["name"] = "welcome_week_day_1_quest_1"
        }
    },
    ["reward"] = {
        ["kind"] = "aviators"
    }
}
v1[1] = v2
local v3 = {
    ["color"] = Color3.fromHex("#FF8B22"),
    ["quests"] = {
        {
            ["name"] = "welcome_week_day_2_quest_1"
        },
        {
            ["name"] = "welcome_week_day_2_quest_2"
        }
    },
    ["reward"] = {
        ["kind"] = "star_balloon"
    }
}
v1[2] = v3
local v4 = {
    ["color"] = Color3.fromHex("#FFAE1F"),
    ["quests"] = {
        {
            ["name"] = "welcome_week_day_3_quest_1"
        },
        {
            ["name"] = "welcome_week_day_3_quest_2"
        }
    },
    ["reward"] = {
        ["kind"] = "standard_roller_skates"
    }
}
v1[3] = v4
local v5 = {
    ["color"] = Color3.fromHex("#4AC655"),
    ["quests"] = {
        {
            ["name"] = "welcome_week_day_4_quest_1"
        },
        {
            ["name"] = "welcome_week_day_4_quest_2"
        }
    },
    ["reward"] = {
        ["kind"] = "stickers_2024_standard_pack"
    }
}
v1[4] = v5
local v6 = {
    ["color"] = Color3.fromHex("#38C3F4"),
    ["quests"] = {
        {
            ["name"] = "welcome_week_day_5_quest_1"
        },
        {
            ["name"] = "welcome_week_day_5_quest_2"
        }
    },
    ["reward"] = {
        ["kind"] = "star_ball"
    }
}
v1[5] = v6
local v7 = {
    ["color"] = Color3.fromHex("#2D69B2"),
    ["quests"] = {
        {
            ["name"] = "welcome_week_day_6_quest_1"
        },
        {
            ["name"] = "welcome_week_day_6_quest_2"
        }
    },
    ["reward"] = {
        ["kind"] = "party_crown"
    }
}
v1[6] = v7
local v8 = {
    ["color"] = Color3.fromHex("#BD45F4"),
    ["quests"] = {
        {
            ["name"] = "welcome_week_day_7_quest_1"
        },
        {
            ["name"] = "welcome_week_day_7_quest_2"
        }
    },
    ["reward"] = {
        ["kind"] = "legend_hat_2022_regal_chest"
    }
}
v1[7] = v8
local v9 = {
    ["color"] = Color3.fromHex("#D6227C"),
    ["quests"] = {
        {
            ["name"] = "welcome_week_day_8_quest_1"
        }
    },
    ["reward"] = nil
}
v1[8] = v9
for v10, v11 in v1 do
    v11.title = "Day " .. v10
    if v10 > 1 then
        v11.unlock_after_duration = 86400 * (v10 - 1)
    end
    for _, v12 in v11.quests do
        v12.category = v12.category or "welcome_week_2024"
    end
end
return v1