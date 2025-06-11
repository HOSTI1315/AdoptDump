--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.FallAsleepPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetMovementTarget")
local v_u_3 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_4 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_5 = v1("SteppedTask")
local v_u_6 = game:GetService("Players")
local v_u_7 = {}
local v_u_8 = { "sleep" }
v_u_7.name = script.Name
function v_u_7.init_performance(_, p9)
    local v10 = {
        ["player_target"] = v_u_2.new({
            ["target"] = v_u_6.LocalPlayer
        }),
        ["time_started"] = os.clock(),
        ["has_fallen_into_deep_sleep"] = false,
        ["on_deep_sleep_callback"] = p9.on_deep_sleep_callback
    }
    return v10
end
function v_u_7.step(p_u_11, p_u_12, _)
    if not p_u_11.ailments.sleepy then
        return v_u_3.Complete
    end
    local v13 = p_u_11.exclusive_state == v_u_4.Sitting and 0 or (p_u_12.player_target:get_distance(p_u_11) or 0)
    if v_u_7.is_deep_sleeping(p_u_12) then
        if not p_u_12.has_fallen_into_deep_sleep then
            p_u_12.has_fallen_into_deep_sleep = true
            if p_u_12.on_deep_sleep_callback then
                p_u_12.on_deep_sleep_callback()
            end
        end
        if v13 > 14 then
            return v_u_3.Complete
        end
    elseif v13 > 10 then
        return v_u_3.Complete
    end
    p_u_12.task = p_u_12.task or v_u_5.new(function(p14)
        p_u_11.sounds.play_sound("Yawn")
        p14:wait_until(p_u_12.time_started + 3)
        p_u_12.looping_sounds = { "SleepLoop" }
    end)
    p_u_12.task:step()
end
function v_u_7.is_deep_sleeping(p15)
    return os.clock() - p15.time_started > 3.75
end
function v_u_7.calculate_modifiers(p16, p17, _)
    return {
        ["eyes_id"] = v_u_7.is_deep_sleeping(p17) and "sleepy_eyes" or "drowsy_eyes",
        ["effects"] = v_u_8,
        ["anim_name"] = p16.base.entry.anims.sleep or nil,
        ["sitting_cancels_server_anim"] = false,
        ["anim_fade_time"] = 3,
        ["hold_anim_speed"] = 0.2,
        ["animation_priority_override"] = Enum.AnimationPriority.Action2,
        ["walkspeed"] = 0,
        ["shouldnt_pathfind"] = true,
        ["looping_sounds"] = p17.looping_sounds
    }, {}
end
return v_u_7