--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Petting.PettingHappyPerformance (ModuleScript)

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
    ["init_performance"] = function(p9, _)
        local v10 = p9.base.root.CFrame
        local v_u_11 = {
            ["start_cframe"] = v10,
            ["modifiers"] = {
                ["cframe"] = v10,
                ["eyes_id"] = "happy_eyes",
                ["effects"] = { "hearts", "surprised" },
                ["pause_ailment_chat_bubbles"] = true
            },
            ["priorities"] = {
                ["head_angles"] = v_u_4.Highest,
                ["cframe"] = v_u_4.Highest
            }
        }
        local v12 = v_u_5.tween_info({
            ["time"] = 0.15,
            ["delay_time"] = 0.05,
            ["easing_style"] = Enum.EasingStyle.Quart,
            ["easing_direction"] = Enum.EasingDirection.Out,
            ["reverses"] = true,
            ["repeat_count"] = 1
        })
        v_u_11.tween_cframe = v_u_6.callback(0, 1, v12, function(p13)
            v_u_11.modifiers.cframe = v_u_11.start_cframe + Vector3.new(0, 1, 0) * p13 * 0.35
            v_u_11.modifiers.head_angles = p13 * 0.7853981633974483 * Vector3.new(0, 1, 0)
        end)
        return v_u_11
    end,
    ["step"] = function(p_u_14, p_u_15)
        p_u_15.task = p_u_15.task or v_u_7.new(function(p16)
            p_u_14.sounds.play_sound("CuredHearts")
            while p_u_15.tween_cframe:getStatus() == v_u_8.Status.Started do
                p16:wait_for_step()
            end
            p16:wait(0.5)
            return v_u_3.Complete
        end)
        if p_u_15.task then
            return p_u_15.task:step()
        end
    end,
    ["calculate_modifiers"] = function(_, p17)
        return p17.modifiers, p17.priorities
    end
}