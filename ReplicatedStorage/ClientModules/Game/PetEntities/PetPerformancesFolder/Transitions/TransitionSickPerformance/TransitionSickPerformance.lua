--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Transitions.TransitionSickPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ModifierPriority")
local v_u_3 = v1("SteppedTask")
local v_u_4 = v1("PetMovementTarget")
local v_u_5 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_6 = v1("StateManagerClient")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, _)
        local v7 = {
            ["modifiers"] = {},
            ["is_facing_player"] = false,
            ["is_looking_at_player"] = false,
            ["player_target"] = v_u_4.new({
                ["target"] = game.Players.LocalPlayer
            })
        }
        return v7
    end,
    ["step"] = function(p_u_8, p_u_9, _)
        p_u_9.task = p_u_9.task or v_u_3.new(function(p10)
            local v11 = p_u_9.modifiers
            p_u_8.sounds.play_sound("SickAlert")
            v11.idle_anim_speed = 0
            v11.eyes_id = "tiny_eyes"
            v11.effects = { "surprised" }
            v11.looping_sounds = {}
            p10:wait(0.9)
            v11.idle_anim_speed = 0.5
            v11.eyes_id = "drowsy_eyes"
            local v12 = v_u_6.get(p_u_8.base.char)
            if v12 and not (v12.is_sitting or v12.connected_to_char) then
                v11.should_jump = true
                v11.jump_height = 1.5
            end
            v11.head_target = p_u_9.player_target
            v11.rotation_target = p_u_9.player_target
            p10:wait(0.5)
            v11.should_jump = nil
            v11.jump_height = nil
            p10:wait(0.5)
            p_u_8.sounds.play_sound("SickPurpleLines")
            v11.effects = { "woozy", "emit_sweatdrop" }
            p10:wait(2)
            p_u_8.sounds.play_sound("SickIcebagThermometer")
            return v_u_5.Complete
        end)
        return p_u_9.task:step()
    end,
    ["calculate_modifiers"] = function(_, p13, _)
        return p13.modifiers or {}, {
            ["accessory_ids"] = v_u_2.Higher,
            ["eyes_id"] = v_u_2.Higher
        }
    end
}