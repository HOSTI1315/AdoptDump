--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.SicknessCuredPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SteppedTask")
local v_u_3 = v1("PetMovementTarget")
local v_u_4 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_5 = v1("StateManagerClient")
local v_u_6 = game:GetService("Players")
return {
    ["name"] = script.Name,
    ["step"] = function(p_u_7, p_u_8)
        p_u_8.task = p_u_8.task or v_u_2.new(function(p9)
            local v10 = v_u_3.new({
                ["target"] = v_u_6.LocalPlayer
            })
            p_u_7.sounds.play_sound("CuredSparkles")
            p_u_8.modifiers = {
                ["eyes_id"] = "happy_eyes",
                ["effects"] = { "heal_ring", "fast_sparkles" }
            }
            p9:wait(2)
            local v11 = v_u_5.get(p_u_7.base.char)
            local v12 = v11 and not v11.is_sitting
            if v12 then
                v12 = not v11.connected_to_char
            end
            p_u_8.modifiers = {
                ["eyes_id"] = "happy_eyes",
                ["should_jump"] = v12,
                ["jump_height"] = v12 and 2 or nil,
                ["rotation_target"] = v10,
                ["head_target"] = v10
            }
            p9:wait(0.85)
            p_u_7.sounds.play_sound("CuredHearts")
            p_u_8.modifiers = {
                ["eyes_id"] = "happy_eyes",
                ["effects"] = { "hearts" },
                ["rotation_target"] = v10,
                ["head_target"] = v10
            }
            p9:wait(2)
            return v_u_4.Complete
        end)
        return p_u_8.task:step()
    end,
    ["calculate_modifiers"] = function(_, p13, _)
        return p13.modifiers or {}, {}
    end
}