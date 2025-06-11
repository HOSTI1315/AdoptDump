--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.NoticeObjectPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Utilities")
local v_u_3 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_4 = v1("PetMovementTarget")
local v_u_5 = v1("SteppedTask")
local v_u_6 = v1("package:t")
return {
    ["name"] = script.Name,
    ["validate"] = function(_, p7)
        return v_u_6.Vector3(p7.object) or v_u_2.does_exist(p7.object)
    end,
    ["init_performance"] = function(p_u_8, p9)
        local v_u_10 = {
            ["object"] = p9.object,
            ["notice_delay_time"] = p9.notice_delay_time or 0.2,
            ["acknowledgement_time"] = p9.acknowledgement_time or 1,
            ["should_jump_on_notice"] = p9.should_jump_on_notice or false,
            ["idle_anim_speed"] = p9.idle_anim_speed or 1,
            ["eyes_on_notice"] = p9.eyes_on_notice,
            ["eye_color_on_notice"] = p9.eye_color_on_notice,
            ["do_not_turn_to_face_target"] = p9.do_not_turn_to_face_target or false,
            ["effects_on_notice"] = p9.effects_on_notice or {},
            ["sounds_on_notice"] = p9.sounds_on_notice or { "ThreeLinesAlert" },
            ["mute_sounds"] = p9.mute_sounds,
            ["object_target"] = v_u_4.new({
                ["target"] = p9.object
            }),
            ["stay_in_place_target"] = v_u_4.new({
                ["target"] = p_u_8.base.root
            }),
            ["has_jumped"] = false,
            ["modifiers"] = {}
        }
        local v_u_11 = p_u_8.base.entry.is_egg and "RightVector" or "LookVector"
        function v_u_10.get_dot_product_to_target()
            local v12 = p_u_8.base.root.Position
            local v13 = v12.X
            local v14 = v12.Z
            local v15 = Vector3.new(v13, 0, v14)
            local v16 = v_u_10.object_target:get_position()
            local v17 = v16.X
            local v18 = v16.Z
            local v19 = Vector3.new(v17, 0, v18)
            local v20 = CFrame.new(v15, v19)
            return p_u_8.base.root.CFrame[v_u_11]:Dot(v20.LookVector)
        end
        return v_u_10
    end,
    ["step"] = function(p_u_21, p_u_22)
        if not (v_u_6.Vector3(p_u_22.object) or v_u_2.does_exist(p_u_22.object)) then
            return v_u_3.Cancel
        end
        p_u_22.task = p_u_22.task or v_u_5.new(function(p23)
            local v24 = p_u_22.modifiers
            local v25 = p_u_22.get_dot_product_to_target()
            if not p_u_22.mute_sounds and v25 < -0.7071067811865475 then
                p_u_21.sounds.play_sound("HeadTurn")
            end
            if p_u_22.do_not_turn_to_face_target then
                ::l5::
                p23:wait(p_u_22.notice_delay_time)
                if not p_u_22.mute_sounds then
                    for _, v26 in ipairs(p_u_22.sounds_on_notice) do
                        p_u_21.sounds.play_sound(v26)
                    end
                end
                v24.eyes_id = p_u_22.eyes_on_notice
                v24.eye_color = p_u_22.eye_color_on_notice
                v24.effects = p_u_22.effects_on_notice or p_u_22.passive_effects
                v24.should_jump = p_u_22.should_jump_on_notice or nil
                v24.idle_anim_speed = p_u_22.idle_anim_speed
                p23:wait(p_u_22.acknowledgement_time)
                return v_u_3.Complete
            else
                local v27 = os.clock()
                while true do
                    if true then
                        v24.effects = p_u_22.passive_effects
                        local v28 = p_u_22.get_dot_product_to_target()
                        local v29
                        if p_u_21.base.humanoid.Sit then
                            v29 = os.clock() - v27 > 0.15
                        else
                            local v30 = v28 > 0.7071067811865475
                            v29 = os.clock() - v27 > 1 and true or v30
                        end
                    end
                    if not v29 then
                        p23:wait_for_step()
                    end
                    if v29 then
                        goto l5
                    end
                end
            end
        end)
        return p_u_22.task:step()
    end,
    ["calculate_modifiers"] = function(_, p31, _)
        local v32 = p31.modifiers or {}
        if v32.should_jump and not p31.has_jumped then
            p31.has_jumped = true
            v32.should_jump = true
            v32.jump_height = 2
        else
            v32.should_jump = false
        end
        local v33, v34
        if p31.do_not_turn_to_face_target then
            v33 = nil
            v34 = nil
        else
            v33 = p31.object_target
            v34 = p31.object_target
        end
        v32.movement_target = p31.stay_in_place_target
        v32.rotation_target = v33
        v32.head_target = v34
        return v32, {}
    end
}