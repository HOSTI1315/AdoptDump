--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.PetChargeReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_3 = v1("PetPerformanceName")
local v_u_4 = v1("SteppedTaskUtils")
local v_u_5 = v1("InterestScore")
local v_u_6 = v1("SteppedTask")
local v_u_7 = v1("Utilities")
local v_u_18 = {
    ["name"] = script.Name,
    ["calculate_threshold"] = function(_, _)
        return v_u_5.HighestInterest
    end,
    ["init_reaction"] = function(_, p8)
        return {
            ["enemy_model"] = p8.enemy_model,
            ["walkspeed"] = p8.walkspeed,
            ["skip_notice_object"] = p8.skip_notice_object or false,
            ["score"] = p8.score
        }
    end,
    ["step"] = function(p_u_9, p_u_10)
        if not v_u_7.does_exist(p_u_10.enemy_model) then
            return v_u_2.Cancel
        end
        p_u_10.task = p_u_10.task or v_u_6.new(function(p11)
            if not p_u_10.skip_notice_object then
                local v12 = v_u_4.run_performance
                local v13 = p_u_9
                local v14 = {
                    ["name"] = v_u_3.NoticeObject,
                    ["manager_reaction_name"] = v_u_18.name,
                    ["options"] = {
                        ["object"] = p_u_10.enemy_model,
                        ["eyes_on_notice"] = "wide_open_eyes",
                        ["effects_on_notice"] = { "surprised" },
                        ["acknowledgement_time"] = 0.6
                    }
                }
                v12(p11, v13, v14)
            end
            local v15 = v_u_4.run_performance
            local v16 = p_u_9
            local v17 = {
                ["name"] = v_u_3.PetCharge,
                ["manager_reaction_name"] = v_u_18.name,
                ["options"] = {
                    ["enemy_model"] = p_u_10.enemy_model,
                    ["walkspeed"] = p_u_10.walkspeed
                }
            }
            v15(p11, v16, v17)
            return v_u_2.Complete
        end)
        return p_u_10.task:step()
    end
}
return v_u_18