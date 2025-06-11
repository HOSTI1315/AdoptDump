--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.DirtyPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ModifierPriority")
local v_u_3 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, _)
        local v4 = {
            ["modifiers"] = {
                ["eyes_id"] = "drowsy_eyes",
                ["effects"] = { "stinky" }
            },
            ["priorities"] = {
                ["eyes_id"] = v_u_2.Lower
            }
        }
        return v4
    end,
    ["step"] = function(p5, _, _)
        if not p5.ailments.dirty then
            return v_u_3.Complete
        end
    end,
    ["calculate_modifiers"] = function(_, p6)
        return p6.modifiers or {}, p6.priorities or {}
    end
}