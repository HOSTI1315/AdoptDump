--// ReplicatedStorage.SharedModules.ABTests.CloudABTests (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("new:ConcurrentABTestHandler")
local v_u_3 = v1("package:AB")
local v_u_4 = v1("package:Sift")
v1("new:ABTests")
local v_u_5 = game:GetService("LocalizationService")
local v6 = {}
local function v_u_14(p7)
    local v8 = {}
    for v9, v10 in p7 do
        local v11 = {
            ["name"] = v9
        }
        if typeof(v10) == "table" then
            v11.weight = v10.weight
            v11.subgroups = v_u_14(v10.subgroups)
        else
            v11.weight = v10
        end
        table.insert(v8, v11)
    end
    table.sort(v8, function(p12, p13)
        return p12.name < p13.name
    end)
    return v8
end
local function v_u_16(p15, ...)
    if p15 then
        return p15(...)
    else
        return nil
    end
end
local function v_u_27(p17, p_u_18, p19)
    local v_u_20 = p19[p17] or {}
    local v21 = table.clone(p_u_18)
    v21.name = p17
    v21.logName = p_u_18.log_name or p17
    v21.seed = p_u_18.seed or p17
    v21.groups = v_u_14(p_u_18.groups)
    function v21.override(p22)
        local v23 = v_u_16(v_u_20.override_everyone, p22, p_u_18)
        if not v23 then
            local v24 = p_u_18
            local v25
            if v24.participating_country_codes then
                local v26 = typeof(p22) ~= "Instance" and "en-us" or v_u_5:GetCountryRegionForPlayerAsync(p22)
                v25 = table.find(v24.participating_country_codes, v26) == nil and "nonparticipating" or nil
            else
                v25 = nil
            end
            v23 = v25 or v_u_16(v_u_20.override_participating, p22, p_u_18) or nil
        end
        return v23
    end
    v_u_3.registerTest(v21, true)
end
local function v_u_36(p28, p29)
    if not next(p29.tests) then
        return p28
    end
    local v_u_30 = p29.weights
    local v31 = p29.tests
    v_u_30 = v_u_4.Dictionary.join(v_u_30, v_u_4.Dictionary.map(v31, function(_, p32)
        return v_u_30[p32] or 0
    end))
    local v33 = v_u_4.Dictionary.join
    local v34 = {}
    local v35 = {
        ["groups"] = v_u_30
    }
    v34[v_u_2.key] = v35
    return v33(p28, v34, v31)
end
function v6.reconcile_tests(p37)
    local v38 = p37.new_tests
    local v39 = p37.new_concurrent_tests
    local v40 = p37.old_tests
    local v41 = p37.extras
    local v42 = v_u_36(v38, v39)
    for v43, v44 in v42 do
        if not v_u_4.Dictionary.equalsDeep(v44, v40[v43]) then
            v_u_27(v43, v44, v41)
            if v41[v43] and v41[v43].on_updated then
                task.spawn(v41[v43].on_updated)
            end
        end
    end
    for v45, _ in v40 do
        if v42[v45] == nil then
            v_u_3.deleteTest(v45)
        end
    end
    return v42
end
return v6