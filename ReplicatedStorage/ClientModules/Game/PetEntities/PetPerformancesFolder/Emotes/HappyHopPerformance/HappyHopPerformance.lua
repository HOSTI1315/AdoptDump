--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.HappyHopPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SteppedTask")
local v_u_3 = v1("PetMovementTarget")
local v_u_4 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_5 = game:GetService("Players")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p6)
        local v7 = p6 or {}
        local v8 = v_u_3.from_target_and_follow_distance(v_u_5.LocalPlayer, 3.5)
        local v9 = v_u_3.new({
            ["target"] = v_u_5.LocalPlayer
        })
        return {
            ["modifiers"] = {
                ["rotation_target"] = v9,
                ["head_target"] = v9,
                ["movement_target"] = v8,
                ["eyes_id"] = v7.eyes_id or "happy_eyes",
                ["eye_color"] = v7.eye_color
            }
        }
    end,
    ["step"] = function(_, p_u_10)
        p_u_10.task = p_u_10.task or v_u_2.new(function(p11)
            local v12 = p_u_10.modifiers
            v12.should_jump = true
            v12.walkspeed = 0
            p11:wait(0.55)
            return v_u_4.Complete
        end)
        return p_u_10.task:step()
    end,
    ["calculate_modifiers"] = function(_, p13, _)
        local v14 = p13.modifiers or {}
        if v14.should_jump and not p13.has_jumped then
            p13.has_jumped = true
            v14.should_jump = true
            v14.jump_height = 1.5
        else
            v14.should_jump = false
        end
        return v14, {}
    end
}