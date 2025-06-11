--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.ReactionInitializer (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetReactions")
local v_u_3 = v1("StateConflictsHelper")
local v_u_4 = v1("package:Sift")
return {
    ["optimization_run_only_for"] = "owned",
    ["step"] = function(p5, _)
        if p5.client_has_control then
            local v6 = p5.staged_reactions
            for v7, v8 in pairs(v6) do
                local v9 = v_u_2.reactions[v7]
                local v10 = p5.exclusive_state
                if v_u_3.can_reaction_coexist_with_state(v9, v10) then
                    local v11
                    if v9.init_reaction then
                        v11 = v9.init_reaction(p5, v8)
                    else
                        v11 = nil
                    end
                    local v12 = v11 or {}
                    local v13 = p5.active_reactions
                    local v14 = v13[v7]
                    if v14 then
                        v14 = v13[v7].on_despawn
                    end
                    if v14 then
                        v14()
                    end
                    p5.active_reactions = v_u_4.Dictionary.merge(p5.active_reactions, {
                        [v7] = v12
                    })
                end
            end
            p5.staged_reactions = {}
        end
    end
}