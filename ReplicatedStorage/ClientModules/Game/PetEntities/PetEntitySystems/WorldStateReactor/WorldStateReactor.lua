--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.WorldStateReactor (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetWorldState")
local v_u_3 = v1("InterestScore")
local v_u_4 = v1("PetEntityHelper")
local v_u_5 = v1("PetReactions")
local v_u_6 = v1("StateConflictsHelper")
local v_u_7 = v1("TopScoreFinder")
local v8 = {}
local v_u_9 = v_u_3.Effect - 1
local function v_u_14(p10)
    local v11 = p10.world_state_reactor.active_reaction
    if not v11 then
        return v_u_9
    end
    local v12 = p10.active_reactions[v11.name]
    if v12 then
        local v13 = v11.calculate_threshold(p10, v12)
        if v13 ~= v_u_3.NeverInterested then
            return v13
        end
        warn(string.format("Reaction %s returned NeverInterested for calculate_threshold. Using BASE_THRESHOLD instead. This should never happen. This is not the correct way to end a reaction. To end a reaction, return ReactionExitType.Cancel from step_reaction.", v11.name))
        return v_u_9
    end
end
v8.optimization_run_only_for = "owned"
function v8.step(p_u_15)
    if p_u_15.client_has_control and not p_u_15.is_npc_pet then
        local v16 = p_u_15.world_state_reactor
        local v17 = v_u_2.get_world_state(p_u_15)
        local v_u_18 = {}
        local v_u_19 = v16.active_reaction
        v_u_19 = v_u_19
        local v20
        if v_u_19 then
            v20 = p_u_15.active_reactions[v_u_19.name]
        end
        if v_u_19 and not v20 then
            v16.active_reaction = nil
            v20 = nil
            v_u_19 = nil
        end
        local v21 = v_u_14(p_u_15)
        local v_u_22 = v_u_7.new(v21)
        local function v29(p23, p24)
            local v25 = p_u_15
            local v26 = v_u_18
            local v27
            if v26[p23.name] then
                v27 = v26[p23.name]
            elseif p23.validate_pet then
                if v_u_6.can_reaction_coexist_with_state(p23, v25.exclusive_state) then
                    v27 = p23.validate_pet(v25)
                    v26[p23.name] = v27
                else
                    v27 = false
                end
            else
                v27 = true
            end
            if v27 then
                local v28 = v_u_19
                if v28 then
                    v28 = v_u_19.name == p23.name
                end
                if not v28 or v_u_19.can_reinitialize then
                    v_u_22:replace_if_better(p23.calculate_score(p_u_15, p24), p23, p24)
                end
            else
                return
            end
        end
        for _, v30 in ipairs(v16.pending_ailment_reactions) do
            debug.profilebegin((("PetEntities_WorldState_ConsiderReaction %*"):format(v30.name)))
            v29(v30, nil)
            debug.profileend()
        end
        for v31, v32 in pairs(v17) do
            local v33 = v_u_5.by_stimulus[v31]
            for v35, v35 in v32 do
                local _ = v35 == true
                for _, v36 in ipairs(v33) do
                    debug.profilebegin((("PetEntities_WorldState_ConsiderReaction %*"):format(v36.name)))
                    v29(v36, v35)
                    debug.profileend()
                end
            end
        end
        local v37, v38, v39 = v_u_22:unpack()
        if v38 then
            if v_u_19 then
                v_u_4.end_reaction(p_u_15, v_u_19.name)
                if v_u_19 == v38 then
                    return
                end
                if v20.on_despawn then
                    v20.on_despawn()
                end
            end
            local v40 = v38.name
            local v41 = {
                ["name"] = v40,
                ["options"] = {
                    ["stimulus"] = v39,
                    ["score"] = v37
                }
            }
            v_u_4.stage_reaction(p_u_15, v41)
            v16.active_reaction = v38
        end
    end
end
function v8.cleanup(p42)
    local v43 = p42.active_reactions
    if v43 then
        for _, v44 in v43 do
            local v45 = v44.on_despawn
            if v45 then
                v45()
            end
        end
    end
end
return v8