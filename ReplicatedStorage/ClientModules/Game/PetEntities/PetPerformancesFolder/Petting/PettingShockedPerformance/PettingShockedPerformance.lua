--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Petting.PettingShockedPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_3 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_4 = v1("SteppedTask")
return {
    ["name"] = script.Name,
    ["allowed_exclusive_states"] = { v2.Focused },
    ["init_performance"] = function(_, _)
        local v5 = {
            ["modifiers"] = {
                ["effects"] = { "shock" },
                ["eyes_id"] = "wide_open_eyes",
                ["pause_ailment_chat_bubbles"] = true
            },
            ["priorities"] = {}
        }
        return v5
    end,
    ["step"] = function(p_u_6, p7)
        p7.task = p7.task or v_u_4.new(function(p8)
            p_u_6.sounds.play_sound("Shock")
            p8:wait(1)
            return v_u_3.Complete
        end)
        if p7.task then
            return p7.task:step()
        end
    end,
    ["calculate_modifiers"] = function(_, p9)
        return p9.modifiers, p9.priorities
    end
}