--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.TestPlan (ModuleScript)

local v_u_1 = require(script.Parent.TestEnum)
local v_u_2 = require(script.Parent.Expectation)
local function v_u_37(p_u_3, p4)
    local v5 = {}
    if p4 then
        if type(p4) ~= "table" then
            error(("Bad argument #2 to newEnvironment. Expected table, got %s"):format((typeof(p4))), 2)
        end
        for v6, v7 in pairs(p4) do
            v5[v6] = v7
        end
    end
    local function v_u_13(p8, p9, p10, p11)
        local v12 = p_u_3:addChild(p8, p10, p11)
        v12.callback = p9
        if p10 == v_u_1.NodeType.Describe then
            v12:expand()
        end
        return v12
    end
    function v5.describeFOCUS(p14, p15)
        v_u_13(p14, p15, v_u_1.NodeType.Describe, v_u_1.NodeModifier.Focus)
    end
    function v5.describeSKIP(p16, p17)
        v_u_13(p16, p17, v_u_1.NodeType.Describe, v_u_1.NodeModifier.Skip)
    end
    function v5.describe(p18, p19, _)
        v_u_13(p18, p19, v_u_1.NodeType.Describe, v_u_1.NodeModifier.None)
    end
    function v5.itFOCUS(p20, p21)
        v_u_13(p20, p21, v_u_1.NodeType.It, v_u_1.NodeModifier.Focus)
    end
    function v5.itSKIP(p22, p23)
        v_u_13(p22, p23, v_u_1.NodeType.It, v_u_1.NodeModifier.Skip)
    end
    function v5.itFIXME(p24, p25)
        local v26 = v_u_13(p24, p25, v_u_1.NodeType.It, v_u_1.NodeModifier.Skip)
        warn("FIXME: broken test", v26:getFullName())
    end
    function v5.it(p27, p28, _)
        v_u_13(p27, p28, v_u_1.NodeType.It, v_u_1.NodeModifier.None)
    end
    local v29 = {
        [v_u_1.NodeType.BeforeAll] = "beforeAll",
        [v_u_1.NodeType.AfterAll] = "afterAll",
        [v_u_1.NodeType.BeforeEach] = "beforeEach",
        [v_u_1.NodeType.AfterEach] = "afterEach"
    }
    local v_u_30 = 0
    for v_u_31, v_u_32 in pairs(v29) do
        v5[v_u_32] = function(p33)
            local v34 = v_u_30
            v_u_13(v_u_32 .. "_" .. tostring(v34), p33, v_u_31, v_u_1.NodeModifier.None)
            v_u_30 = v_u_30 + 1
        end
    end
    function v5.FIXME(p35)
        warn("FIXME: broken test", p_u_3:getFullName(), p35 or "")
        p_u_3.modifier = v_u_1.NodeModifier.Skip
    end
    function v5.FOCUS()
        p_u_3.modifier = v_u_1.NodeModifier.Focus
    end
    function v5.SKIP()
        p_u_3.modifier = v_u_1.NodeModifier.Skip
    end
    function v5.HACK_NO_XPCALL()
        warn("HACK_NO_XPCALL is deprecated. It is now safe to yield in an xpcall, so this is no longer necessary. It can be safely deleted.")
    end
    v5.fit = v5.itFOCUS
    v5.xit = v5.itSKIP
    v5.fdescribe = v5.describeFOCUS
    v5.xdescribe = v5.describeSKIP
    local v36 = {
        ["__call"] = function(_, ...)
            return v_u_2.new(...)
        end
    }
    v5.expect = setmetatable({
        ["extend"] = function(...)
            error("Cannot call \"expect.extend\" from within a \"describe\" node.")
        end
    }, v36)
    return v5
end
local v_u_38 = {}
v_u_38.__index = v_u_38
function v_u_38.new(p39, p40, p41, p42)
    local v43 = {
        ["plan"] = p39,
        ["phrase"] = p40,
        ["type"] = p41,
        ["modifier"] = p42 or v_u_1.NodeModifier.None,
        ["children"] = {},
        ["callback"] = nil,
        ["parent"] = nil
    }
    v43.environment = v_u_37(v43, p39.extraEnvironment)
    local v44 = v_u_38
    return setmetatable(v43, v44)
end
local function v_u_48(p45, p46, p47)
    if p46 and (p47 == nil or p47 == v_u_1.NodeModifier.None) then
        if p45:match(p46) then
            return v_u_1.NodeModifier.Focus
        else
            return v_u_1.NodeModifier.Skip
        end
    else
        return p47
    end
end
function v_u_38.addChild(p49, p50, p51, p52)
    if p51 == v_u_1.NodeType.It then
        for _, v53 in pairs(p49.children) do
            if v53.phrase == p50 then
                error("Duplicate it block found: " .. v53:getFullName())
            end
        end
    end
    local v54 = v_u_48(p49:getFullName() .. " " .. p50, p49.plan.testNamePattern, p52)
    local v55 = v_u_38.new(p49.plan, p50, p51, v54)
    v55.parent = p49
    local v56 = p49.children
    table.insert(v56, v55)
    return v55
end
function v_u_38.getFullName(p57)
    local v58 = p57.parent and p57.parent:getFullName()
    if v58 then
        return v58 .. " " .. p57.phrase
    else
        return p57.phrase
    end
end
function v_u_38.expand(p59)
    local v60 = getfenv(p59.callback)
    local v61 = setmetatable({}, {
        ["__index"] = v60
    })
    for v62, v63 in pairs(p59.environment) do
        v61[v62] = v63
    end
    v61.script = v60.script
    setfenv(p59.callback, v61)
    local v65, v66 = xpcall(p59.callback, function(p64)
        return debug.traceback(tostring(p64), 2)
    end)
    if not v65 then
        p59.loadError = v66
    end
end
local v_u_67 = {}
v_u_67.__index = v_u_67
function v_u_67.new(p68, p69)
    local v70 = v_u_67
    return setmetatable({
        ["children"] = {},
        ["testNamePattern"] = p68,
        ["extraEnvironment"] = p69
    }, v70)
end
function v_u_67.addChild(p71, p72, p73, p74)
    local v75 = v_u_48(p72, p71.testNamePattern, p74)
    local v76 = v_u_38.new(p71, p72, p73, v75)
    local v77 = p71.children
    table.insert(v77, v76)
    return v76
end
function v_u_67.addRoot(p78, p79, p80)
    for v81 = #p79, 1, -1 do
        local v82 = nil
        for _, v83 in ipairs(p78.children) do
            if v83.phrase == p79[v81] then
                v82 = v83
                break
            end
        end
        if v82 == nil then
            p78 = p78:addChild(p79[v81], v_u_1.NodeType.Describe)
        else
            p78 = v82
        end
    end
    p78.callback = p80
    p78:expand()
end
function v_u_67.visitAllNodes(p84, p85, p86, p87)
    local v88 = p87 or 0
    for _, v89 in ipairs((p86 or p84).children) do
        p85(v89, v88)
        p84:visitAllNodes(p85, v89, v88 + 1)
    end
end
function v_u_67.visualize(p90)
    local v_u_91 = {}
    p90:visitAllNodes(function(p92, p93)
        local v94 = v_u_91
        local v95 = (" "):rep(3 * p93) .. p92.phrase
        table.insert(v94, v95)
    end)
    return table.concat(v_u_91, "\n")
end
function v_u_67.findNodes(p96, p_u_97)
    local v_u_98 = {}
    p96:visitAllNodes(function(p99)
        if p_u_97(p99) then
            local v100 = v_u_98
            table.insert(v100, p99)
        end
    end)
    return v_u_98
end
return v_u_67