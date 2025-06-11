--// ReplicatedStorage.SharedModules.ContentPacks.BonusWeek2024.Quests (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("QuestFrameStyleDB")
local v3 = v1("QuestsDBHelper")
local v_u_4 = v1("package:Sift")
local v_u_5 = v1("EquippedPets")
local function v8(p_u_6, _)
    return {
        ["quantity"] = p_u_6,
        ["text_color"] = Color3.fromRGB(34, 181, 115),
        ["callback"] = function(_, p7, _)
            p7:addBucks(p_u_6):expect()
        end
    }
end
local function v10(p9)
    return v_u_5.get_wrapper_from_unique(p9.options.unique_id, p9.player) or false
end
local v11 = {}
local v12 = {}
local v13 = {
    ["name"] = "Complete 5 Needs for your pet",
    ["total_steps"] = 5,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("ailment_completed", v10),
    ["reward"] = v8(40, "bonus_week_2024_medium")
}
v12.bonus_week_2024_small_ailments = v13
local v14 = {
    ["name"] = "Hatch 1 Egg",
    ["total_steps"] = 1,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event("egg_hatched"),
    ["reward"] = v8(45, "bonus_week_2024_medium")
}
v12.bonus_week_2024_small_hatch_egg = v14
local v17 = {
    ["name"] = "Use a Tiny or Regular Age Potion on a pet",
    ["total_steps"] = 1,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("potion_drank_by_pet", function(p15)
        local v16 = p15.options.kind
        return v_u_4.List.includes({ "pet_age_potion", "tiny_pet_age_potion" }, v16)
    end),
    ["reward"] = v8(20, "bonus_week_2024_medium")
}
v12.bonus_week_2024_small_age_potion_drank = v17
local v21 = {
    ["name"] = "Complete any Orange Need for your pet",
    ["total_steps"] = 1,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("ailment_completed", function(p18)
        local v19 = p18.options.ailment_kind
        local v20 = v_u_4.List.includes({
            "school",
            "beach_party",
            "pizza_party",
            "salon",
            "bored",
            "camping",
            "sick"
        }, v19)
        if v20 then
            v20 = v_u_5.get_wrapper_from_unique(p18.options.unique_id, p18.player) or false
        end
        return v20
    end),
    ["reward"] = v8(10, "bonus_week_2024_medium")
}
v12.bonus_week_2024_small_ailment_orange = v21
v11.bonus_week_2024_small = v12
local v22 = {}
local v23 = {
    ["name"] = "Complete 15 Needs for your pet",
    ["total_steps"] = 15,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("ailment_completed", v10),
    ["reward"] = v8(120, "bonus_week_2024_large")
}
v22.bonus_week_2024_medium_ailments = v23
local v27 = {
    ["name"] = "Complete 2 Salon or Dirty Needs for your pet",
    ["total_steps"] = 2,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("ailment_completed", function(p24)
        local v25 = p24.options.ailment_kind
        local v26 = v_u_4.List.includes({ "salon", "dirty" }, v25)
        if v26 then
            v26 = v_u_5.get_wrapper_from_unique(p24.options.unique_id, p24.player) or false
        end
        return v26
    end),
    ["reward"] = v8(25, "bonus_week_2024_large")
}
v22.bonus_week_2024_medium_ailment_salon_dirty = v27
local v31 = {
    ["name"] = "Complete 3 Hungry, Sleepy, or Bored Needs for your pet",
    ["total_steps"] = 3,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("ailment_completed", function(p28)
        local v29 = p28.options.ailment_kind
        local v30 = v_u_4.List.includes({ "bored", "sleepy", "hungry" }, v29)
        if v30 then
            v30 = v_u_5.get_wrapper_from_unique(p28.options.unique_id, p28.player) or false
        end
        return v30
    end),
    ["reward"] = v8(50, "bonus_week_2024_large")
}
v22.bonus_week_2024_medium_ailment_hungry_sleepy_bored = v31
local v35 = {
    ["name"] = "Complete 2 Catch or Bored Needs for your pet",
    ["total_steps"] = 2,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("ailment_completed", function(p32)
        local v33 = p32.options.ailment_kind
        local v34 = v_u_4.List.includes({ "bored", "play" }, v33)
        if v34 then
            v34 = v_u_5.get_wrapper_from_unique(p32.options.unique_id, p32.player) or false
        end
        return v34
    end),
    ["reward"] = v8(50, "bonus_week_2024_large")
}
v22.bonus_week_2024_medium_ailment_catch_bored = v35
local v39 = {
    ["name"] = "Complete 2 Walk or Beach Party Needs for your pet",
    ["total_steps"] = 2,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("ailment_completed", function(p36)
        local v37 = p36.options.ailment_kind
        local v38 = v_u_4.List.includes({ "walk", "beach_party" }, v37)
        if v38 then
            v38 = v_u_5.get_wrapper_from_unique(p36.options.unique_id, p36.player) or false
        end
        return v38
    end),
    ["reward"] = v8(50, "bonus_week_2024_large")
}
v22.bonus_week_2024_medium_ailment_walk_beach = v39
local v43 = {
    ["name"] = "Complete 2 Pizza Party or Hunger Needs for your pet",
    ["total_steps"] = 2,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("ailment_completed", function(p40)
        local v41 = p40.options.ailment_kind
        local v42 = v_u_4.List.includes({ "pizza_party", "hungry" }, v41)
        if v42 then
            v42 = v_u_5.get_wrapper_from_unique(p40.options.unique_id, p40.player) or false
        end
        return v42
    end),
    ["reward"] = v8(50, "bonus_week_2024_large")
}
v22.bonus_week_2024_medium_ailment_pizza_hungry = v43
local v47 = {
    ["name"] = "Complete 2 School or Ride Needs for your pet",
    ["total_steps"] = 2,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("ailment_completed", function(p44)
        local v45 = p44.options.ailment_kind
        local v46 = v_u_4.List.includes({ "school", "ride" }, v45)
        if v46 then
            v46 = v_u_5.get_wrapper_from_unique(p44.options.unique_id, p44.player) or false
        end
        return v46
    end),
    ["reward"] = v8(50, "bonus_week_2024_large")
}
v22.bonus_week_2024_medium_ailment_school_ride = v47
local v51 = {
    ["name"] = "Complete 3 Potty, Dirty, or Sleepy Needs for your pet",
    ["total_steps"] = 3,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("ailment_completed", function(p48)
        local v49 = p48.options.ailment_kind
        local v50 = v_u_4.List.includes({ "toilet", "sleepy", "dirty" }, v49)
        if v50 then
            v50 = v_u_5.get_wrapper_from_unique(p48.options.unique_id, p48.player) or false
        end
        return v50
    end),
    ["reward"] = v8(25, "bonus_week_2024_large")
}
v22.bonus_week_2024_medium_ailment_toilet_dirty_sleepy = v51
v11.bonus_week_2024_medium = v22
local v52 = {}
local v53 = {
    ["name"] = "Complete 30 Needs on a Common pet",
    ["total_steps"] = 30,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    }
}
local v_u_54 = "common"
v53.can_step_quest = v3.is_event_filter("ailment_completed", function(p55)
    local v56 = v_u_5.get_wrapper_from_unique(p55.options.unique_id, p55.player)
    if v56 then
        return v56.pet_inventory_item.entry.rarity == v_u_54
    else
        return false
    end
end)
v53.reward = v8(240, "bonus_week_2024_small")
v52.bonus_week_2024_large_ailments_common = v53
local v57 = {
    ["name"] = "Complete 30 Needs on an Uncommon pet",
    ["total_steps"] = 30,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    }
}
local v_u_58 = "uncommon"
v57.can_step_quest = v3.is_event_filter("ailment_completed", function(p59)
    local v60 = v_u_5.get_wrapper_from_unique(p59.options.unique_id, p59.player)
    if v60 then
        return v60.pet_inventory_item.entry.rarity == v_u_58
    else
        return false
    end
end)
v57.reward = v8(240, "bonus_week_2024_small")
v52.bonus_week_2024_large_ailments_uncommon = v57
local v61 = {
    ["name"] = "Complete 30 Needs on a Rare pet",
    ["total_steps"] = 30,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    }
}
local v_u_62 = "rare"
v61.can_step_quest = v3.is_event_filter("ailment_completed", function(p63)
    local v64 = v_u_5.get_wrapper_from_unique(p63.options.unique_id, p63.player)
    if v64 then
        return v64.pet_inventory_item.entry.rarity == v_u_62
    else
        return false
    end
end)
v61.reward = v8(240, "bonus_week_2024_small")
v52.bonus_week_2024_large_ailments_rare = v61
local v65 = {
    ["name"] = "Complete 30 Needs on an Ultra Rare pet",
    ["total_steps"] = 30,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    }
}
local v_u_66 = "ultra_rare"
v65.can_step_quest = v3.is_event_filter("ailment_completed", function(p67)
    local v68 = v_u_5.get_wrapper_from_unique(p67.options.unique_id, p67.player)
    if v68 then
        return v68.pet_inventory_item.entry.rarity == v_u_66
    else
        return false
    end
end)
v65.reward = v8(240, "bonus_week_2024_small")
v52.bonus_week_2024_large_ailments_ultra_rare = v65
local v69 = {
    ["name"] = "Complete 30 Needs on a Legendary pet",
    ["total_steps"] = 30,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    }
}
local v_u_70 = "legendary"
v69.can_step_quest = v3.is_event_filter("ailment_completed", function(p71)
    local v72 = v_u_5.get_wrapper_from_unique(p71.options.unique_id, p71.player)
    if v72 then
        return v72.pet_inventory_item.entry.rarity == v_u_70
    else
        return false
    end
end)
v69.reward = v8(240, "bonus_week_2024_small")
v52.bonus_week_2024_large_ailments_legendary = v69
local v73 = {
    ["name"] = "Complete 30 Needs for your pet",
    ["total_steps"] = 30,
    ["contributes_to_quest_limit"] = false,
    ["sort_override"] = 200,
    ["frame_info"] = {
        ["style"] = v2.bonus_week_2024
    },
    ["can_step_quest"] = v3.is_event_filter("ailment_completed", v10),
    ["reward"] = v8(240, "bonus_week_2024_small")
}
v52.bonus_week_2024_large_ailments = v73
v11.bonus_week_2024_large = v52
return v11