--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.PetMovementAnimator (ModuleScript)

game:GetService("ReplicatedStorage")
local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("StateManagerClient")
local v_u_3 = v_u_1("CharWrapperClient")
local v_u_4 = v_u_1("AnimationManager")
local v5 = {}
local function v_u_14(p6, p7, p8, p9)
    local v_u_10 = p6.animations
    local v11 = p9 or p6.base.entry.anims[p7]
    if v_u_10.current_anim_name == v11 then
        return
    else
        local v12 = p6.animations
        if v12.current_track then
            v12.current_anim_name = nil
            v12.current_track:Stop(p8)
            v12.current_track:Destroy()
        end
        local v13 = p6.shared_cache.Animator
        if v13 and p6.shared_cache.WorldRoot then
            v_u_10.current_anim_name = v11
            v_u_10.last_speed = 1
            local _ = v_u_10.current_track
            v_u_10.current_track = v13:LoadAnimation((v_u_4.get_track(v11)))
            v_u_10.current_track.Priority = Enum.AnimationPriority.Core
            v_u_10.current_track:Play(p8)
            v_u_10.is_track_stopped = false
            v_u_10.track_stopped_connection_maid.stopped_connection = v_u_10.current_track.Stopped:Connect(function()
                v_u_10.track_stopped_connection_maid:DoCleaning()
                v_u_10.is_track_stopped = true
            end)
        end
    end
end
local function v_u_23(p15, p16)
    local v17 = p16.shared_cache.Wings
    if v17 and (p15 and not p16.animations.wing_flap_track) then
        local v18 = p16.shared_cache.temp_wings_equipped
        if v18 then
            v18:Destroy()
        end
        local v19 = "PetFlyingWingFlap"
        local v20 = p16.base.char_wrapper.custom_wings
        if v20 then
            local v21 = v_u_1("InventoryDB").pet_accessories[v20]
            if v21 then
                v19 = v21.flap_animation or v19
            end
        end
        local v22 = v_u_4.get_track(v19)
        p16.animations.wing_flap_track = v17:WaitForChild("AnimationController"):LoadAnimation(v22)
        p16.animations.wing_flap_track:Play()
    elseif not p15 and p16.animations.wing_flap_track then
        p16.animations.wing_flap_track:Stop()
        p16.animations.wing_flap_track:Destroy()
        p16.animations.wing_flap_track = nil
    end
end
local function v_u_28(p24)
    if p24.client_has_control and not p24.is_npc_pet then
        if p24.mount_state.is_mounted then
            return p24.mount_state.movement_speed
        end
        local v25 = p24.move_state
        local v26 = p24.speed_state
        return (v25.move_vector + v26.owner_move_vector).Magnitude
    else
        local v27 = p24.mount_state.flying_bodyvelocity
        if v27 then
            return v27.Velocity.Magnitude
        else
            return (p24.base.root.Velocity * Vector3.new(1, 0, 1)).Magnitude
        end
    end
end
function v5.cleanup(p29)
    local v30 = p29.animations
    if v30.current_track then
        v30.current_anim_name = nil
        v30.current_track:Stop(nil)
        v30.current_track:Destroy()
    end
end
v5.optimization_prioritize = "near"
function v5.step(p31, _)
    if p31.shared_cache.WorldRoot then
        local v32 = p31.base
        local v33 = v32.entry.anims
        local v34 = p31.modifier_values_from_performances.local_anim_name
        if v34 then
            v_u_14(p31, nil, p31.modifier_values_from_performances.anim_fade_time or 0.2, v34)
            local v35 = p31.modifier_values_from_performances.local_anim_speed
            if v35 and (p31.animations.current_track and p31.animations.last_speed ~= v35) then
                p31.animations.current_track:AdjustSpeed(v35)
                p31.animations.last_speed = v35
            end
        else
            local v36 = p31.modifier_values_from_performances.idle_anim_speed
            local v37 = v_u_28(p31)
            local v38 = v_u_2.get(v32.char)
            local v39
            if v38 then
                v39 = v_u_2.has_state(v38, "PetBeingFlown")
            else
                v39 = v38
            end
            if v39 then
                v38 = v39
            elseif v38 then
                v38 = v_u_2.has_state(v38, "PetBeingRidden")
            end
            local v40 = p31.shared_cache.humanoid_state == Enum.HumanoidStateType.Swimming
            local v41 = p31.modifier_values_from_performances.stumble_time
            local v42 = v41 ~= nil
            local v43 = v_u_3.get(v32.char)
            local v44 = v43 and v43.use_low_anims or p31.swim_state.enabled
            if v42 then
                if v41 < 2 then
                    v_u_14(p31, nil, 0.2, "PenguinSit")
                elseif v41 < 6 then
                    v_u_14(p31, nil, 0.2, "PenguinIdle")
                    if p31.animations.current_track and p31.animations.last_speed ~= 4 then
                        p31.animations.current_track:AdjustSpeed(4)
                        p31.animations.last_speed = 4
                    end
                else
                    v_u_14(p31, nil, 0.2, "PenguinIdle")
                    if p31.animations.current_track and p31.animations.last_speed ~= 1 then
                        p31.animations.current_track:AdjustSpeed(1)
                        p31.animations.last_speed = 1
                    end
                end
            elseif (v39 or v37 < 0.5) and not (v39 and (v32.entry.already_has_flying_wings or v33.flying)) then
                if v40 then
                    v_u_14(p31, "running", 0.2)
                    local v45 = v36 or 0.3
                    if p31.animations.current_track and p31.animations.last_speed ~= v45 then
                        p31.animations.current_track:AdjustSpeed(v45)
                        p31.animations.last_speed = v45
                    end
                else
                    local v46 = v33.idle_mounted and v38 and "idle_mounted" or "idle"
                    if v44 and v33[v46 .. "_low"] then
                        v46 = v46 .. "_low"
                    end
                    v_u_14(p31, v46, 0.2)
                    local v47 = v36 or 1
                    if p31.animations.current_track and p31.animations.last_speed ~= v47 then
                        p31.animations.current_track:AdjustSpeed(v47)
                        p31.animations.last_speed = v47
                    end
                end
            else
                local v48 = "running"
                local v49 = v32.entry.minimum_run_anim_speed
                local v50 = v32.entry.maximum_run_anim_speed
                if v38 then
                    if v39 and v33.flying then
                        v49 = v32.entry.minimum_fly_anim_speed or 1
                        v50 = v32.entry.maximum_fly_anim_speed or (1 / 0)
                        v37 = v37 * (v32.entry.flying_move_anim_speed or 1)
                        v48 = "flying"
                    elseif v33.running_mounted then
                        v48 = "running_mounted"
                    elseif v48 == "running" then
                        local v51 = v32.entry.minimum_mounted_anim_speed or 0
                        v49 = math.max(v49 or 0, v51)
                        local v52 = v32.entry.maximum_mounted_anim_speed or (1 / 0)
                        v50 = math.min(v50 or (1 / 0), v52)
                    end
                end
                if v44 and v33[v48 .. "_low"] then
                    v48 = v48 .. "_low"
                end
                v_u_14(p31, v48, 0.2)
                local v53 = v37 / 16
                local v54 = math.clamp(v53, v49 or 0, v50 or (1 / 0))
                if p31.animations.current_track and p31.animations.last_speed ~= v54 then
                    p31.animations.current_track:AdjustSpeed(v54)
                    p31.animations.last_speed = v54
                end
            end
            v_u_23(v39, p31)
        end
    else
        local v55 = p31.animations
        if v55.current_track then
            v55.current_anim_name = nil
            v55.current_track:Stop(nil)
            v55.current_track:Destroy()
        end
        v_u_23(false, p31)
        return
    end
end
return v5