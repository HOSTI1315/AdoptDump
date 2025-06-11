--// ReplicatedStorage.ClientDB.DailyLoginDB (ModuleScript)

local v_u_1 = {
    ["week_length"] = 5,
    ["month_length"] = 30,
    ["daily_rewards_onboarding"] = {},
    ["daily_rewards_consecutive"] = {}
}
local v2 = {
    {
        ["reward_type"] = "gift",
        ["gift_type"] = "smallgift"
    },
    {
        ["reward_type"] = "gift",
        ["gift_type"] = "biggift"
    },
    {
        ["reward_type"] = "item",
        ["item_category"] = "gifts",
        ["item_id"] = "legend_hat_2022_simple_chest"
    },
    {
        ["reward_type"] = "item",
        ["item_category"] = "gifts",
        ["item_id"] = "legend_hat_2022_regal_chest"
    },
    {
        ["reward_type"] = "gift",
        ["gift_type"] = "massivegift"
    },
    {
        ["reward_type"] = "item",
        ["item_category"] = "pets",
        ["item_id"] = "cracked_egg"
    }
}
local v3 = {
    25,
    50,
    100,
    200
}
local v4 = {
    5,
    10,
    10,
    15,
    15,
    20
}
local v5 = {
    12,
    12,
    15,
    15,
    17,
    20
}
for v6 = 1, v_u_1.month_length do
    local v7 = v6 / v_u_1.week_length
    local v8 = math.floor(v7)
    local v9 = {}
    local v10 = {}
    if v6 % v_u_1.week_length == 0 then
        for v11, v12 in pairs(v2[v8]) do
            v10[v11] = v12
            v9[v11] = v12
        end
        v10.stars = v4[v8]
        v9.stars = v5[v8]
    else
        v10 = {
            ["stars"] = 1,
            ["reward_type"] = "money",
            ["amount"] = v3[v6 % v_u_1.week_length]
        }
        v9 = {
            ["stars"] = 1,
            ["reward_type"] = "money",
            ["amount"] = v3[v6 % v_u_1.week_length]
        }
    end
    v_u_1.daily_rewards_onboarding["day_" .. v6] = v10
    v_u_1.daily_rewards_consecutive["day_" .. v6] = v9
end
local v13 = {}
local v14 = {
    ["reward_1"] = {
        ["stars"] = 9,
        ["item_category"] = "toys",
        ["item_id"] = "steel_drum"
    },
    ["reward_2"] = {
        ["stars"] = 30,
        ["item_category"] = "toys",
        ["item_id"] = "drone_propeller"
    },
    ["reward_3"] = {
        ["stars"] = 90,
        ["item_category"] = "toys",
        ["item_id"] = "medieval_grappling_hook"
    },
    ["reward_4"] = {
        ["stars"] = 140,
        ["item_category"] = "transport",
        ["item_id"] = "human_bubble"
    },
    ["reward_5"] = {
        ["stars"] = 180,
        ["item_category"] = "toys",
        ["item_id"] = "davinci_propeller"
    },
    ["reward_6"] = {
        ["stars"] = 210,
        ["item_category"] = "pets",
        ["item_id"] = "ginger_cat"
    },
    ["reward_7"] = {
        ["stars"] = 230,
        ["item_category"] = "toys",
        ["item_id"] = "frostbite_grappling_hook"
    },
    ["reward_8"] = {
        ["stars"] = 280,
        ["item_category"] = "toys",
        ["item_id"] = "trumpet"
    },
    ["reward_9"] = {
        ["stars"] = 300,
        ["item_category"] = "toys",
        ["item_id"] = "angelic_propeller"
    },
    ["reward_10"] = {
        ["stars"] = 320,
        ["item_category"] = "transport",
        ["item_id"] = "blue_rider"
    },
    ["reward_11"] = {
        ["stars"] = 360,
        ["item_category"] = "toys",
        ["item_id"] = "didgeridoo"
    },
    ["reward_12"] = {
        ["stars"] = 400,
        ["item_category"] = "pets",
        ["item_id"] = "toucan"
    },
    ["reward_13"] = {
        ["stars"] = 460,
        ["item_category"] = "toys",
        ["item_id"] = "futuristic_grappling_hook"
    },
    ["reward_14"] = {
        ["stars"] = 500,
        ["item_category"] = "transport",
        ["item_id"] = "rocket_racer"
    },
    ["reward_15"] = {
        ["stars"] = 550,
        ["item_category"] = "pets",
        ["item_id"] = "starfish"
    },
    ["reward_16"] = {
        ["stars"] = 600,
        ["item_category"] = "transport",
        ["item_id"] = "witch_caravan"
    },
    ["reward_17"] = {
        ["stars"] = 660,
        ["item_category"] = "pets",
        ["item_id"] = "golden_egg",
        ["information_text"] = "Golden Unicorn: 1/3\nGolden Griffin: 1/3\nGolden Dragon: 1/3",
        ["prestige_text"] = "Congratulations, you\'ve reached the Golden Egg! Your stars will be reset so you can keep earning prizes!"
    }
}
v13[1] = v14
local v15 = {
    ["reward_1"] = {
        ["stars"] = 9,
        ["item_category"] = "toys",
        ["item_id"] = "star_rewards_2022_magicicians_wand_grappling_hook"
    },
    ["reward_2"] = {
        ["stars"] = 65,
        ["item_category"] = "transport",
        ["item_id"] = "star_rewards_2022_hovercraft"
    },
    ["reward_3"] = {
        ["stars"] = 120,
        ["item_category"] = "toys",
        ["item_id"] = "star_rewards_2022_log_throw_toy"
    },
    ["reward_4"] = {
        ["stars"] = 180,
        ["item_category"] = "strollers",
        ["item_id"] = "star_rewards_2022_frog_stroller"
    },
    ["reward_5"] = {
        ["stars"] = 225,
        ["item_category"] = "toys",
        ["item_id"] = "star_rewards_2022_red_panda_cupcake"
    },
    ["reward_6"] = {
        ["stars"] = 280,
        ["item_category"] = "toys",
        ["item_id"] = "star_rewards_2022_mermaid_propeller"
    },
    ["reward_7"] = {
        ["stars"] = 340,
        ["item_category"] = "transport",
        ["item_id"] = "star_rewards_2022_planet_car"
    },
    ["reward_8"] = {
        ["stars"] = 400,
        ["item_category"] = "pets",
        ["item_id"] = "star_rewards_2022_pomeranian"
    },
    ["reward_9"] = {
        ["stars"] = 450,
        ["item_category"] = "pet_accessories",
        ["item_id"] = "star_rewards_2022_wind_turbine_earrings"
    },
    ["reward_10"] = {
        ["stars"] = 520,
        ["item_category"] = "transport",
        ["item_id"] = "star_rewards_2022_flower_car"
    },
    ["reward_11"] = {
        ["stars"] = 600,
        ["item_category"] = "pets",
        ["item_id"] = "star_rewards_2022_orca"
    },
    ["reward_12"] = {
        ["stars"] = 660,
        ["item_category"] = "pets",
        ["item_id"] = "diamond_egg",
        ["information_text"] = "Diamond Unicorn: 1/3\nDiamond Griffin: 1/3\nDiamond Dragon: 1/3",
        ["prestige_text"] = "Congratulations, you\'ve reached the Diamond Egg! Your stars will be reset so you can keep earning prizes!"
    }
}
v13[2] = v15
v_u_1.star_rewards = v13
v_u_1.prestige_rewards = { "reward_17", "reward_12" }
function v_u_1.current_prestige_to_index(p16)
    return p16 % #v_u_1.star_rewards + 1
end
function v_u_1.get_star_rewards_for_prestige(p17)
    local v18 = v_u_1.current_prestige_to_index(p17)
    return v_u_1.star_rewards[v18]
end
function v_u_1.get_prestige_reward(p19)
    local v20 = v_u_1.current_prestige_to_index(p19)
    local v21 = v_u_1.prestige_rewards[v20]
    return v_u_1.get_star_rewards_for_prestige(p19)[v21]
end
function v_u_1.get_reward_for_day(p22)
    local v23
    if v_u_1.month_length < p22 then
        v23 = v_u_1.daily_rewards_consecutive
    else
        v23 = v_u_1.daily_rewards_onboarding
    end
    return v23["day_" .. (p22 - 1) % v_u_1.month_length + 1]
end
return v_u_1