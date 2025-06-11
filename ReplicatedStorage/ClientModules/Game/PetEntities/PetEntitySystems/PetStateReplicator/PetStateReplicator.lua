--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.PetStateReplicator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("RouterClient")
local v_u_3 = v1("TableUtil")
local v4 = {}
local v_u_5 = v2.get("PetAPI/ReplicateActiveReactions")
local v_u_6 = v2.get("PetAPI/ReplicateActivePerformances")
local v_u_7 = v2.get("PetAPI/ReplicatePerformanceModifiers")
local v_u_8 = {
    ["trick_name"] = true,
    ["dont_allow_sit_states"] = true,
    ["dont_allow_mount_states"] = true,
    ["dont_allow_remote_interaction"] = true,
    ["eyes_id"] = true,
    ["eye_color"] = true,
    ["effects"] = true,
    ["accessory_ids"] = true,
    ["anim_name"] = true,
    ["sitting_cancels_server_anim"] = true,
    ["anim_fade_time"] = true,
    ["hold_anim_speed"] = true,
    ["idle_anim_speed"] = true,
    ["pause_ailment_chat_bubbles"] = true,
    ["local_anim_name"] = true,
    ["local_anim_speed"] = true,
    ["animation_priority_override"] = true,
    ["current_form"] = true
}
local function v_u_13(p9, p10)
    if p9 == p10 then
        return true
    end
    for v11, _ in pairs(v_u_8) do
        if p9[v11] or p10[v11] then
            local v12 = p9[v11]
            if type(v12) == "table" then
                if not v_u_3.shallow_equal(p9[v11], p10[v11]) then
                    return false
                end
            elseif p9[v11] ~= p10[v11] then
                return false
            end
        end
    end
    return true
end
function v4.step(p14)
    if p14.is_npc_pet or not p14.client_has_control then
        return
    end
    if p14.active_reactions ~= p14.last_active_reactions then
        local v15 = {}
        local v16 = false
        for v17, _ in pairs(p14.active_reactions) do
            v15[v17] = true
            if not p14.last_active_reactions[v17] then
                v16 = true
            end
        end
        for v18, _ in pairs(p14.last_active_reactions) do
            if not p14.active_reactions[v18] then
                v16 = true
                break
            end
        end
        if v16 then
            v_u_5:FireServer(p14.base.char, v15)
        end
        p14.last_active_reactions = p14.active_reactions
    end
    if p14.active_performances ~= p14.last_active_performances then
        local v19 = {}
        for v20, _ in pairs(p14.active_performances) do
            v19[v20] = true
        end
        v_u_6:FireServer(p14.base.char, v19)
        p14.last_active_performances = p14.active_performances
    end
    if p14.client_has_control then
        local v21 = p14.modifier_values_from_performances
        local v22 = {}
        for v23, v24 in pairs(v21) do
            if v_u_8[v23] then
                v22[v23] = v24
            end
        end
        local v25 = p14.last_modifier_values_from_performances
        local v26 = {}
        for v27, v28 in pairs(v25) do
            if v_u_8[v27] then
                v26[v27] = v28
            end
        end
        if not v_u_13(v26, v22) then
            v_u_7:FireServer(p14.base.char, v22)
        end
    end
end
return v4