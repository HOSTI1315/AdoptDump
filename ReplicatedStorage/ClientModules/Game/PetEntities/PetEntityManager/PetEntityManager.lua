--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntityManager (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("CharWrapperClient")
local v_u_3 = v_u_1("EquippedPets")
local v_u_4 = v_u_1("Maid")
local v_u_5 = v_u_1("AdoptMeEnums/PetEntities/MountType")
local v_u_6 = v_u_1("NoYield")
local v_u_7 = v_u_1("AdoptMeEnums/PetEntities/ObstacleType")
local v_u_8 = v_u_1("PetEntitySessionMemory")
local v_u_9 = v_u_1("RouterClient")
local v10 = v_u_1("Signal")
local v_u_11 = v_u_1("Spring")
local v_u_12 = v_u_1("WaitForPetCharacter")
local v_u_13 = v_u_1("package:Promise")
local v_u_14 = v_u_1("package:Sift")
local v_u_15 = game:GetService("RunService")
local v_u_16 = game:GetService("HttpService")
local v_u_17 = game:GetService("Players")
local v_u_18 = v_u_9.get("PetAPI/ReplicateActivePerformances")
local v_u_19 = {}
local v_u_20 = {}
local v_u_21 = {}
local v_u_22 = {}
local v_u_23 = {}
local v_u_24 = {}
local v_u_25 = {}
local v_u_26 = {}
local v_u_27 = v10.new()
local v_u_28 = {}
local v_u_29 = {}
local function v41(p30)
    local v31 = {}
    for v32, v33 in ipairs(p30) do
        local v34 = v_u_1(v33)
        if v_u_15:IsStudio() then
            local v35 = v33 .. " returned nil"
            assert(v34, v35)
            local v36 = v34.step
            local v37 = v33 .. " needs a step function"
            assert(v36, v37)
            local v38 = v34.system_name == nil
            local v39 = v33 .. " is not allowed to declare system_name: it is set externally"
            assert(v38, v39)
        end
        v34.system_name = v33
        v31[v32] = v34
        local v40 = v_u_29
        table.insert(v40, v34)
    end
    return v31
end
local function v_u_44()
    table.clear(v_u_24)
    table.clear(v_u_25)
    table.clear(v_u_26)
    for v42, v43 in v_u_21 do
        v43.failed_earlier_this_step = false
        if v43.client_has_control then
            v_u_24[v42] = v43
        end
        if v43.visible then
            v_u_25[v42] = v43
        end
        if (v43.base.root.Position - workspace.CurrentCamera.Focus.Position).Magnitude < 200 then
            v_u_26[v42] = v43
        end
    end
end
local v_u_45 = v41({})
local v_u_46 = v41({ "HeadRotator", "PetDrinkingHeadRotator" })
local v_u_47 = v41({
    "SharedCache",
    "CharWrapperUpdater",
    "FurnitureIdUpdater",
    "AilmentAggregator",
    "AilmentReactor",
    "WorldStateReactor",
    "ReactionInitializer",
    "ExclusiveStateCalculator",
    "ReactionStepper",
    "ReactionMemoryCleaner",
    "PerformanceInitializer",
    "PerformanceStepper",
    "PetStateReplicator",
    "ReplicatedModifiersUpdater",
    "ObstacleDetector",
    "TargetUpdater",
    "PathManager",
    "GoalPositionSetter",
    "MoveVectorCalculator",
    "PetMover",
    "SwimmingMover",
    "BodyRotator",
    "MountController",
    "MountedCameraMover",
    "StumbleController",
    "Teleporter",
    "RigidConstraintMover",
    "PetSoundPlayer",
    "PetMovementAnimator",
    "DefaultEyesAnimator",
    "CustomEyesAnimator",
    "VisualEffectCreator",
    "MegaNeonAnimator",
    "CFrameSetter",
    "TransformingPetHandler"
})
function v_u_20._create_pet_entity_internal(p48, p49, p50)
    v_u_12(p48)
    local v51 = v_u_2.get(p48)
    local v52 = {
        ["is_pet_entity"] = true,
        ["visible"] = false,
        ["in_game"] = true,
        ["base"] = {
            ["char"] = p48,
            ["char_wrapper"] = v51,
            ["pet_model"] = p48.PetModel,
            ["humanoid"] = p48.Humanoid,
            ["root"] = p48.HumanoidRootPart,
            ["entry"] = v_u_14.Dictionary.copyDeep(p49)
        },
        ["current_furniture_id"] = nil,
        ["current_furniture_use_id"] = nil,
        ["is_changing_interiors"] = false,
        ["immediate_teleport"] = false
    }
    if v51 then
        local v53 = v51.pet_unique
        local v54 = v51.player.UserId
        v52.unique_id = v53 .. "-" .. tostring(v54)
    else
        v52.unique_id = v_u_16:GenerateGUID() .. "-temporary"
    end
    v52.is_npc_pet = not v51
    v52.session_memory = v_u_8.get_or_make_memory_bank(v52)
    v52.ailments = v52.session_memory:get_or_default("ailments", {})
    v52.tricks_used = v52.session_memory:get_or_default("tricks_used", {})
    v52.shared_cache = {}
    v52.failed_earlier_this_step = false
    v52.special_behavior_maids = {}
    v52.world_state_reactor = {
        ["active_reaction"] = nil,
        ["pending_ailment_reactions"] = {}
    }
    v52.short_term_reaction_memory = {}
    v52.exclusive_state = nil
    v52.staged_reactions = {}
    v52.active_reactions = {}
    v52.reactions_cancelled_this_frame = {}
    v52.reactions_completed_this_frame = {}
    v52.last_active_reactions = v52.active_reactions
    v52.staged_performances = {}
    v52.active_performances = {}
    v52.performances_cancelled_this_frame = {}
    v52.performances_completed_this_frame = {}
    v52.last_active_performances = v52.active_performances
    v52.modifier_values_from_performances = {}
    v52.last_modifier_values_from_performances = v52.modifier_values_from_performances
    v52.last_acknowledged_world_state = nil
    v52.buffered_replicated_modifiers_update = v_u_19[v52.unique_id]
    v52.last_claimed_food_object_time = nil
    v52.obstacle_detection = {
        ["obstacle_type"] = v_u_7.None,
        ["obstacle_height"] = 7.159,
        ["last_successful_move_time"] = (1 / 0),
        ["recent_path_waypoint_position"] = nil,
        ["recent_path_waypoint_changed_tick"] = nil
    }
    v52.pathfinding = {
        ["path"] = nil,
        ["is_pathfinding_to_target"] = false,
        ["pathfinding_reason"] = nil,
        ["did_path_fail_this_frame"] = false,
        ["last_owner_airborne_time"] = (-1 / 0)
    }
    v52.goal_state = {
        ["target"] = nil,
        ["follow_offset"] = nil,
        ["goal_position"] = nil,
        ["recent_obstacle"] = nil,
        ["distance_to_owner"] = (1 / 0)
    }
    v52.jump_state = {
        ["base_jump_height"] = 7.159,
        ["last_jump_time"] = 0,
        ["buffered_jump_height"] = nil
    }
    v52.speed_state = {
        ["calculated_speed"] = 0,
        ["owner_move_vector"] = Vector3.new(),
        ["base_speed"] = 16,
        ["pathfinding_speed"] = 20
    }
    v52.move_state = {
        ["move_vector"] = Vector3.new(),
        ["final_move_vector"] = Vector3.new(),
        ["is_moving"] = false,
        ["last_move_time"] = tick(),
        ["calculator_disabled"] = false
    }
    v52.rotation = {
        ["rotation_bodygyro"] = nil
    }
    v52.head_rotation = {
        ["needs_setup"] = true,
        ["setup_attempts_remaining"] = 10,
        ["eye_offset"] = nil,
        ["head_motors"] = nil,
        ["head_bones"] = nil,
        ["feet_motors"] = nil,
        ["feet_bones"] = nil,
        ["hrp_joint"] = nil,
        ["outer_inner"] = nil,
        ["neck_base_motor"] = nil,
        ["spring"] = nil
    }
    v52.mega_neon = {
        ["cached_colors"] = nil,
        ["cached_parts"] = nil,
        ["force_visible"] = false
    }
    v52.default_eyes = {
        ["eye_states"] = {},
        ["rig_appearance"] = nil,
        ["eyes_closed"] = false,
        ["next_blink_time"] = 0,
        ["_was_closed"] = false,
        ["visible"] = true
    }
    v52.custom_eyes = {
        ["supports_custom_eyes"] = false,
        ["eyes_id"] = "default",
        ["last_eyes_id"] = "default",
        ["left_eye_attachment"] = nil,
        ["right_eye_attachment"] = nil,
        ["current_model"] = nil,
        ["last_character_scale"] = 1,
        ["last_character_transparency"] = 0,
        ["visible"] = true,
        ["eye_color"] = nil,
        ["last_eyes_color"] = nil
    }
    v52.animations = {
        ["current_anim_name"] = nil,
        ["current_track"] = nil,
        ["swim_rotate_track"] = nil,
        ["is_track_stopped"] = false,
        ["track_stopped_connection_maid"] = v_u_4.new(),
        ["last_speed"] = nil
    }
    v52.mount_state = {
        ["mount_maid"] = v_u_4.new(),
        ["is_mounted"] = false,
        ["current_mount_type"] = v_u_5.NotMounted,
        ["movement_speed"] = 0,
        ["flying_bodyvelocity"] = nil,
        ["flying_bodygyro"] = nil,
        ["flying_move_spring"] = v_u_11.new(100, 1000, (Vector3.new())),
        ["flying_tilt_spring"] = v_u_11.new(80, 1000, (Vector3.new())),
        ["finalize_vertical_offset_timestamp"] = (-1 / 0),
        ["vertical_camera_offset"] = nil
    }
    v52.swim_state = {
        ["swim_bodygyro"] = nil,
        ["swim_bodyvelocity"] = nil,
        ["enabled"] = false,
        ["swim_maid"] = v_u_4.new()
    }
    v52.trick_fx = {
        ["is_fx_running"] = false,
        ["is_fx_cleaned"] = false,
        ["cleanup_timestamp"] = (1 / 0),
        ["fx_maid"] = v_u_4.new(),
        ["connection_maid"] = v_u_4.new()
    }
    v52.visual_effects = {
        ["current_effects"] = {},
        ["instances"] = {},
        ["pet_model_attachments"] = {}
    }
    v52.sounds = {
        ["global_volume"] = 1,
        ["global_volume_last"] = 1,
        ["sound_unmodified_volumes"] = {},
        ["current_looping_sounds"] = {},
        ["play_sound"] = nil
    }
    v52.stumble_state = {
        ["stumble_bodygyro"] = nil,
        ["stumble_bodyvelocity"] = nil,
        ["enabled"] = false
    }
    v52.transforming_pet = {
        ["needs_setup"] = true,
        ["previous_form"] = nil,
        ["maid"] = nil
    }
    if p50 then
        p50(v52)
    end
    for _, v55 in ipairs(v_u_29) do
        if v55.setup then
            v55.setup(v52)
        end
    end
    v_u_21[p48] = v52
    v_u_23[v52.unique_id] = v52
    if v52.base.char_wrapper then
        v_u_18:FireServer(p48, v52.active_performances)
    end
    if v51 and v51.entity_controller == v_u_17.LocalPlayer then
        local v56 = v_u_28
        table.insert(v56, v52)
        v_u_27:Fire(v_u_28, v52)
    end
    return v52
end
local function v_u_62(p57)
    local v58 = table.pack(p57:await())
    if v58[1] then
        local v59 = v58.n
        return unpack(v58, 2, v59)
    end
    local v60 = error
    local v61 = v58[2]
    v60(tostring(v61), 2)
end
function v_u_20.create_pet_entity(p_u_63, p64, p65)
    if v_u_21[p_u_63] then
        return v_u_21[p_u_63]
    end
    if v_u_22[p_u_63] then
        return v_u_62(v_u_22[p_u_63])
    end
    local v66 = v_u_13.try(v_u_20._create_pet_entity_internal, p_u_63, p64, p65)
    v_u_22[p_u_63] = v66
    v66:catch(function()
        v_u_21[p_u_63] = nil
    end)
    v66:finally(function()
        v_u_22[p_u_63] = nil
    end)
    local v67 = v_u_2.get(p_u_63)
    if v67 then
        v67 = v67.player
    end
    if v67 then
        v67 = v_u_3.get_equipped_char_wrappers(v67)[2]
    end
    if v67 then
        v67 = v_u_20.get_pet_entity(v67.char)
    end
    if v67 then
        v67.move_state.is_moving = true
    end
    return v_u_62(v66)
end
function v_u_20.get_local_owned_pet_entities()
    return v_u_28
end
function v_u_20.get_local_owned_pet_entity_updated_signal()
    return v_u_27
end
function v_u_20.wait_for_local_owned_pet_entities()
    if #v_u_28 > 0 then
        return v_u_28
    else
        return v_u_27:Wait()
    end
end
function v_u_20.get_pet_entity(p68)
    return v_u_21[p68]
end
function v_u_20.remove_pet_entity_by_char(p69)
    local v70 = v_u_20.get_pet_entity(p69)
    if v70 then
        if v_u_23[v70.unique_id] then
            v_u_23[v70.unique_id] = nil
        end
        v_u_21[p69] = nil
        local v71 = table.find(v_u_28, v70)
        if v71 then
            table.remove(v_u_28, v71)
        end
        local v72 = v70.base.char_wrapper
        if v72 then
            v72 = v72.player
        end
        if v72 then
            v72 = v_u_3.get_equipped_char_wrappers(v72)[1]
        end
        if v72 then
            v72 = v_u_20.get_pet_entity(v72.char)
        end
        if v72 then
            v72.move_state.is_moving = true
        end
        for _, v73 in ipairs(v_u_29) do
            if v73.cleanup then
                v_u_13.try(v73.cleanup, v70)
            end
        end
        v_u_44()
    end
end
function v_u_20.remove_pet_entity_by_entity(p74)
    v_u_20.remove_pet_entity_by_char(p74.base.char)
end
function v_u_20.mark_is_changing_interiors(p75, p76)
    p75.is_changing_interiors = p76 == true
end
function v_u_20.mark_for_immediate_teleport(p77)
    p77.immediate_teleport = true
end
function v_u_20.start()
    local v_u_78 = v_u_45
    local v_u_79 = 0
    local function v_u_91(p80)
        debug.profilebegin("PetEntityManager")
        v_u_79 = v_u_79 + 1
        for v81, v82 in v_u_78 do
            debug.profilebegin("PetEntities_System_Prepare")
            local v83 = v_u_21
            local v84 = v82.optimization_prioritize
            if v84 then
                v84 = (v_u_79 + v81) % 6 ~= 0
            end
            local v85 = nil
            if v84 then
                v85 = v82.optimization_prioritize
            elseif v82.optimization_run_only_for then
                v85 = v82.optimization_run_only_for
            end
            if v85 then
                if v85 == "owned" then
                    v83 = v_u_24
                elseif v85 == "visible" then
                    v83 = v_u_25
                elseif v85 == "near" then
                    v83 = v_u_26
                else
                    v83 = error((("%* is not a valid optimization list name."):format(v85)))
                end
            end
            debug.profileend()
            debug.profilebegin((("PetEntities_System_Run %*"):format(v82.system_name)))
            for _, v86 in v83 do
                if not v86.failed_earlier_this_step and v86.in_game then
                    local v_u_87 = nil
                    local v_u_88 = nil
                    if not xpcall(v82.step, function(p89)
                        v_u_87 = p89
                        v_u_88 = debug.traceback(nil, 2)
                    end, v86, p80) then
                        local v90 = v86.base.char
                        v86.failed_earlier_this_step = true
                        warn((("Error executing system %* for %*. Not running subsequent systems for this pet:\n%*\n%*"):format(v82.system_name, v90:GetFullName(), v_u_87, v_u_88)))
                    end
                end
            end
            debug.profileend()
        end
        debug.profileend()
    end
    local function v_u_93(p92)
        v_u_6(v_u_91, p92)
    end
    local v_u_94 = v_u_46
    local v_u_95 = 0
    local function v_u_107(p96)
        debug.profilebegin("PetEntityManager")
        v_u_95 = v_u_95 + 1
        for v97, v98 in v_u_94 do
            debug.profilebegin("PetEntities_System_Prepare")
            local v99 = v_u_21
            local v100 = v98.optimization_prioritize
            if v100 then
                v100 = (v_u_95 + v97) % 6 ~= 0
            end
            local v101 = nil
            if v100 then
                v101 = v98.optimization_prioritize
            elseif v98.optimization_run_only_for then
                v101 = v98.optimization_run_only_for
            end
            if v101 then
                if v101 == "owned" then
                    v99 = v_u_24
                elseif v101 == "visible" then
                    v99 = v_u_25
                elseif v101 == "near" then
                    v99 = v_u_26
                else
                    v99 = error((("%* is not a valid optimization list name."):format(v101)))
                end
            end
            debug.profileend()
            debug.profilebegin((("PetEntities_System_Run %*"):format(v98.system_name)))
            for _, v102 in v99 do
                if not v102.failed_earlier_this_step and v102.in_game then
                    local v_u_103 = nil
                    local v_u_104 = nil
                    if not xpcall(v98.step, function(p105)
                        v_u_103 = p105
                        v_u_104 = debug.traceback(nil, 2)
                    end, v102, p96) then
                        local v106 = v102.base.char
                        v102.failed_earlier_this_step = true
                        warn((("Error executing system %* for %*. Not running subsequent systems for this pet:\n%*\n%*"):format(v98.system_name, v106:GetFullName(), v_u_103, v_u_104)))
                    end
                end
            end
            debug.profileend()
        end
        debug.profileend()
    end
    local function v_u_109(p108)
        v_u_6(v_u_107, p108)
    end
    local v_u_110 = v_u_47
    local v_u_111 = 0
    local function v_u_123(p112)
        debug.profilebegin("PetEntityManager")
        v_u_111 = v_u_111 + 1
        for v113, v114 in v_u_110 do
            debug.profilebegin("PetEntities_System_Prepare")
            local v115 = v_u_21
            local v116 = v114.optimization_prioritize
            if v116 then
                v116 = (v_u_111 + v113) % 6 ~= 0
            end
            local v117 = nil
            if v116 then
                v117 = v114.optimization_prioritize
            elseif v114.optimization_run_only_for then
                v117 = v114.optimization_run_only_for
            end
            if v117 then
                if v117 == "owned" then
                    v115 = v_u_24
                elseif v117 == "visible" then
                    v115 = v_u_25
                elseif v117 == "near" then
                    v115 = v_u_26
                else
                    v115 = error((("%* is not a valid optimization list name."):format(v117)))
                end
            end
            debug.profileend()
            debug.profilebegin((("PetEntities_System_Run %*"):format(v114.system_name)))
            for _, v118 in v115 do
                if not v118.failed_earlier_this_step and v118.in_game then
                    local v_u_119 = nil
                    local v_u_120 = nil
                    if not xpcall(v114.step, function(p121)
                        v_u_119 = p121
                        v_u_120 = debug.traceback(nil, 2)
                    end, v118, p112) then
                        local v122 = v118.base.char
                        v118.failed_earlier_this_step = true
                        warn((("Error executing system %* for %*. Not running subsequent systems for this pet:\n%*\n%*"):format(v114.system_name, v122:GetFullName(), v_u_119, v_u_120)))
                    end
                end
            end
            debug.profileend()
        end
        debug.profileend()
    end
    local function v125(p124)
        v_u_6(v_u_123, p124)
    end
    v_u_15:BindToRenderStep("UpdateRenderstepPetEntitySystems", Enum.RenderPriority.Camera.Value + 1, function(p126)
        for _, v127 in pairs(v_u_21) do
            if not v127.in_game then
                v_u_20.remove_pet_entity_by_char(v127.base.char)
            end
        end
        v_u_44()
        v_u_93(p126)
    end)
    v_u_9.get_event("PetAPI/TeleportPetOnClient").OnClientEvent:Connect(function(p128, p129)
        p128.PrimaryPart.CFrame = p129
    end)
    v_u_9.get_event("PetAPI/ReplicateModifiersToClient").OnClientEvent:Connect(function(p130, p131)
        local v132 = v_u_23[p130]
        v_u_19[p130] = p131
        if v132 then
            v132.buffered_replicated_modifiers_update = p131
        end
    end)
    v_u_9.get_event("PetAPI/ClearModifiers").OnClientEvent:Connect(function(p133)
        v_u_19[p133] = nil
    end)
    v_u_15.Stepped:Connect(function(_, p134)
        v_u_109(p134)
    end)
    v_u_15.Heartbeat:Connect(v125)
end
return v_u_20