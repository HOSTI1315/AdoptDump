--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Petting.PettingUpsetPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_3 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_4 = v1("ModifierPriority")
local v_u_5 = v1("TweenHelper")
local v_u_6 = v1("TweenPromise")
local v_u_7 = v1("SteppedTask")
local v_u_8 = v1("package:Promise")
return {
    ["name"] = script.Name,
    ["allowed_exclusive_states"] = { v2.Focused },
    ["init_performance"] = function(_, _)
        local v_u_9 = {
            ["modifiers"] = {
                ["effects"] = { "sigh", "blushing" },
                ["eyes_id"] = "drowsy_eyes",
                ["pause_ailment_chat_bubbles"] = true
            },
            ["priorities"] = {
                ["head_angles"] = v_u_4.Highest
            }
        }
        local v10 = v_u_5.tween_info({
            ["time"] = 0.5,
            ["easing_style"] = Enum.EasingStyle.Sine,
            ["easing_direction"] = Enum.EasingDirection.Out
        })
        v_u_9.tween_head = v_u_6.callback(1, 0, v10, function(p11)
            v_u_9.modifiers.head_angles = p11 * 0.6981317007977318 * Vector3.new(0, 1, 0)
        end)
        return v_u_9
    end,
    ["step"] = function(p_u_12, p_u_13)
        p_u_13.task = p_u_13.task or v_u_7.new(function(p14)
            p_u_12.sounds.play_sound("BoredSigh")
            while p_u_13.tween_head:getStatus() == v_u_8.Status.Started do
                p14:wait_for_step()
            end
            p14:wait(0.5)
            return v_u_3.Complete
        end)
        if p_u_13.task then
            return p_u_13.task:step()
        end
    end,
    ["calculate_modifiers"] = function(_, p15)
        return p15.modifiers, p15.priorities
    end
}