--// ReplicatedStorage.new.modules.Ailments.AilmentsClient (ModuleScript)

require(script.Parent.AilmentTypes)
local v_u_1 = require(script.Parent.ClientAilment)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_3 = require(script.Parent.Parent.LegacyLoad)
local v_u_4 = v_u_3("ClientData")
local v_u_5 = v_u_3("FamilyHelper")
local v6 = v_u_3("Signal")
local v_u_7 = {}
local v_u_8 = v6.new()
local v_u_9 = v6.new()
local v_u_10 = v6.new()
local v_u_11 = v6.new()
local v_u_12 = v6.new()
local v_u_13 = v6.new()
local v_u_14 = {}
local v_u_15 = false
local function v_u_22(p16)
    local v17 = p16 or game.Players.LocalPlayer
    local v18 = v_u_4.get_server(v17, "ailments_manager") or {}
    local v19 = v18.ailments or {}
    local v20
    if v18.baby_ailments and next(v18.baby_ailments) then
        v20 = {}
        local v21 = v17.UserId
        v20[tostring(v21)] = v18.baby_ailments
    else
        v20 = nil
    end
    return v_u_2.Dictionary.join(v19, v20)
end
function v_u_7.get_ailments_for_pet_item_serialized(p23, p24)
    return v_u_22(p24)[p23] or {}
end
function v_u_7.get_ailments_for_pet_serialized(p25)
    local v26
    if p25.is_pet then
        v26 = p25.pet_unique
    else
        local v27 = p25.player.UserId
        v26 = tostring(v27)
    end
    return v_u_7.get_ailments_for_pet_item_serialized(v26, p25.player)
end
function v_u_7.get_ailments_for_pet(p_u_28)
    local v29
    if p_u_28.is_pet then
        v29 = p_u_28.pet_unique
    else
        local v30 = p_u_28.player.UserId
        v29 = tostring(v30)
    end
    if v_u_14[v29] then
        return v_u_14[v29]
    end
    local v31 = v_u_7.get_ailments_for_pet_serialized(p_u_28)
    local function v33(p32)
        if p_u_28.player then
            return v_u_1.new(p_u_28.player, p32, p_u_28.pet_unique)
        else
            return nil
        end
    end
    return v_u_2.Dictionary.map(v31, v33)
end
function v_u_7.has_local_ailments(p34)
    local v35
    if p34.is_pet then
        v35 = p34.pet_unique
    else
        local v36 = p34.player.UserId
        v35 = tostring(v36)
    end
    return v_u_14[v35] ~= nil
end
function v_u_7.are_ailments_hidden()
    return v_u_15 or v_u_3("MinigameForcedState").are_ailments_hidden()
end
function v_u_7.get_ailments_hidden_changed_signal()
    return v_u_12
end
function v_u_7.get_changed_signal()
    return v_u_8
end
function v_u_7.get_ailment_created_signal()
    return v_u_9
end
function v_u_7.get_early_ailment_completed_signal()
    return v_u_10
end
function v_u_7.get_ailment_completed_signal()
    return v_u_11
end
function v_u_7.get_baby_ailment_completed_signal()
    return v_u_13
end
function v_u_7.is_relevant_to_local_ailments(p37)
    return v_u_5.is_my_friend_or_family(p37)
end
local function v_u_50(p38)
    local v39 = not v_u_7.is_relevant_to_local_ailments(p38) and {} or v_u_22(p38)
    local v40 = false
    for v41, _ in v_u_14 do
        if not v39[v41] then
            local v42 = false
            for _, v43 in v_u_14[v41] do
                if v43.source_player == p38 then
                    v43:destroy()
                    v42 = true
                end
            end
            if v42 then
                v_u_14[v41] = nil
                v40 = true
            end
        end
    end
    for v44, v45 in v39 do
        if not v_u_14[v44] then
            v_u_14[v44] = {}
            v40 = true
        end
        for v46, v47 in v_u_14[v44] do
            if v45[v46] then
                if v47:should_update(v39[v44][v46]) then
                    v47:update(v39[v44][v46])
                    v40 = true
                end
            else
                v_u_14[v44][v46]:destroy()
                v_u_14[v44][v46] = nil
                v40 = true
            end
        end
        for v48, _ in v45 do
            if not v_u_14[v44][v48] then
                local v49 = v_u_1.new(p38, v45[v48], v44)
                v_u_14[v44][v48] = v49
                v_u_9:Fire(v49, v44)
                v40 = true
            end
        end
    end
    if v40 then
        v_u_8:Fire(p38)
    end
end
function v_u_7.on_ailments_changed(p51)
    v_u_50(p51)
end
function v_u_7.on_ailments_hidden_changed(p52)
    if v_u_3("new:TutorialHelper").is_new_tutorial_running() then
        p52 = false
    end
    if p52 ~= nil then
        v_u_15 = p52
    end
    v_u_12:Fire()
end
function v_u_7.on_pet_ailment_completed(p53, p54, p55)
    local v56
    if v_u_14[p53] then
        v56 = v_u_14[p53][p54] or nil
    else
        v56 = nil
    end
    if v56 then
        v_u_10:Fire(v56, p53, p55)
        v_u_11:Fire(v56, p53, p55)
    end
end
function v_u_7.on_baby_ailment_completed(p57, p58, p59)
    if p57 then
        local v60 = p57.UserId
        local v61 = tostring(v60)
        local v62 = v_u_14[v61] and v_u_14[v61][p58] or nil
        if v62 then
            v_u_13:Fire(v62, p57, p59)
        end
    end
end
return v_u_7