--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.RunTaskPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_3 = v1("SteppedTask")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p4)
        return {
            ["task_function"] = p4.task_function,
            ["modifiers"] = {},
            ["priorities"] = {}
        }
    end,
    ["step"] = function(p_u_5, p_u_6, _)
        p_u_6.task = p_u_6.task or v_u_3.new(function(p7)
            p_u_6.task_function(p7, p_u_5, p_u_6)
            return v_u_2.Complete
        end)
        return p_u_6.task:step()
    end,
    ["calculate_modifiers"] = function(_, p8, _)
        return p8.modifiers, p8.priorities
    end
}