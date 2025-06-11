--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.Quests (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("EquippedPets")
local v3 = v1("QuestFrameStyleDB")
local v_u_4 = v1("QuestsDBHelper")
local v_u_5 = v1("package:Sift")
local v_u_6 = v1("new:TutorialAB")
local v7 = {}
local v8 = {
    ["name"] = "Age up a pet 1 level",
    ["frame_info"] = {
        ["style"] = v3.daily_pets
    },
    ["can_step_quest"] = v_u_4.is_event("pet_age_increased"),
    ["reward"] = 45,
    ["quest_help_entry"] = "age_up_pet_tutorial"
}
v7.tutorial_age_up_pet = v8
local v12 = {
    ["name"] = "Wash off your pet at home",
    ["frame_info"] = {
        ["style"] = v3.daily_pets
    },
    ["can_step_quest"] = v_u_4.is_event_filter("ailment_completed", function(p9)
        local v10 = p9.options.ailment_kind
        local v11 = v_u_5.List.includes({ "dirty" }, v10)
        if v11 then
            v11 = v_u_2.get_wrapper_from_unique(p9.options.unique_id, p9.player) or false
        end
        return v11
    end),
    ["reward"] = 30,
    ["quest_help_entry"] = "dirty_need_tutorial"
}
v7.tutorial_dirty_need = v12
local v14 = {
    ["name"] = "Edit your house",
    ["frame_info"] = {
        ["style"] = v3.daily_building
    },
    ["can_step_quest"] = function(p13)
        return (p13.name == "furniture_bought" or (p13.name == "furniture_sold" or p13.name == "furniture_edited")) and true or p13.name == "texture_bought"
    end,
    ["reward"] = 120,
    ["quest_help_entry"] = "edit_house_tutorial"
}
v7.tutorial_edit_house = v14
local v15 = {
    ["name"] = "Complete a need",
    ["frame_info"] = {
        ["style"] = v3.daily_pets
    },
    ["can_step_quest"] = v_u_4.is_event("ailment_completed"),
    ["reward"] = 30,
    ["quest_help_entry"] = "complete_ailment_tutorial"
}
v7.tutorial_complete_ailment = v15
local v16 = {
    ["name"] = "Hatch an egg",
    ["frame_info"] = {
        ["style"] = v3.daily_egg
    },
    ["can_step_quest"] = v_u_4.is_event("egg_hatched"),
    ["reward"] = 45,
    ["quest_help_entry"] = "hatch_egg_tutorial"
}
v7.tutorial_hatch_egg = v16
local v17 = {
    ["name"] = "Name your pet",
    ["frame_info"] = {
        ["style"] = v3.daily_pets
    },
    ["can_step_quest"] = v_u_4.is_event("pet_named"),
    ["reward"] = 30,
    ["quest_help_entry"] = "name_pet_tutorial"
}
v7.tutorial_name_pet = v17
local v18 = {
    ["name"] = "Buy a vehicle",
    ["can_step_quest"] = v_u_4.is_event_options("item_purchased_with_bucks", {
        ["item_category"] = "transport"
    }),
    ["reward"] = 75,
    ["quest_help_entry"] = "buy_vehicle_tutorial"
}
v7.tutorial_buy_vehicle = v18
local v19 = {
    ["name"] = "Teach your pet a trick at the school",
    ["frame_info"] = {
        ["style"] = v3.daily_pets
    },
    ["can_step_quest"] = v_u_4.is_event("pet_trick_learned"),
    ["reward"] = 30,
    ["quest_help_entry"] = "learn_pet_trick_tutorial"
}
v7.tutorial_pet_trick_learned = v19
local v20 = {
    ["name"] = "Dress up your pet and save a new outfit",
    ["frame_info"] = {
        ["style"] = v3.daily_fashion
    },
    ["can_step_quest"] = v_u_4.is_event("pet_outfit_saved"),
    ["reward"] = 30,
    ["quest_help_entry"] = "save_new_pet_outfit_tutorial"
}
v7.tutorial_save_new_pet_outfit = v20
local v23 = {
    ["name"] = "Buy a new house",
    ["frame_info"] = {
        ["style"] = v3.daily_building
    },
    ["can_step_quest"] = function(p21, p22)
        if p21.name == "quest_added" and p21.options.quest_unique_id == p22.unique_id then
            return v_u_4.get_data(p21.player, "house_manager"):get_num_houses() > 1
        else
            return p21.name == "house_bought"
        end
    end,
    ["reward"] = v_u_4.make_item_reward({
        ["kind"] = "biggift",
        ["category"] = "gifts"
    }),
    ["quest_help_entry"] = "mailbox_upgrade_house_tutorial"
}
v7.tutorial_buy_house = v23
local v24 = {
    ["name"] = "Adopt a new egg in the Nursery",
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v3.daily_egg
    },
    ["can_step_quest"] = v_u_4.is_event_options("item_purchased_with_bucks", {
        ["interior_name"] = "Nursery",
        ["item_category"] = "pets"
    }),
    ["reward"] = 75,
    ["quest_help_entry"] = "buy_egg_tutorial"
}
v7.tutorial_buy_egg = v24
local v25 = {
    ["name"] = "Adopt a new egg in the Nursery",
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v3.daily_egg
    },
    ["can_step_quest"] = v_u_4.is_event_options("interior_entered", {
        ["destination_id"] = "Nursery"
    }),
    ["reward"] = v_u_4.make_item_reward({
        ["kind"] = "cracked_egg",
        ["category"] = "pets"
    }),
    ["quest_help_entry"] = "buy_egg_tutorial"
}
v7.tutorial_free_egg = v25
local v28 = {
    ["name"] = "Achieve a 3 day login streak",
    ["frame_info"] = {
        ["style"] = v3.daily_time
    },
    ["can_step_quest"] = function(p26)
        local v27
        if p26.name == "daily_login_streak_updated" then
            v27 = p26.options.streak >= 3
        else
            v27 = false
        end
        return v27
    end,
    ["reward"] = 100
}
v7.tutorial_three_day_login_streak = v28
for v_u_29, v30 in v7 do
    local v31 = v30.reward
    if typeof(v31) == "number" then
        local v32 = v30.reward
        v30.reward = v_u_4.make_bucks_and_quest_reward(v32, function(p33)
            return v_u_6:get_value("quest_path", p33)[v_u_29] or {}
        end)
    end
end
return {
    ["tutorial_quests"] = v7
}