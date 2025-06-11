--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntityHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetPerformanceName")
local v_u_3 = v1("PetReactionName")
local v_u_4 = v1("Raycast")
local v_u_5 = v1("StateManagerClient")
local v_u_6 = v1("package:Sift")
local v_u_7 = v1("package:Promise")
local v_u_8 = game:GetService("Workspace")
local v_u_9 = game:GetService("Players")
local v_u_10 = game:GetService("RunService")
local v_u_11 = {}
local function v_u_19(p_u_12, p_u_13, p_u_14)
    return v_u_7.new(function(p15, _, p16)
        while not p16() do
            local v17, v18 = p_u_14(p_u_12, p_u_13)
            if v17 then
                return p15(v17, v18)
            end
            v_u_10.Heartbeat:Wait()
        end
    end)
end
function v_u_11.stage_performance(p20, p21)
    local v22 = p21.name
    local v23 = p21.manager_reaction_name
    local v24 = p20 ~= nil
    assert(v24, "No pet entity provided!")
    local v25
    if typeof(p20) == "table" then
        v25 = p20.is_pet_entity
    else
        v25 = false
    end
    assert(v25, "Provided value is not a pet entity!")
    assert(v22, "Performance name missing or nil")
    local v26 = v_u_2[v22] ~= nil
    assert(v26, ("No performance exists for name \'%s\'"):format(v22))
    if p20.staged_performances[v22] then
        warn("[PetPerformanceUtility] Overriding existing performance in buffer:", v22)
    end
    local v27 = p21.options or {}
    v27._manager_reaction_name = v23
    v27._staged_from_traceback = debug.traceback(nil, 2)
    p20.staged_performances[v22] = v27
end
function v_u_11.unstage_performance(p28, p29)
    local v30 = p28 ~= nil
    assert(v30, "No pet entity provided!")
    local v31
    if typeof(p28) == "table" then
        v31 = p28.is_pet_entity
    else
        v31 = false
    end
    assert(v31, "Provided value is not a pet entity!")
    assert(p29, "Performance name missing or nil")
    p28.staged_performances[p29] = nil
end
function v_u_11.end_performance(p32, p33)
    local v34 = p32 ~= nil
    assert(v34, "No pet entity provided!")
    local v35
    if typeof(p32) == "table" then
        v35 = p32.is_pet_entity
    else
        v35 = false
    end
    assert(v35, "Provided value is not a pet entity!")
    assert(p33, "Performance name missing or nil")
    p32.active_performances = v_u_6.Dictionary.merge(p32.active_performances, {
        [p33] = v_u_6.None
    })
    p32.performances_cancelled_this_frame[p33] = true
end
function v_u_11.cancel_performance(p36, p37)
    if v_u_11.has_performance(p36, p37) then
        v_u_11.end_performance(p36, p37)
    else
        v_u_11.unstage_performance(p36, p37)
    end
end
function v_u_11.end_all_performances(p38)
    local v39 = p38 ~= nil
    assert(v39, "No pet entity provided!")
    local v40
    if typeof(p38) == "table" then
        v40 = p38.is_pet_entity
    else
        v40 = false
    end
    assert(v40, "Provided value is not a pet entity!")
    local v41 = v_u_6.Dictionary.keys(p38.active_performances)
    for _, v42 in ipairs(v41) do
        v_u_11.end_performance(p38, v42)
    end
end
function v_u_11.was_performance_ended(p43, p44)
    local v45 = p43 ~= nil
    assert(v45, "No pet entity provided!")
    local v46
    if typeof(p43) == "table" then
        v46 = p43.is_pet_entity
    else
        v46 = false
    end
    assert(v46, "Provided value is not a pet entity!")
    assert(p44, "Performance name missing or nil")
    local v47 = false
    local v48 = false
    if p43.performances_completed_this_frame[p44] then
        return true, v48
    end
    if p43.performances_cancelled_this_frame[p44] then
        v47 = true
        v48 = true
    end
    return v47, v48
end
function v_u_11.promise_performance_ended(p49, p50)
    return v_u_19(p49, p50, v_u_11.was_performance_ended)
end
function v_u_11.promise_animation_started(p_u_51, p_u_52)
    return v_u_7.new(function(p53, _, p54)
        while not p54() do
            local v55 = p_u_51.animations.current_track
            if v55 and v55.Name == p_u_52 then
                return p53(v55)
            end
            v_u_10.Heartbeat:Wait()
        end
    end)
end
function v_u_11.has_performance(p56, p57)
    local v58 = p56 ~= nil
    assert(v58, "No pet entity provided!")
    local v59
    if typeof(p56) == "table" then
        v59 = p56.is_pet_entity
    else
        v59 = false
    end
    assert(v59, "Provided value is not a pet entity!")
    assert(p57, "Performance name missing or nil")
    return p56.active_performances[p57] ~= nil
end
function v_u_11.stage_reaction(p60, p61)
    local v62 = p61.name
    local v63 = p61.options
    local v64 = p60 ~= nil
    assert(v64, "No pet entity provided!")
    local v65
    if typeof(p60) == "table" then
        v65 = p60.is_pet_entity
    else
        v65 = false
    end
    assert(v65, "Provided value is not a pet entity!")
    assert(v62, "Reaction name missing or nil")
    local v66 = v_u_3[v62] ~= nil
    local v67 = string.format
    assert(v66, v67("No reaction exists for name \'%s\'", v62))
    if p60.staged_reactions[v62] then
        warn("[PetPerformanceUtility] Overriding existing reaction in buffer:", v62)
    end
    p60.staged_reactions[v62] = v63 or {}
end
function v_u_11.end_reaction(p68, p69)
    local v70 = p68 ~= nil
    assert(v70, "No pet entity provided!")
    local v71
    if typeof(p68) == "table" then
        v71 = p68.is_pet_entity
    else
        v71 = false
    end
    assert(v71, "Provided value is not a pet entity!")
    assert(p69, "Reaction name missing or nil")
    p68.active_reactions[p69] = nil
    p68.reactions_cancelled_this_frame[p69] = true
end
function v_u_11.was_reaction_ended(p72, p73)
    local v74 = p72 ~= nil
    assert(v74, "No pet entity provided!")
    local v75
    if typeof(p72) == "table" then
        v75 = p72.is_pet_entity
    else
        v75 = false
    end
    assert(v75, "Provided value is not a pet entity!")
    assert(p73, "Reaction name missing or nil")
    local v76 = false
    local v77 = false
    if p72.reactions_completed_this_frame[p73] then
        return true, v77
    end
    if p72.reactions_cancelled_this_frame[p73] then
        v76 = true
        v77 = true
    end
    return v76, v77
end
function v_u_11.promise_reaction_ended(p78, p79)
    return v_u_19(p78, p79, v_u_11.was_reaction_ended)
end
function v_u_11.has_reaction(p80, p81)
    local v82 = p80 ~= nil
    assert(v82, "No pet entity provided!")
    local v83
    if typeof(p80) == "table" then
        v83 = p80.is_pet_entity
    else
        v83 = false
    end
    assert(v83, "Provided value is not a pet entity!")
    assert(p81, "Reaction name missing or nil")
    return p80.active_reactions[p81] ~= nil
end
local v_u_84 = {
    Vector3.new(3.5, 0, 0),
    Vector3.new(-3.5, 0, 0),
    Vector3.new(0, 0, 3.5),
    Vector3.new(0, 0, -3.5)
}
local function v_u_93(p85, p86, p87)
    local v_u_88 = p85:FindFirstChild("HumanoidRootPart")
    assert(v_u_88, "Pet must have root part!")
    local v92 = {
        ["ignore_non_cancollide"] = true,
        ["ignore_transparent"] = false,
        ["ignore_water"] = true,
        ["ignore_function"] = function(p89)
            local v90 = p89:IsDescendantOf(v_u_8)
            assert(v90, "Part is not a descendant of workspace")
            local v91 = v_u_88:IsDescendantOf(v_u_8)
            assert(v91, "Root is not a descendant of workspace")
            return not v_u_88:CanCollideWith(p89)
        end
    }
    return v_u_4.FindPartOnRay(Ray.new(p86, p87), {
        v_u_8.PetObjects,
        v_u_8.Pets,
        v_u_9.LocalPlayer.Character,
        p85
    }, nil, v92)
end
function v_u_11.get_teleport_location(p94, p95)
    for _, v96 in ipairs(v_u_84) do
        if v_u_93(p94, p95 * v96, Vector3.new(0, -5, 0)) ~= nil then
            return p95 * v96
        end
    end
    return p95 * Vector3.new(0, 2, 0)
end
function v_u_11.is_pet_mounted(p97)
    local v98 = v_u_5.get(p97)
    return v98 and (v_u_5.has_state(v98, "PetBeingRidden") or v_u_5.has_state(v98, "PetBeingFlown")) and true or false
end
return v_u_11