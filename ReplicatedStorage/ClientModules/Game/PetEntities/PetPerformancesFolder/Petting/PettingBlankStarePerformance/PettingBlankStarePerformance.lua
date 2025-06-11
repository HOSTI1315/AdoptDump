--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Petting.PettingBlankStarePerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_3 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_4 = v1("ModifierPriority")
local v_u_5 = v1("SteppedTask")
return {
    ["name"] = script.Name,
    ["allowed_exclusive_states"] = { v2.Focused },
    ["init_performance"] = function(_, _)
        local v6 = {
            ["modifiers"] = {
                ["effects"] = { "woozy", "emit_sweatdrop" },
                ["local_anim_speed"] = 0.25,
                ["eyes_id"] = "wat_eyes",
                ["pause_ailment_chat_bubbles"] = true
            },
            ["priorities"] = {
                ["local_anim_speed"] = v_u_4.Highest
            }
        }
        return v6
    end,
    ["step"] = function(p_u_7, p8)
        p8.task = p8.task or v_u_5.new(function(p9)
            p_u_7.sounds.play_sound("DispleasedSweatdrop")
            p9:wait(2)
            return v_u_3.Complete
        end)
        if p8.task then
            return p8.task:step()
        end
    end,
    ["calculate_modifiers"] = function(_, p10)
        return p10.modifiers, p10.priorities
    end
}