--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.ReactionStepper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_3 = v1("package:Sift")
local v_u_4 = v1("PetReactions")
local v_u_5 = v1("StateConflictsHelper")
return {
    ["optimization_prioritize"] = "owned",
    ["step"] = function(p6, p7)
        if p6.client_has_control then
            p6.reactions_cancelled_this_frame = {}
            p6.reactions_completed_this_frame = {}
            local v8 = p6.active_reactions
            for v9, v10 in pairs(v8) do
                debug.profilebegin((("PetEntities_Reaction %*"):format(v9)))
                local v11 = v_u_4.reactions[v9]
                if v_u_5.can_reaction_coexist_with_state(v11, p6.exclusive_state) then
                    debug.profilebegin("PetEntities_Reaction_Step")
                    local v12 = v11.step(p6, v10, p7)
                    debug.profileend()
                    debug.profilebegin("PetEntities_Reaction_Merge")
                    if v12 == v_u_2.Complete or v12 == v_u_2.Cancel then
                        if v12 == v_u_2.Complete then
                            p6.reactions_completed_this_frame[v9] = true
                        else
                            p6.reactions_cancelled_this_frame[v9] = true
                        end
                        p6.active_reactions = v_u_3.Dictionary.merge(p6.active_reactions, {
                            [v9] = v_u_3.None
                        })
                    end
                    debug.profileend()
                    debug.profileend()
                else
                    p6.reactions_cancelled_this_frame[v9] = true
                    p6.active_reactions = v_u_3.Dictionary.merge(p6.active_reactions, {
                        [v9] = v_u_3.None
                    })
                    debug.profileend()
                end
            end
        elseif next(p6.active_reactions) == nil then
            p6.active_reactions = {}
        end
    end
}