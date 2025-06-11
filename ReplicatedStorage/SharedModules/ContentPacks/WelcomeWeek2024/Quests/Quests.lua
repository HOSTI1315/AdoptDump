--// ReplicatedStorage.SharedModules.ContentPacks.WelcomeWeek2024.Quests (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = require(game.ReplicatedStorage.new.modules.Ailments.AilmentsDB)
local v3 = v_u_1("QuestFrameStyleDB")
local v4 = v_u_1("QuestsDBHelper")
local v5 = v_u_1("package:Sift")
local v6 = game:GetService("RunService")
local function v9(p7)
    local v8 = p7.options.ailment_kind
    if v8 then
        v8 = v_u_2[p7.options.ailment_kind]
    end
    return v8 and v8.category == "GOLDEN" and true or false
end
local v10 = {}
local v12 = {
    ["name"] = "HELP SAVE THE ZEBRA!!!!",
    ["can_reroll"] = false,
    ["sort_override"] = 500,
    ["contributes_to_quest_limit"] = false,
    ["frame_info"] = {
        ["style"] = v3.welcome_week_2024
    },
    ["reward"] = {
        ["claim_text"] = "Let\'s Go!",
        ["disable_reward_fanfare"] = true,
        ["close_app_on_claim"] = false,
        ["is_clientside"] = true,
        ["image"] = "rbxassetid://92359954165995",
        ["image_size"] = UDim2.fromOffset(60, 55),
        ["callback"] = function()
            local v11 = v_u_1("UIManager")
            v11.apps.QuestApp:select_tab("welcome_week")
            v11.set_app_visibility("QuestApp", true)
        end
    },
    ["can_step_quest"] = function()
        return false
    end,
    ["is_visible"] = function()
        return v_u_1("WelcomeWeekClient").is_active()
    end
}
v10.welcome_week_navigate = v12
local v13 = {
    ["welcome_week_day_1_quest_1_consistent"] = {
        ["name"] = "Complete 5 Needs",
        ["reward"] = v4.make_bucks_reward(50),
        ["can_step_quest"] = v4.is_event("ailment_completed"),
        ["total_steps"] = 5
    },
    ["welcome_week_day_2_quest_1_consistent"] = {
        ["name"] = "Complete 1 Orange Need",
        ["reward"] = v4.make_bucks_reward(50),
        ["can_step_quest"] = v4.is_event_filter("ailment_completed", v9),
        ["total_steps"] = 1
    },
    ["welcome_week_day_2_quest_2_consistent"] = {
        ["name"] = "Complete 5 Needs",
        ["reward"] = v4.make_bucks_reward(50),
        ["can_step_quest"] = v4.is_event("ailment_completed"),
        ["total_steps"] = 5
    }
}
local v14 = {
    ["name"] = "Complete 2 Sleepy Needs",
    ["reward"] = v4.make_bucks_reward(75),
    ["can_step_quest"] = v4.is_event_options("ailment_completed", {
        ["ailment_kind"] = "sleepy"
    }),
    ["total_steps"] = 2
}
v13.welcome_week_day_3_quest_1_consistent = v14
local v15 = {
    ["name"] = "Complete 2 Dirty Needs",
    ["reward"] = v4.make_bucks_reward(75),
    ["can_step_quest"] = v4.is_event_options("ailment_completed", {
        ["ailment_kind"] = "dirty"
    }),
    ["total_steps"] = 2
}
v13.welcome_week_day_3_quest_2_consistent = v15
v13.welcome_week_day_4_quest_1_consistent = {
    ["name"] = "Complete 2 Orange Needs",
    ["reward"] = v4.make_bucks_reward(100),
    ["can_step_quest"] = v4.is_event_filter("ailment_completed", v9),
    ["total_steps"] = 2
}
v13.welcome_week_day_4_quest_2_consistent = {
    ["name"] = "Complete 10 Needs",
    ["reward"] = v4.make_bucks_reward(100),
    ["can_step_quest"] = v4.is_event("ailment_completed"),
    ["total_steps"] = 10
}
local v16 = {
    ["name"] = "Complete 1 Camping Need",
    ["reward"] = v4.make_bucks_reward(125),
    ["can_step_quest"] = v4.is_event_options("ailment_completed", {
        ["ailment_kind"] = "camping"
    }),
    ["total_steps"] = 1
}
v13.welcome_week_day_5_quest_1_consistent = v16
v13.welcome_week_day_5_quest_2_consistent = {
    ["name"] = "Complete 15 Needs",
    ["reward"] = v4.make_bucks_reward(125),
    ["can_step_quest"] = v4.is_event("ailment_completed"),
    ["total_steps"] = 15
}
v13.welcome_week_day_6_quest_1_consistent = {
    ["name"] = "Complete 2 Orange Needs",
    ["reward"] = v4.make_bucks_reward(150),
    ["can_step_quest"] = v4.is_event_filter("ailment_completed", v9),
    ["total_steps"] = 2
}
v13.welcome_week_day_6_quest_2_consistent = {
    ["name"] = "Complete 20 Needs",
    ["reward"] = v4.make_bucks_reward(150),
    ["can_step_quest"] = v4.is_event("ailment_completed"),
    ["total_steps"] = 20
}
v13.welcome_week_day_7_quest_1_consistent = {
    ["name"] = "Complete 3 Orange Needs",
    ["reward"] = v4.make_bucks_reward(175),
    ["can_step_quest"] = v4.is_event_filter("ailment_completed", v9),
    ["total_steps"] = 3
}
v13.welcome_week_day_7_quest_2_consistent = {
    ["name"] = "Complete 25 Needs",
    ["reward"] = v4.make_bucks_reward(175),
    ["can_step_quest"] = v4.is_event("ailment_completed"),
    ["total_steps"] = 25
}
v13.welcome_week_day_8_quest_1_consistent = {
    ["name"] = "Complete 30 Needs",
    ["reward"] = v4.make_bucks_reward(400),
    ["can_step_quest"] = v4.is_event("ailment_completed"),
    ["total_steps"] = 30
}
for v_u_17, v18 in v13 do
    local v_u_19 = tonumber(v_u_17:sub(18, 18)) or 0
    v18.can_reroll = false
    v18.tags = { "default", "welcome_week" }
    local v20 = v18.reward
    local v_u_21 = v20.callback
    function v20.callback(p22, p23, p24)
        v_u_1("DataM").get_store(p22):get("welcome_week_manager"):mark_quest_complete(v_u_19, v_u_17)
        v_u_21(p22, p23, p24)
    end
    v18.reward = v20
    v18.frame_info = {
        ["style"] = v3.welcome_week_2024
    }
    v18.sort_override = 500 - (tonumber(v_u_17:sub(18, 18)) or 0) * 10 - (tonumber(v_u_17:sub(26, 26)) or 0)
    v18.contributes_to_quest_limit = false
    function v18.is_visible()
        return v_u_1("WelcomeWeekClient").is_active()
    end
    if v6:IsStudio() then
        function v18.can_step_quest()
            return true
        end
        v18.total_steps = 1
    end
end
return {
    ["welcome_week_2024"] = v5.Dictionary.merge(v10, v13)
}