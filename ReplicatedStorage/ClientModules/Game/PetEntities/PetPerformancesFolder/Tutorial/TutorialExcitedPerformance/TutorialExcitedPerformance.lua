--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Tutorial.TutorialExcitedPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SteppedTask")
local v_u_3 = v1("PetMovementTarget")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p4)
        local v5 = {
            ["modifiers"] = {
                ["head_target"] = v_u_3.new({
                    ["target"] = p4.look_at_position
                })
            }
        }
        return v5
    end,
    ["step"] = function(p_u_6, p_u_7)
        p_u_7.task = p_u_7.task or v_u_2.new(function(p8)
            while true do
                local v9 = p_u_7.modifiers
                v9.effects = {}
                v9.eyes_id = "happy_eyes"
                p8:wait(0.45)
                v9.should_jump = true
                v9.jump_height = 2
                p8:wait(0.5)
                v9.should_jump = nil
                v9.jump_height = nil
                p_u_6.sounds.play_sound("HappySqueak")
                v9.effects = { "exclaim" }
                p8:wait(1)
            end
        end)
        return p_u_7.task:step()
    end,
    ["calculate_modifiers"] = function(_, p10, _)
        return p10.modifiers or {}, {}
    end
}