--// ReplicatedStorage.ClientDB.Inventory.EntryHelper.ItemTypes.t (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.SharedPackages.t)
local v2 = {
    ["id"] = v_u_1.string,
    ["kind"] = v_u_1.string,
    ["category"] = v_u_1.string,
    ["contentpack"] = v_u_1.string,
    ["typechecked"] = v_u_1.boolean
}
local v3 = {
    ["name"] = v_u_1.string,
    ["image"] = v_u_1.string,
    ["rarity"] = v_u_1.string
}
local v4 = {
    ["cost"] = v_u_1.every(v_u_1.integer, v_u_1.numberMin(0)),
    ["currency_id"] = v_u_1.string,
    ["donatable"] = v_u_1.boolean,
    ["vip_exclusive"] = v_u_1.boolean,
    ["liveops_map_type_required_for_purchase"] = v_u_1.string,
    ["temporary"] = v_u_1.boolean,
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = v_u_1.boolean,
    ["permanently_delete_all_copies_of_this_item_when_db_entry_is_nil"] = v_u_1.boolean,
    ["is_hidden_from_backpack"] = v_u_1.boolean,
    ["force_journal_visibility"] = v_u_1.boolean,
    ["displayed_rarity"] = v_u_1.string,
    ["custom_tooltip_description"] = v_u_1.string,
    ["grid_category"] = v_u_1.string
}
local function v10(p5)
    local v6 = {}
    for _, v7 in p5 do
        for v8, v9 in v7 do
            v6[v8] = v9
        end
    end
    return v_u_1.strictInterface(v6)
end
for v11, v12 in v4 do
    v4[v11] = v_u_1.optional(v12)
end
local v13 = {
    ["full_origin"] = v_u_1.string,
    ["only_has_dev_product"] = v_u_1.boolean
}
local v14 = {
    ["text_size"] = v_u_1.integer,
    ["display_name"] = v_u_1.string,
    ["origin_items"] = v_u_1.array(v_u_1.string),
    ["viewport_override"] = v_u_1.strictInterface({
        ["offset"] = v_u_1.CFrame,
        ["distance"] = v_u_1.number
    })
}
for v15, v16 in v14 do
    v14[v15] = v_u_1.optional(v16)
end
local v17 = {
    ["year"] = v_u_1.number,
    ["origin"] = v_u_1.string
}
local v18 = v10({ v17, v14 })
local v19 = v10({ v17, v13, v14 })
local v20 = v_u_1.union(v_u_1.Color3, v_u_1.map(v_u_1.string, v_u_1.any))
local v21 = v_u_1.array(v_u_1.strictInterface({ v_u_1.string, v_u_1.string }))
local v22 = v_u_1.strictInterface({
    ["running"] = v_u_1.string,
    ["idle"] = v_u_1.string,
    ["sleep"] = v_u_1.string,
    ["sit"] = v_u_1.string,
    ["hold"] = v_u_1.string,
    ["double_hold"] = v_u_1.string,
    ["eating"] = v_u_1.string,
    ["drinking"] = v_u_1.optional(v_u_1.string),
    ["idle_low"] = v_u_1.optional(v_u_1.string),
    ["running_low"] = v_u_1.optional(v_u_1.string),
    ["flying"] = v_u_1.optional(v_u_1.string),
    ["idle_mounted"] = v_u_1.optional(v_u_1.string),
    ["running_mounted"] = v_u_1.optional(v_u_1.string),
    ["transform"] = v_u_1.optional(v_u_1.string),
    ["pedestal_idle"] = v_u_1.optional(v_u_1.string),
    ["focus_view"] = v_u_1.optional(v_u_1.string),
    ["minigame"] = v_u_1.optional(v_u_1.string)
})
local v23 = {
    ["anims"] = v_u_1.union(v22, v_u_1.map(v_u_1.string, v22)),
    ["origin_entry"] = v19,
    ["is_food_grabber"] = v_u_1.boolean
}
local v24 = {
    ["neon_parts"] = v20,
    ["mega_neon_parts"] = v20,
    ["mega_neon_colors"] = v_u_1.array(v_u_1.Color3),
    ["unpaintable_parts"] = v_u_1.array(v_u_1.string),
    ["anims"] = v_u_1.union(v22, v_u_1.map(v_u_1.string, v22)),
    ["tricks"] = v_u_1.union(v21, v_u_1.map(v_u_1.string, v21)),
    ["is_egg"] = v_u_1.boolean,
    ["is_non_event_egg"] = v_u_1.boolean,
    ["is_doll"] = v_u_1.boolean,
    ["is_proper_name"] = v_u_1.boolean,
    ["is_customizable"] = v_u_1.boolean,
    ["cannot_feed_potions"] = v_u_1.boolean,
    ["cannot_seal_colors"] = v_u_1.boolean,
    ["allowed_potions"] = v_u_1.array(v_u_1.string),
    ["fly_camera_offset"] = v_u_1.CFrame,
    ["already_has_flying_wings"] = v_u_1.boolean,
    ["flying_move_anim_speed"] = v_u_1.number,
    ["flying_wings_color"] = v_u_1.Color3,
    ["wings_offset"] = v_u_1.Vector3,
    ["wings_override"] = v_u_1.string,
    ["max_ride_scale"] = v_u_1.number,
    ["maximum_fly_anim_speed"] = v_u_1.number,
    ["maximum_run_anim_speed"] = v_u_1.number,
    ["maximum_mounted_anim_speed"] = v_u_1.number,
    ["minimum_fly_anim_speed"] = v_u_1.number,
    ["minimum_run_anim_speed"] = v_u_1.number,
    ["minimum_mounted_anim_speed"] = v_u_1.number,
    ["mounted_animation_scale_limit"] = v_u_1.number,
    ["mounted_fly_forward_tilt_compensation"] = v_u_1.number,
    ["eye_transparency"] = v_u_1.number,
    ["eyes"] = v_u_1.array(v_u_1.string),
    ["no_eyes"] = v_u_1.boolean,
    ["is_left_eye_hidden"] = v_u_1.boolean,
    ["is_right_eye_hidden"] = v_u_1.boolean,
    ["has_non_standard_eyes"] = v_u_1.boolean,
    ["baked_in_accessory_parts"] = v_u_1.map(v_u_1.string, v_u_1.array(v_u_1.string)),
    ["pre_equipped_removable_accessories"] = v_u_1.array(v_u_1.string),
    ["avatar_editor_app_camera_distance_overrides"] = v_u_1.strictInterface({
        ["front_facing"] = v_u_1.number,
        ["fit_to_screen"] = v_u_1.number
    }),
    ["head_rotator_disabled"] = v_u_1.boolean,
    ["head_rotator_doesnt_rotate_while_moving"] = v_u_1.boolean,
    ["head_rotator_name_override"] = v_u_1.string,
    ["head_rotator_uses_torso_instead"] = v_u_1.boolean,
    ["head_part_for_reactions"] = v_u_1.string,
    ["stabilizer_part_override"] = v_u_1.string,
    ["interaction_part_name"] = v_u_1.string,
    ["hold_double_offset"] = v_u_1.CFrame,
    ["hold_offset"] = v_u_1.CFrame,
    ["follow_offset_scale"] = v_u_1.number,
    ["hide_age_bar"] = v_u_1.boolean,
    ["ailments_disabled"] = v_u_1.boolean,
    ["ailments_to_hatch"] = v_u_1.number,
    ["progression_locked"] = v_u_1.boolean
}
local v_u_25 = v_u_1.every(v_u_1.integer, v_u_1.numberPositive)
local v_u_26 = 5
function v24.custom_ailments_per_age(p27)
    if #p27 == v_u_26 then
        return v_u_1.array(v_u_25)(p27)
    else
        return false, "array length is wrong"
    end
end
v24.set = v_u_1.string
v24.generate_npc_furniture_on_runtime = v_u_1.boolean
v24.gamepass_id = v_u_1.string
v24.hide_from_collectors_sign = v_u_1.boolean
local v28 = v_u_1.strictInterface
local v29 = {
    ["get_form"] = v_u_1.callback,
    ["default_form"] = v_u_1.string,
    ["forms"] = v_u_1.map(v_u_1.string, v_u_1.strictInterface({
        ["part_properties"] = v_u_1.optional(v_u_1.map(v_u_1.string, v_u_1.map(v_u_1.string, v_u_1.any))),
        ["parts"] = v_u_1.optional(v_u_1.array(v_u_1.string)),
        ["eyes"] = v_u_1.optional(v_u_1.array(v_u_1.string)),
        ["anims"] = v_u_1.optional(v22),
        ["tricks"] = v_u_1.optional(v21)
    })),
    ["transformation_effects"] = v_u_1.optional(v_u_1.callback)
}
v24.transforming_pet = v28(v29)
v24.minigame_anims = v_u_1.table
v24.anims_metatable = v_u_1.table
for v30, v31 in v24 do
    v24[v30] = v_u_1.optional(v31)
end
local v32 = {
    ["model"] = v_u_1.string,
    ["origin_entry"] = v18
}
local v33 = v10({
    v3,
    v4,
    v32,
    v24
})
local v34 = v10({
    v2,
    v4,
    v32,
    v24,
    v3,
    v23
})
local v35 = v_u_1.strictInterface
local v36 = {
    ["use"] = v_u_1.string,
    ["hold"] = v_u_1.string
}
for v37, v38 in v36 do
    v36[v37] = v_u_1.optional(v38)
end
local v39 = {
    ["anims"] = v35(v36),
    ["colorable"] = v_u_1.boolean,
    ["colorable_models"] = v_u_1.array(v_u_1.string),
    ["floats"] = v_u_1.boolean,
    ["food_is_collectable"] = v_u_1.boolean,
    ["food_kind"] = v_u_1.string,
    ["forward_drop_offset"] = v_u_1.number,
    ["leash_style"] = v_u_1.string,
    ["limit"] = v_u_1.number,
    ["placeable_type"] = v_u_1.string,
    ["preserve_model_welds"] = v_u_1.boolean,
    ["sounds"] = v_u_1.array(v_u_1.string),
    ["spin_anim"] = v_u_1.string,
    ["uses"] = v_u_1.number,
    ["lifetime_after_use"] = v_u_1.number,
    ["tool"] = v_u_1.string
}
local v40 = {}
for v41, v42 in v39 do
    v39[v41] = v_u_1.optional(v42)
end
local v43 = {
    ["model_handle"] = v_u_1.union(v_u_1.string, v_u_1.array(v_u_1.string))
}
local v44 = v10({
    v3,
    v4,
    v43,
    v39
})
local v45 = v10({
    v3,
    v4,
    v43,
    v39,
    v2,
    v40
})
local v46 = v_u_1.strictInterface
local v47 = {
    ["use"] = v_u_1.string,
    ["hold"] = v_u_1.string
}
for v48, v49 in v47 do
    v47[v48] = v_u_1.optional(v49)
end
local v50 = {
    ["anims"] = v46(v47),
    ["ailment_to_boost"] = v_u_1.string,
    ["cannot_feed_to_doll"] = v_u_1.boolean,
    ["cannot_feed_to_egg"] = v_u_1.boolean,
    ["cannot_feed_to_self"] = v_u_1.boolean,
    ["can_only_feed_to_egg"] = v_u_1.boolean,
    ["display_infinite_amount_in_backpack"] = v_u_1.boolean,
    ["is_hidden_unless_picking_source"] = v_u_1.string,
    ["is_infinite_bait"] = v_u_1.boolean,
    ["is_lure_bait"] = v_u_1.boolean,
    ["lure_pet_reveal_effect"] = v_u_1.string,
    ["lure_pet_reveal_sound"] = v_u_1.string,
    ["lure_time"] = v_u_1.number,
    ["preserve_model_welds"] = v_u_1.boolean,
    ["sounds"] = v_u_1.strictInterface({
        ["use"] = v_u_1.string
    }),
    ["message"] = v_u_1.string,
    ["player_must_confirm"] = v_u_1.boolean,
    ["uses"] = v_u_1.number,
    ["use_generated_public_lootbox_tooltip_description"] = v_u_1.boolean
}
local v51 = {}
for v52, v53 in v50 do
    v50[v52] = v_u_1.optional(v53)
end
local v54 = {
    ["tool"] = v_u_1.string,
    ["model_handle"] = v_u_1.union(v_u_1.string, v_u_1.array(v_u_1.string))
}
local v55 = v10({
    v3,
    v4,
    v54,
    v50
})
local v56 = v10({
    v3,
    v4,
    v54,
    v50,
    v2,
    v51
})
local v57 = v_u_1.strictInterface
local v58 = {
    ["use"] = v_u_1.string,
    ["hold"] = v_u_1.string,
    ["open"] = v_u_1.string,
    ["box_opening"] = v_u_1.array(v_u_1.string)
}
for v59, v60 in v58 do
    v58[v59] = v_u_1.optional(v60)
end
local v61 = {
    ["anims"] = v57(v58),
    ["uses"] = v_u_1.number,
    ["use_existing_rewards"] = v_u_1.array(v_u_1.strictInterface({
        ["kind"] = v_u_1.string,
        ["count"] = v_u_1.number
    })),
    ["use_generated_public_lootbox_tooltip_description_rarities"] = v_u_1.boolean,
    ["card_back"] = v_u_1.strictInterface({
        ["desktop"] = v_u_1.string,
        ["mobile"] = v_u_1.string
    }),
    ["card_foil"] = v_u_1.strictInterface({
        ["desktop"] = v_u_1.string,
        ["mobile"] = v_u_1.string
    }),
    ["subscription_gifting"] = v_u_1.strictInterface({
        ["kind"] = v_u_1.string,
        ["duration"] = v_u_1.optional(v_u_1.number)
    })
}
local v62 = {}
for v63, v64 in v61 do
    v61[v63] = v_u_1.optional(v64)
end
local v65 = {
    ["tool"] = v_u_1.string,
    ["model_handle"] = v_u_1.string
}
local v66 = v10({
    v3,
    v4,
    v65,
    v61
})
local v67 = v10({
    v3,
    v4,
    v65,
    v61,
    v2,
    v62
})
local v68 = v_u_1.strictInterface
local v69 = {
    ["use"] = v_u_1.string,
    ["hold"] = v_u_1.string
}
for v70, v71 in v69 do
    v69[v70] = v_u_1.optional(v71)
end
local v72 = v68(v69)
local v73 = v_u_1.strictInterface
local v74 = {
    ["turn_on_visual_effects_when_used"] = v_u_1.boolean,
    ["allow_cancellation_partway_through_use"] = v_u_1.boolean
}
for v75, v76 in v74 do
    v74[v75] = v_u_1.optional(v76)
end
local v77 = v73(v74)
local v78 = {
    ["anims"] = v72,
    ["colorable"] = v_u_1.boolean,
    ["tool_use_properties"] = v77
}
local v79 = {}
for v80, v81 in v78 do
    v78[v80] = v_u_1.optional(v81)
end
local v82 = {
    ["tool"] = v_u_1.string,
    ["model_handle"] = v_u_1.string,
    ["is_roleplay_item"] = v_u_1.literal(true)
}
local v83 = v10({
    v3,
    v4,
    v82,
    v78
})
local v84 = v10({
    v3,
    v4,
    v82,
    v78,
    v2,
    v79
})
local v85 = {
    ["display_infinite_amount_in_backpack"] = v_u_1.boolean,
    ["animated"] = v_u_1.boolean
}
for v86, v87 in v85 do
    v85[v86] = v_u_1.optional(v87)
end
local v88 = {
    ["image_large"] = v_u_1.string,
    ["tags"] = v_u_1.array(v_u_1.string),
    ["unlimited"] = v_u_1.boolean
}
local v89 = v_u_1.union
local v90 = v_u_1.strictInterface
local v91 = {
    ["sprite_sheets"] = v_u_1.map(v_u_1.literal("icon", "default", "large"), v_u_1.strictInterface({
        ["image"] = v_u_1.string,
        ["size"] = v_u_1.Vector2
    })),
    ["frame_count"] = v_u_1.intersection(v_u_1.numberPositive, v_u_1.integer),
    ["rows"] = v_u_1.intersection(v_u_1.numberPositive, v_u_1.integer),
    ["columns"] = v_u_1.intersection(v_u_1.numberPositive, v_u_1.integer),
    ["framerate"] = v_u_1.intersection(v_u_1.numberPositive, v_u_1.integer)
}
v88.flipbook_properties = v89(v90(v91), v_u_1.strictInterface({
    ["frames"] = v_u_1.map(v_u_1.literal("icon", "default", "large"), v_u_1.array(v_u_1.string)),
    ["framerate"] = v_u_1.intersection(v_u_1.numberPositive, v_u_1.integer)
}))
for v92, v93 in v88 do
    v88[v92] = v_u_1.optional(v93)
end
local v94 = {}
local v95 = v10({
    v3,
    v4,
    v94,
    v88
})
local v96 = v10({
    v3,
    v4,
    v94,
    v88,
    v2,
    v85
})
local v97 = v_u_1.strictInterface
local v98 = {
    ["parent_hold"] = v_u_1.string,
    ["baby_hold"] = v_u_1.string
}
for v99, v100 in v98 do
    v98[v99] = v_u_1.optional(v100)
end
local v101 = {
    ["anims"] = v97(v98),
    ["animation"] = v_u_1.string,
    ["colorable"] = v_u_1.boolean,
    ["colorable_models"] = v_u_1.array(v_u_1.string)
}
local v102 = {}
for v103, v104 in v101 do
    v101[v103] = v_u_1.optional(v104)
end
local v105 = {
    ["tool"] = v_u_1.string,
    ["model_handle"] = v_u_1.string
}
local v106 = v10({
    v3,
    v4,
    v105,
    v101
})
local v107 = v10({
    v3,
    v4,
    v105,
    v101,
    v2,
    v102
})
local v108 = {
    ["colorable"] = v_u_1.boolean,
    ["is_roller_skates"] = v_u_1.boolean,
    ["is_taxi"] = v_u_1.boolean,
    ["is_train"] = v_u_1.boolean,
    ["is_roleplay_item"] = v_u_1.literal(true),
    ["use_favorite_color"] = v_u_1.boolean,
    ["viewport_override"] = v_u_1.strictInterface({
        ["distance"] = v_u_1.number,
        ["orientation"] = v_u_1.CFrame
    })
}
local v109 = {}
for v110, v111 in v108 do
    v108[v110] = v_u_1.optional(v111)
end
local v112 = {}
local v113 = v10({
    v3,
    v4,
    v112,
    v108
})
local v114 = v10({
    v3,
    v4,
    v112,
    v108,
    v2,
    v109
})
local v115 = {
    ["tool"] = v_u_1.literal("PetAccessoryTool"),
    ["animation"] = v_u_1.strictInterface({
        ["hold"] = v_u_1.literal("CandyCannonHold"),
        ["use"] = v_u_1.literal("CandyCannonHold")
    })
}
local v116 = {
    ["equip_type"] = v_u_1.string,
    ["tags"] = v_u_1.array(v_u_1.string),
    ["flap_animation"] = v_u_1.string,
    ["flying_scale"] = v_u_1.number,
    ["static_effects"] = v_u_1.array(v_u_1.strictInterface({
        ["effect_type"] = v_u_1.string,
        ["options"] = v_u_1.map(v_u_1.string, v_u_1.any)
    }))
}
for v117, v118 in v116 do
    v116[v117] = v_u_1.optional(v118)
end
local v119 = {
    ["model_handle"] = v_u_1.string,
    ["sort_group"] = v_u_1.string,
    ["accessory_type"] = v_u_1.string,
    ["is_in_hatshop_rotation"] = v_u_1.boolean
}
local v120 = v10({
    v3,
    v4,
    v119,
    v116
})
local v121 = v10({
    v3,
    v4,
    v119,
    v116,
    v2,
    v115
})
local v122 = {
    ["max_furniture"] = v_u_1.number,
    ["recommended_furniture"] = v_u_1.optional(v_u_1.strictInterface({
        ["tags"] = v_u_1.optional(v_u_1.map(v_u_1.string, v_u_1.literal(true))),
        ["content_packs"] = v_u_1.optional(v_u_1.map(v_u_1.string, v_u_1.literal(true)))
    })),
    ["addons"] = v_u_1.optional(v_u_1.map(v_u_1.string, v_u_1.strictInterface({
        ["name"] = v_u_1.string,
        ["cost"] = v_u_1.number,
        ["order"] = v_u_1.number,
        ["kind"] = v_u_1.string,
        ["sell_price"] = v_u_1.number
    }))),
    ["exterior_name"] = v_u_1.string,
    ["get_exterior"] = v_u_1.callback
}
local v123 = {
    ["exterior_name"] = v_u_1.string,
    ["gamepass"] = v_u_1.string,
    ["max_furniture"] = v_u_1.number,
    ["recommended_furniture"] = v_u_1.strictInterface({
        ["tags"] = v_u_1.optional(v_u_1.array(v_u_1.string)),
        ["content_packs"] = v_u_1.optional(v_u_1.array(v_u_1.string))
    }),
    ["addons"] = v_u_1.map(v_u_1.string, v_u_1.strictInterface({
        ["name"] = v_u_1.string,
        ["cost"] = v_u_1.number,
        ["order"] = v_u_1.number
    })),
    ["text_signs"] = v_u_1.map(v_u_1.string, v_u_1.strictInterface({
        ["default_text"] = v_u_1.string,
        ["max_length"] = v_u_1.number
    })),
    ["terrain_properties"] = v_u_1.map(v_u_1.string, v_u_1.any),
    ["default_properties"] = v_u_1.map(v_u_1.string, v_u_1.any),
    ["validate_properties"] = v_u_1.callback,
    ["default_color"] = v_u_1.Color3,
    ["mailbox_offset"] = v_u_1.CFrame,
    ["additional_doors"] = v_u_1.array(v_u_1.string),
    ["no_parties"] = v_u_1.boolean,
    ["disable_setting_wall_textures"] = v_u_1.boolean,
    ["disable_setting_floor_textures"] = v_u_1.boolean,
    ["allow_touch_door_leaving"] = v_u_1.boolean,
    ["align_spawned_furniture_to_world_space"] = v_u_1.boolean,
    ["takedown_timestamp"] = v_u_1.integer,
    ["original_cost"] = v_u_1.integer,
    ["is_last_chance"] = v_u_1.boolean,
    ["was_robux_house"] = v_u_1.optional(v_u_1.boolean),
    ["was_multiple_purchase_or_developer_product"] = v_u_1.optional(v_u_1.boolean)
}
for v124, v125 in v123 do
    v123[v124] = v_u_1.optional(v125)
end
local v126 = {
    ["is_for_sale"] = v_u_1.boolean,
    ["model_name"] = v_u_1.string,
    ["order"] = v_u_1.number
}
local v127 = v10({
    v3,
    v4,
    v126,
    v123
})
local v128 = v10({
    v3,
    v4,
    v126,
    v123,
    v2,
    v122
})
local v129 = {
    ["type"] = v_u_1.string,
    ["can_use_in_house"] = v_u_1.boolean,
    ["can_color"] = v_u_1.boolean,
    ["image_id"] = v_u_1.string,
    ["donatable"] = v_u_1.boolean
}
local v130 = {
    ["cost"] = v_u_1.every(v_u_1.integer, v_u_1.numberMin(0)),
    ["currency_id"] = v_u_1.string,
    ["donatable"] = v_u_1.boolean,
    ["gamepass"] = v_u_1.string,
    ["rarity"] = v_u_1.string,
    ["image_id"] = v_u_1.number,
    ["tags"] = v_u_1.array(v_u_1.string),
    ["behavior"] = v_u_1.map(v_u_1.string, v_u_1.any),
    ["layout_order"] = v_u_1.number,
    ["limit_per_house"] = v_u_1.number,
    ["image_size_x"] = v_u_1.number,
    ["image_size_y"] = v_u_1.number,
    ["small_model_interaction_anti_occlusion"] = v_u_1.boolean,
    ["off_sale"] = v_u_1.boolean,
    ["can_color"] = v_u_1.boolean,
    ["immediate_depreciation"] = v_u_1.number
}
for v131, v132 in v130 do
    v130[v131] = v_u_1.optional(v132)
end
local v133 = {
    ["name"] = v_u_1.string,
    ["model_name"] = v_u_1.string
}
local v134 = v10({
    v133,
    v130,
    v2,
    v129
})
local v135 = {
    ["pets"] = {
        ["definition"] = v33,
        ["runtime"] = v34
    },
    ["toys"] = {
        ["definition"] = v44,
        ["runtime"] = v45
    },
    ["food"] = {
        ["definition"] = v55,
        ["runtime"] = v56
    },
    ["gifts"] = {
        ["definition"] = v66,
        ["runtime"] = v67
    },
    ["roleplay"] = {
        ["definition"] = v83,
        ["runtime"] = v84
    },
    ["stickers"] = {
        ["definition"] = v95,
        ["runtime"] = v96
    },
    ["strollers"] = {
        ["definition"] = v106,
        ["runtime"] = v107
    },
    ["transport"] = {
        ["definition"] = v113,
        ["runtime"] = v114
    },
    ["pet_accessories"] = {
        ["definition"] = v120,
        ["runtime"] = v121
    },
    ["houses"] = {
        ["definition"] = v127,
        ["runtime"] = v128
    },
    ["furniture"] = {
        ["definition"] = v10({ v133, v130 }),
        ["runtime"] = v134
    }
}
return v135