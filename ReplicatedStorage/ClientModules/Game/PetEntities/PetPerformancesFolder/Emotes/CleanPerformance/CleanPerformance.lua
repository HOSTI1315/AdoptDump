--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.CleanPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SteppedTask")
local v_u_3 = v1("PetMovementTarget")
local v_u_4 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_5 = v1("StateManagerClient")
local v_u_6 = game:GetService("Players")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, _)
        local v7 = {
            ["player_target"] = v_u_3.new({
                ["target"] = v_u_6.LocalPlayer
            }),
            ["is_looking_at_owner"] = false,
            ["modifiers"] = {}
        }
        return v7
    end,
    ["step"] = function(p_u_8, p_u_9)
        p_u_9.task = p_u_9.task or v_u_2.new(function(p10)
            local v11 = p_u_9.modifiers
            v11.eyes_id = "sleepy_eyes"
            v11.effects = { "sparkly" }
            p10:wait(2.5)
            v11.eyes_id = "happy_eyes"
            v11.walkspeed = 0
            local v12 = v_u_5.get(p_u_8.base.char)
            if v12 and not (v12.is_sitting or v12.connected_to_char) then
                v11.should_jump = true
                v11.jump_height = 2
            end
            v11.rotation_target = p_u_9.player_target
            v11.head_target = p_u_9.player_target
            p10:wait(0.85)
            p_u_8.sounds.play_sound("CuredHearts")
            v11.should_jump = nil
            v11.jump_height = nil
            v11.effects = { "sparkly", "hearts" }
            p10:wait(2)
            return v_u_4.Complete
        end)
        return p_u_9.task:step()
    end,
    ["calculate_modifiers"] = function(_, p13, _)
        local v14 = p13.modifiers or {}
        v14.dont_allow_sit_states = true
        return v14, {}
    end
}