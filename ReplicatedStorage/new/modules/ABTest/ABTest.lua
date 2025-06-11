--// ReplicatedStorage.new.modules.ABTest (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = require(script.ConcurrentABTestHandler)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.AB)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_5 = require(script.Parent.LegacyLoad)
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.new(p_u_7)
    local v9 = v_u_4.Dictionary.map(p_u_7.groups, function(p8)
        return v_u_4.Dictionary.merge(p_u_7.default_values, p8)
    end)
    local v10 = v_u_4.Dictionary.join({
        ["control"] = p_u_7.default_values,
        ["nonparticipating"] = p_u_7.default_values
    }, v9)
    local v11 = {
        ["key"] = p_u_7.key,
        ["default_values"] = p_u_7.default_values,
        ["groups"] = v10,
        ["studio_debug_group"] = p_u_7.studio_debug_group,
        ["log_name"] = p_u_7.log_name,
        ["seed"] = p_u_7.seed
    }
    local v12 = v_u_6
    local v13 = setmetatable(v11, v12)
    if not v_u_3.getTest(v13.key) then
        v13:_register_static_test()
    end
    return v13
end
function v_u_6._register_static_test(p14)
    local v15 = {}
    for v16, _ in p14.groups do
        local v17 = {
            ["name"] = v16,
            ["weight"] = v16 == "nonparticipating" and 1 or 0
        }
        table.insert(v15, v17)
    end
    table.sort(v15, function(p18, p19)
        return p18.name < p19.name
    end)
    local v20 = {
        ["name"] = p14.key,
        ["logName"] = p14.log_name or p14.key,
        ["seed"] = p14.seed or p14.key,
        ["groups"] = v15
    }
    v_u_3.registerTest(v20, false)
end
function v_u_6._is_new_player(_, p21)
    if v_u_1:IsClient() then
        return (v_u_5("ClientData").get("time_played_since_join") or 0) == 0
    end
    local v22 = v_u_5("DataM").get_store(p21)
    return (v22 and v22:get("time_played_since_join") or 0) == 0
end
function v_u_6._was_assigned_this_session(p23, p24)
    if v_u_1:IsClient() then
        local v25 = v_u_5("ClientData").get("ab_test_manager")
        if v25 then
            return v25.assigned_this_session[p23.key] or false
        else
            return false
        end
    else
        local v26 = v_u_5("DataM").get_store(p24)
        local v27
        if v26 then
            v27 = v26:get("ab_test_manager")
        else
            v27 = nil
        end
        if v27 then
            return v27:was_assigned_this_session(p23.key)
        else
            return false
        end
    end
end
function v_u_6._get_saved_group(p28, p29)
    if v_u_1:IsClient() then
        local v30 = v_u_5("ClientData").get("ab_test_manager")
        if v30 then
            return v30.groups[p28.key]
        else
            return nil
        end
    else
        local v31 = v_u_5("DataM").get_store(p29)
        local v32
        if v31 then
            v32 = v31:get("ab_test_manager")
        else
            v32 = nil
        end
        if v32 then
            return v32:get_group(p28.key)
        else
            return nil
        end
    end
end
function v_u_6._save_group(p33, p34, p35)
    if v_u_1:IsClient() then
        local v36 = v_u_5("ClientData")
        local v37 = v36.get("ab_test_manager")
        if v37 and v37.groups[p33.key] ~= p35 then
            v36.predict("ab_test_manager", v_u_4.Dictionary.joinDeep(v37, {
                ["groups"] = {
                    [p33.key] = p35
                },
                ["assigned_this_session"] = {
                    [p33.key] = true
                }
            }))
            v_u_5("RouterClient").get("ABTestAPI/RefreshGroup"):FireServer(p33.key)
        end
    else
        local v38 = v_u_5("DataM").get_store(p34)
        local v39
        if v38 then
            v39 = v38:get("ab_test_manager")
        else
            v39 = nil
        end
        if v39 then
            v39:set_group(p33.key, p35)
        end
    end
end
function v_u_6.get_group(p40, p41)
    if not p41 then
        local v42 = v_u_1:IsClient()
        assert(v42, "ABTest.get_group needs a player if called on the server")
        p41 = game.Players.LocalPlayer
    end
    if v_u_1:IsStudio() and p40.studio_debug_group then
        return p40.studio_debug_group
    end
    local v43 = v_u_3.getTest(p40.key)
    local v44
    if v43 and (p41 and v43.tagsSet.keep_group_in_same_session) then
        if p40:_was_assigned_this_session(p41) then
            return p40:_get_saved_group(p41) or "nonparticipating"
        end
        v44 = true
    else
        v44 = false
    end
    local v45 = v_u_3.getPlayerGroupOrNil(p41, p40.key) or "nonparticipating"
    local v46 = v_u_2.get_override_group_or_nil(p40.key, p41) or v45
    if v43 and (p41 and (v43.tagsSet.new_players_only and p40:_get_saved_group(p41) ~= v46)) then
        v46 = (not p40:_is_new_player(p41) or p40:_was_assigned_this_session(p41)) and "nonparticipating" or v46
        v44 = true
    end
    if v44 then
        p40:_save_group(p41, v46)
    end
    return v46
end
function v_u_6.get_value(p47, p48, p49)
    local v50 = p47:get_group(p49)
    local v51 = p47.groups[v50] or p47.default_values
    local v52 = v51[p48] ~= nil
    local v53 = ("ABTest.get_value was called with an invalid key: %*"):format(p48)
    assert(v52, v53)
    return v51[p48]
end
return v_u_6