--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Transitions.TransitionDirtyPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ModifierPriority")
local v_u_3 = v1("SteppedTask")
local v_u_4 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
return {
    ["name"] = script.Name,
    ["step"] = function(p_u_5, p_u_6, _)
        p_u_6.task = p_u_6.task or v_u_3.new(function(p7)
            p_u_5.sounds.play_sound("Shock")
            p_u_6.modifiers = {
                ["eyes_id"] = "tiny_eyes",
                ["effects"] = { "stinky", "shock" },
                ["idle_anim_speed"] = 0,
                ["walkspeed"] = 0
            }
            p7:wait(1.2)
            p_u_5.sounds.play_sound("DispleasedSweatdrop")
            p_u_6.modifiers = {
                ["eyes_id"] = "drowsy_eyes",
                ["effects"] = { "stinky", "blushing", "emit_sweatdrop" },
                ["walkspeed"] = 0
            }
            p7:wait(2.6)
            return v_u_4.Complete
        end)
        return p_u_6.task:step()
    end,
    ["calculate_modifiers"] = function(_, p8, _)
        return p8.modifiers or {}, {
            ["eyes_id"] = v_u_2.Lower,
            ["effects"] = v_u_2.Lower
        }
    end
}