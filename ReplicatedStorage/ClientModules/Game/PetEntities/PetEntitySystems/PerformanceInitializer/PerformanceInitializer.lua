--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.PerformanceInitializer (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetPerformances")
local v_u_3 = v1("package:Sift")
return {
    ["optimization_run_only_for"] = "owned",
    ["step"] = function(p4, _)
        if p4.client_has_control then
            local v5 = p4.staged_performances
            local v6 = {}
            for v7, v8 in pairs(v5) do
                local v9 = v_u_2[v7]
                if not v9.validate or v9.validate(p4, v8) then
                    local v10
                    if v9.init_performance then
                        v10 = v9.init_performance(p4, v8)
                    else
                        v10 = nil
                    end
                    v6[v7] = {
                        ["state"] = v10 or {},
                        ["manager_reaction_name"] = v8._manager_reaction_name,
                        ["staged_from_traceback"] = v8._staged_from_traceback
                    }
                end
            end
            if not v_u_3.isEmpty(v6) then
                p4.active_performances = v_u_3.Dictionary.merge(p4.active_performances, v6)
            end
            p4.staged_performances = {}
        end
    end
}