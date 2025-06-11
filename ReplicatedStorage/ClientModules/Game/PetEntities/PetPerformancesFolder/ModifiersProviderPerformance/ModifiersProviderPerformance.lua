--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.ModifiersProviderPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_3 = v1("package:t")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p4)
        local v5 = p4.modifiers
        assert(v5, "No modifiers provided!")
        return {
            ["modifiers"] = p4.modifiers,
            ["priorities"] = p4.priorities or {},
            ["end_timestamp"] = p4.duration and os.clock() + p4.duration or nil
        }
    end,
    ["step"] = function(_, p6)
        if p6.end_timestamp and os.clock() > p6.end_timestamp then
            return v_u_2.Complete
        end
    end,
    ["calculate_modifiers"] = function(_, p7)
        local v8
        if v_u_3.callback(p7.modifiers) then
            v8 = p7.modifiers()
        else
            v8 = p7.modifiers
        end
        if v_u_3.callback(p7.priorities) then
            return v8, p7.priorities()
        else
            return v8, p7.priorities
        end
    end
}