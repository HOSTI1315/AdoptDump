--// ReplicatedStorage.SharedPackages._Index.upliftgames_ab@0.3.4.ab (ModuleScript)

local v_u_1 = require(script.Parent.t)
local v2 = v_u_1.interface
local v3 = {
    ["name"] = v_u_1.string,
    ["logName"] = v_u_1.optional(v_u_1.string),
    ["seed"] = v_u_1.optional(v_u_1.string),
    ["tags"] = v_u_1.optional(v_u_1.array(v_u_1.string)),
    ["groups"] = v_u_1.array(v_u_1.union(v_u_1.interface({
        ["name"] = v_u_1.string,
        ["weight"] = v_u_1.union(v_u_1.numberMin(0), v_u_1.numberMaxExclusive((1 / 0)))
    }), v_u_1.string)),
    ["override"] = v_u_1.optional(v_u_1.callback)
}
local v_u_4 = v2(v3)
local v_u_5 = {
    ["_tests"] = {}
}
local v_u_6 = nil
local function v_u_9(p7)
    if type(p7) == "table" then
        table.freeze(p7)
        for _, v8 in p7 do
            v_u_9(v8)
        end
    end
    return p7
end
local function v_u_14(p10)
    local v11 = 0
    for _, v12 in string.split(p10, "") do
        local v13 = string.byte(v12)
        v11 = bit32.lshift(v11, 5) - v11 + v13
    end
    return math.abs(v11)
end
local function v_u_24(p15)
    local v16 = {}
    local v17 = 0
    for _, v18 in p15 do
        if typeof(v18) == "string" then
            table.insert(v16, {
                ["name"] = v18,
                ["weight"] = 1
            })
            v17 = v17 + 1
        else
            local v19
            if v18.subgroups then
                v19 = v_u_24(v18.subgroups)
            else
                v19 = nil
            end
            local v20 = {
                ["name"] = v18.name,
                ["weight"] = v18.weight or 1,
                ["subgroups"] = v19
            }
            table.insert(v16, v20)
            v17 = v17 + v18.weight
        end
    end
    for _, v21 in v16 do
        v21.normalizedWeight = v17 == 0 and 0 or v21.weight / v17
    end
    table.sort(v16, function(p22, p23)
        return p22.name < p23.name
    end)
    return v16
end
local function v_u_29(p25)
    local v26 = {}
    for _, v27 in p25 do
        if v27.normalizedWeight ~= 0 then
            local v28 = v27.name
            table.insert(v26, v28)
        end
    end
    return table.concat(v26)
end
local function v_u_40(p30, p31, p32)
    local v33 = v_u_14
    local v34 = p30.UserId
    local v35 = v33(tostring(v34) .. p31 .. v_u_29(p32))
    local v36 = Random.new(v35):NextNumber()
    local v37 = 0
    for _, v38 in p32 do
        if v38.normalizedWeight ~= 0 then
            local v39 = v37 + v38.normalizedWeight
            if v37 <= v36 and v36 < v39 then
                return v38
            end
            v37 = v39
        end
    end
    return p32[#p32]
end
function v_u_5.registerTest(p41, p42)
    local v43 = v_u_4
    assert(v43(p41))
    local v44 = v_u_24(p41.groups)
    if v_u_5._tests[p41.name] and not p42 then
        error(("Test " .. p41.name .. " already exists.") .. " If you intent to overwrite the existing test, set overwrite to true.")
    end
    local v45 = not p41.tags and {} or table.clone(p41.tags)
    local v46 = {}
    for _, v47 in v45 do
        v46[v47] = true
    end
    local v48 = v_u_5._tests
    local v49 = p41.name
    local v50 = {
        ["name"] = p41.name,
        ["logName"] = p41.logName or p41.name,
        ["seed"] = p41.seed or p41.name,
        ["tags"] = v45,
        ["tagsSet"] = v46,
        ["groups"] = v44,
        ["override"] = p41.override
    }
    if type(v50) == "table" then
        table.freeze(v50)
        for _, v51 in v50 do
            v_u_9(v51)
        end
    end
    v48[v49] = v50
end
function v_u_5.registerTests(p52, p53)
    local v54 = v_u_1.array(v_u_4)
    assert(v54(p52))
    for _, v55 in p52 do
        v_u_5.registerTest(v55, p53)
    end
end
function v_u_5.deleteTest(p56)
    v_u_5._tests[p56] = nil
end
function v_u_5.setGlobalTestOverride(p57)
    v_u_6 = p57
end
function v_u_5.getPlayerGroup(p58, p59, p60)
    local v61 = p60 ~= nil
    assert(v61, "default must be given, use getPlayerGroupOrNil if you want nil as the default")
    return v_u_5._getPlayerGroup(p58, p59) or p60
end
function v_u_5.getPlayerGroupOrNil(p62, p63)
    return v_u_5._getPlayerGroup(p62, p63)
end
function v_u_5.getPlayerGroupOrError(p64, p65)
    local v66 = v_u_5._getPlayerGroup(p64, p65)
    local v67 = v66 ~= nil
    local v68 = string.format
    assert(v67, v68("Test %* is not registered.", p65))
    return v66
end
function v_u_5._getPlayerGroup(p69, p70)
    local v71 = v_u_5.getTest(p70)
    if v71 == nil then
        return nil
    end
    local v72 = v71 ~= nil
    assert(v72, "typechecker assert")
    local v73 = v_u_6 and v_u_6(v71, p69)
    if v73 then
        return v73
    end
    local v74 = v71.override and v71.override(p69)
    if v74 then
        return v74
    end
    local v75 = v_u_40(p69, v71.seed, v71.groups)
    while v75.subgroups do
        v75 = v_u_40(p69, v71.seed, v75.subgroups)
    end
    return v75.name
end
function v_u_5.getPlayerGroups(p76, p77)
    local v78
    if p77 then
        v78 = p77.filter_tag
    else
        v78 = p77
    end
    local v79 = p77 and p77.keys_prefix or ""
    local v80 = {}
    for v81, v82 in v_u_5._tests do
        if not v78 or v82.tagsSet[v78] then
            v80[v79 .. v81] = v_u_5.getPlayerGroupOrError(p76, v81)
        end
    end
    return v80
end
function v_u_5.getTest(p83)
    return v_u_5._tests[p83]
end
function v_u_5.getTests()
    return table.clone(v_u_5._tests)
end
function v_u_5.getTestNames()
    local v84 = {}
    for v85, _ in v_u_5._tests do
        table.insert(v84, v85)
    end
    table.sort(v84)
    return v84
end
return v_u_5