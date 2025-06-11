--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.AilmentReactor (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetEntityHelper")
local v3 = v1("PetPerformanceName")
local v_u_4 = v1("PetReactions")
local v5 = {
    ["generic_water_bowl"] = true,
    ["generic_food_bowl"] = true,
    ["generic_shower"] = true,
    ["generic_toilet"] = true
}
local v_u_6 = {
    ["sleepy"] = v_u_4.reactions.SleepyAilmentReaction,
    ["dirty"] = v_u_4.reactions.DirtyAilmentReaction,
    ["bored"] = v_u_4.reactions.BoredAilmentReaction,
    ["sick"] = v_u_4.reactions.SickAilmentReaction,
    ["toilet"] = v_u_4.reactions.FireHydrantReaction
}
local v_u_7 = {
    ["sleepy"] = v5,
    ["dirty"] = nil,
    ["bored"] = v5,
    ["sick"] = nil,
    ["toilet"] = v5
}
local v_u_8 = {
    ["sleepy"] = nil,
    ["dirty"] = 6.5,
    ["bored"] = nil,
    ["sick"] = 6.5,
    ["toilet"] = nil
}
local v_u_9 = {
    ["sleepy"] = v3.FallAsleep,
    ["dirty"] = v3.Dirty,
    ["bored"] = v3.Bored,
    ["sick"] = v3.Sick,
    ["toilet"] = v3.FireHydrant
}
return {
    ["optimization_run_only_for"] = "owned",
    ["step"] = function(p10)
        if p10.client_has_control then
            local v11 = p10.ailments
            local v12 = p10.world_state_reactor
            local v13 = {}
            for v14, v15 in pairs(v11) do
                local v16 = v_u_6[v14]
                if v16 then
                    local v17 = v_u_9[v14]
                    if not (v_u_2.has_performance(p10, v17) or v_u_2.has_reaction(p10, v16.name)) then
                        local _, v18 = v_u_2.was_reaction_ended(p10, v16.name)
                        local v19 = v_u_8[v14]
                        local v20 = not v19
                        if v19 then
                            v19 = os.clock() - v15 < v19
                        end
                        if v20 or v19 and not v18 then
                            if not (v_u_7[v14] and v_u_7[v14][p10.current_furniture_use_id]) then
                                table.insert(v13, v16)
                            end
                        else
                            v_u_2.stage_performance(p10, {
                                ["name"] = v17
                            })
                        end
                    end
                end
            end
            if v_u_2.has_performance(p10, v_u_9.dirty) then
                local v21 = v_u_4.reactions.ExcitedToShowerReaction
                table.insert(v13, v21)
            end
            v12.pending_ailment_reactions = v13
        end
    end
}