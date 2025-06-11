--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.Expectation (ModuleScript)

local v_u_1 = {}
local v_u_2 = {
    ["to"] = true,
    ["be"] = true,
    ["been"] = true,
    ["have"] = true,
    ["was"] = true,
    ["at"] = true
}
local v_u_3 = {
    ["never"] = true
}
function v_u_1.new(p4)
    local v_u_5 = {
        ["value"] = p4,
        ["successCondition"] = true,
        ["condition"] = false,
        ["matchers"] = {},
        ["_boundMatchers"] = {}
    }
    local v6 = v_u_1
    setmetatable(v_u_5, v6)
    local v_u_7 = v_u_5.a
    function v_u_5.a(p8, ...)
        if p8 == v_u_5 then
            return v_u_7(v_u_5, ...)
        else
            return v_u_7(v_u_5, p8, ...)
        end
    end
    v_u_5.an = v_u_5.a
    local v_u_9 = v_u_5.ok
    function v_u_5.ok(p10, ...)
        if p10 == v_u_5 then
            return v_u_9(v_u_5, ...)
        else
            return v_u_9(v_u_5, p10, ...)
        end
    end
    local v_u_11 = v_u_5.equal
    function v_u_5.equal(p12, ...)
        if p12 == v_u_5 then
            return v_u_11(v_u_5, ...)
        else
            return v_u_11(v_u_5, p12, ...)
        end
    end
    local v_u_13 = v_u_5.throw
    function v_u_5.throw(p14, ...)
        if p14 == v_u_5 then
            return v_u_13(v_u_5, ...)
        else
            return v_u_13(v_u_5, p14, ...)
        end
    end
    local v_u_15 = v_u_5.near
    function v_u_5.near(p16, ...)
        if p16 == v_u_5 then
            return v_u_15(v_u_5, ...)
        else
            return v_u_15(v_u_5, p16, ...)
        end
    end
    return v_u_5
end
function v_u_1.checkMatcherNameCollisions(p17)
    return not (v_u_2[p17] or (v_u_3[p17] or v_u_1[p17]))
end
function v_u_1.extend(p_u_18, p19)
    p_u_18.matchers = p19 or {}
    for v20, v_u_21 in pairs(p_u_18.matchers) do
        local function v_u_26(_, ...)
            local v22 = v_u_21(p_u_18.value, ...)
            local v23 = v22.pass == p_u_18.successCondition
            local v24 = v22.message or "Assertion failed!"
            local v25 = 3 or 1
            if not v23 then
                error(v24, v25 + 1)
            end
            p_u_18:_resetModifiers()
            return p_u_18
        end
        p_u_18._boundMatchers[v20] = function(p27, ...)
            if p27 == p_u_18 then
                return v_u_26(p_u_18, ...)
            else
                return v_u_26(p_u_18, p27, ...)
            end
        end
    end
    return p_u_18
end
function v_u_1.__index(p28, p29)
    if v_u_2[p29] then
        return p28
    elseif v_u_3[p29] then
        local v30 = v_u_1.new(p28.value):extend(p28.matchers)
        v30.successCondition = not p28.successCondition
        return v30
    elseif p28._boundMatchers[p29] then
        return p28._boundMatchers[p29]
    else
        return v_u_1[p29]
    end
end
function v_u_1._resetModifiers(p31)
    p31.successCondition = true
end
function v_u_1.a(p32, p33)
    local v34 = p32.value
    local v35 = type(v34) == p33 == p32.successCondition
    local v36 = p32.successCondition
    local v37 = p32.value
    local v38 = tostring(v37)
    local v39 = p32.value
    local v40 = ("Expected value of type %q, got value %q of type %s"):format(p33, v38, (type(v39)))
    local v41 = p32.value
    local v42 = tostring(v41)
    local v43 = p32.value
    local v44 = ("Expected value not of type %q, got value %q of type %s"):format(p33, v42, (type(v43)))
    if v36 then
        v44 = v40
    end
    local v45 = v44 or "Assertion failed!"
    local v46 = 3 or 1
    if not v35 then
        error(v45, v46 + 1)
    end
    p32:_resetModifiers()
    return p32
end
v_u_1.an = v_u_1.a
function v_u_1.ok(p47)
    local v48 = p47.value ~= nil == p47.successCondition
    local v49 = p47.successCondition
    local v50 = p47.value
    local v51 = ("Expected value %q to be non-nil"):format((tostring(v50)))
    local v52 = p47.value
    local v53 = ("Expected value %q to be nil"):format((tostring(v52)))
    if v49 then
        v53 = v51
    end
    local v54 = v53 or "Assertion failed!"
    local v55 = 3 or 1
    if not v48 then
        error(v54, v55 + 1)
    end
    p47:_resetModifiers()
    return p47
end
function v_u_1.equal(p56, p57)
    local v58 = p56.value == p57 == p56.successCondition
    local v59 = p56.successCondition
    local v60 = tostring(p57)
    local v61 = type(p57)
    local v62 = p56.value
    local v63 = tostring(v62)
    local v64 = p56.value
    local v65 = ("Expected value %q (%s), got %q (%s) instead"):format(v60, v61, v63, (type(v64)))
    local v66 = ("Expected anything but value %q (%s)"):format(tostring(p57), (type(p57)))
    if v59 then
        v66 = v65
    end
    local v67 = v66 or "Assertion failed!"
    local v68 = 3 or 1
    if not v58 then
        error(v67, v68 + 1)
    end
    p56:_resetModifiers()
    return p56
end
function v_u_1.near(p69, p70, p71)
    local v72 = p69.value
    local v73 = type(v72) == "number"
    assert(v73, "Expectation value must be a number to use \'near\'")
    local v74 = type(p70) == "number"
    assert(v74, "otherValue must be a number")
    local v75 = type(p71) == "number" and true or p71 == nil
    assert(v75, "limit must be a number or nil")
    local v76 = p71 or 1e-7
    local v77 = p69.value - p70
    local v78 = math.abs(v77) <= v76 == p69.successCondition
    local v79 = p69.successCondition
    local v80 = ("Expected value to be near %f (within %f) but got %f instead"):format(p70, v76, p69.value)
    local v81 = ("Expected value to not be near %f (within %f) but got %f instead"):format(p70, v76, p69.value)
    if v79 then
        v81 = v80
    end
    local v82 = v81 or "Assertion failed!"
    local v83 = 3 or 1
    if not v78 then
        error(v82, v83 + 1)
    end
    p69:_resetModifiers()
    return p69
end
function v_u_1.throw(p84, p85)
    local v86, v87 = pcall(p84.value)
    local v88 = v86 ~= p84.successCondition
    if p85 and not v86 then
        if p84.successCondition then
            v88 = v87:find(p85, 1, true) ~= nil
        else
            v88 = v87:find(p85, 1, true) == nil
        end
    end
    local v89
    if p85 then
        local v90 = p84.successCondition
        v89 = ("Expected function to throw an error containing %q, but it %s"):format(p85, v87 and (("threw: %s"):format(v87) or "did not throw.") or "did not throw.")
        local v91 = ("Expected function to never throw an error containing %q, but it threw: %s"):format(p85, (tostring(v87)))
        if not v90 then
            v89 = v91
        end
    else
        v89 = p84.successCondition and "Expected function to throw an error, but it did not throw." or ("Expected function to succeed, but it threw an error: %s"):format((tostring(v87)))
    end
    local v92 = v89 or "Assertion failed!"
    local v93 = 3 or 1
    if not v88 then
        error(v92, v93 + 1)
    end
    p84:_resetModifiers()
    return p84
end
return v_u_1