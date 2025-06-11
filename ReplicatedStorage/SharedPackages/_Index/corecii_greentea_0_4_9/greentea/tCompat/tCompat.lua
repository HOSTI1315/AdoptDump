--// ReplicatedStorage.SharedPackages._Index.corecii_greentea@0.4.9.greentea.tCompat (ModuleScript)

local v_u_1 = require(script.Parent.GreenTea)
local v_u_2 = require(script.Parent.InstanceClasses)
local v3 = {}
local function v_u_5(p4)
    if v_u_1.isGtType(p4) then
        return p4
    elseif typeof(p4) == "function" then
        return v_u_1.custom(p4)
    elseif p4 == nil then
        return v_u_1.none()
    else
        return v_u_1.typeof(p4)
    end
end
local v_u_6 = {
    ["boolean"] = v_u_1.boolean,
    ["buffer"] = v_u_1.buffer,
    ["callback"] = v_u_1.anyfn,
    ["function"] = v_u_1.anyfn,
    ["none"] = v_u_1.none,
    ["nil"] = v_u_1.none
}
local v_u_7 = v_u_1.string
function v_u_6.string()
    return v_u_7()
end
local v_u_8 = v_u_1.anyTable
function v_u_6.table()
    return v_u_8()
end
local v_u_9 = v_u_1.userdata
function v_u_6.userdata()
    return v_u_9()
end
local v_u_10 = v_u_1.vector
function v_u_6.vector()
    return v_u_10()
end
local v_u_11 = v_u_1.number
function v_u_6.number()
    return v_u_11()
end
local v_u_12 = v_u_1.coroutine
function v_u_6.thread()
    return v_u_12()
end
function v_u_6.any()
    return v_u_1.any()
end
function v_u_6.nan()
    return v_u_1.withCustom(v_u_1.number({
        ["nan"] = true
    }), function(p13)
        return p13 ~= p13
    end)
end
function v_u_6.integer()
    return v_u_1.number({
        ["integer"] = true
    })
end
function v_u_6.numberPositive()
    return v_u_1.number({
        ["range"] = "(0, inf]"
    })
end
function v_u_6.numberNegative()
    return v_u_1.number({
        ["range"] = "[-inf, 0)"
    })
end
v_u_6.Enum = v_u_1.Enum
v_u_6.EnumItem = v_u_1.EnumItem
v_u_6.Axes = v_u_1.__newBasicType("Axes")
v_u_6.BrickColor = v_u_1.__newBasicType("BrickColor")
v_u_6.CatalogSearchParams = v_u_1.__newBasicType("CatalogSearchParams")
v_u_6.CFrame = v_u_1.__newBasicType("CFrame")
v_u_6.Color3 = v_u_1.__newBasicType("Color3")
v_u_6.ColorSequence = v_u_1.__newBasicType("ColorSequence")
v_u_6.ColorSequenceKeypoint = v_u_1.__newBasicType("ColorSequenceKeypoint")
v_u_6.DateTime = v_u_1.__newBasicType("DateTime")
v_u_6.DockWidgetPluginGuiInfo = v_u_1.__newBasicType("DockWidgetPluginGuiInfo")
v_u_6.Enums = v_u_1.__newBasicType("Enums")
v_u_6.Faces = v_u_1.__newBasicType("Faces")
v_u_6.FloatCurveKey = v_u_1.__newBasicType("FloatCurveKey")
v_u_6.Font = v_u_1.__newBasicType("Font")
v_u_6.Instance = v_u_1.__newBasicType("Instance")
v_u_6.NumberRange = v_u_1.__newBasicType("NumberRange")
v_u_6.NumberSequence = v_u_1.__newBasicType("NumberSequence")
v_u_6.NumberSequenceKeypoint = v_u_1.__newBasicType("NumberSequenceKeypoint")
v_u_6.OverlapParams = v_u_1.__newBasicType("OverlapParams")
v_u_6.PathWaypoint = v_u_1.__newBasicType("PathWaypoint")
v_u_6.PhysicalProperties = v_u_1.__newBasicType("PhysicalProperties")
v_u_6.Random = v_u_1.__newBasicType("Random")
v_u_6.Ray = v_u_1.__newBasicType("Ray")
v_u_6.RaycastParams = v_u_1.__newBasicType("RaycastParams")
v_u_6.RaycastResult = v_u_1.__newBasicType("RaycastResult")
v_u_6.RBXScriptConnection = v_u_1.__newBasicType("RBXScriptConnection")
v_u_6.RBXScriptSignal = v_u_1.__newBasicType("RBXScriptSignal")
v_u_6.Rect = v_u_1.__newBasicType("Rect")
v_u_6.Region3 = v_u_1.__newBasicType("Region3")
v_u_6.Region3int16 = v_u_1.__newBasicType("Region3int16")
v_u_6.TweenInfo = v_u_1.__newBasicType("TweenInfo")
v_u_6.UDim = v_u_1.__newBasicType("UDim")
v_u_6.UDim2 = v_u_1.__newBasicType("UDim2")
v_u_6.Vector2 = v_u_1.__newBasicType("Vector2")
v_u_6.Vector2int16 = v_u_1.__newBasicType("Vector2int16")
v_u_6.Vector3 = v_u_1.__newBasicType("Vector3")
v_u_6.Vector3int16 = v_u_1.__newBasicType("Vector3int16")
function v3.type(p14)
    return v_u_1.isType(p14)
end
function v3.typeof(p15)
    return v_u_1.isTypeof(p15)
end
function v3.literal(...)
    local v16 = select("#", ...)
    if v16 == 0 then
        return v_u_1.any()
    end
    if v16 == 1 then
        return v_u_1.literal(...)
    end
    local v17 = {}
    for v18 = 1, v16 do
        local v19 = v_u_1.literal
        local v20 = select
        table.insert(v17, v19(v20(v18, ...)))
    end
    return v_u_1.union(table.unpack(v17))
end
v3.exactly = v3.literal
function v3.keyOf(p21)
    local v22 = {}
    for v23, _ in pairs(p21) do
        local v24 = v_u_1.literal
        table.insert(v22, v24(v23))
    end
    return v_u_1.union(table.unpack(v22))
end
function v3.valueOf(p25)
    local v26 = {}
    for _, v27 in pairs(p25) do
        local v28 = v_u_1.typeof
        table.insert(v26, v28(v27))
    end
    return v_u_1.union(table.unpack(v26))
end
function v3.optional(p29)
    return v_u_1.optional(v_u_5(p29))
end
function v3.tuple(...)
    local v30 = table.pack(...)
    for v31 = 1, v30.n do
        local v32 = v30[v31]
        if not v_u_1.isGtType(v32) then
            if typeof(v32) == "function" then
                v32 = v_u_1.custom(v32)
            elseif v32 == nil then
                v32 = v_u_1.none()
            else
                v32 = v_u_1.typeof(v32)
            end
        end
        v30[v31] = v32
    end
    return v_u_1.tuple(table.unpack(v30))
end
function v3.union(...)
    local v33 = table.pack(...)
    for v34 = 1, v33.n do
        local v35 = v33[v34]
        if not v_u_1.isGtType(v35) then
            if typeof(v35) == "function" then
                v35 = v_u_1.custom(v35)
            elseif v35 == nil then
                v35 = v_u_1.none()
            else
                v35 = v_u_1.typeof(v35)
            end
        end
        v33[v34] = v35
    end
    return v_u_1.union(table.unpack(v33))
end
v3.some = v3.union
function v3.intersection(...)
    local v36 = table.pack(...)
    for v37 = 1, v36.n do
        local v38 = v36[v37]
        if not v_u_1.isGtType(v38) then
            if typeof(v38) == "function" then
                v38 = v_u_1.custom(v38)
            elseif v38 == nil then
                v38 = v_u_1.none()
            else
                v38 = v_u_1.typeof(v38)
            end
        end
        v36[v37] = v38
    end
    return v_u_1.intersection(table.unpack(v36))
end
v3.every = v3.intersection
function v3.keys(p39)
    local v40 = v_u_1.dictionary
    if not v_u_1.isGtType(p39) then
        if typeof(p39) == "function" then
            p39 = v_u_1.custom(p39)
        elseif p39 == nil then
            p39 = v_u_1.none()
        else
            p39 = v_u_1.typeof(p39)
        end
    end
    return v40(p39, v_u_1.any())
end
function v3.values(p41)
    return v_u_1.dictionary(v_u_1.any(), v_u_5(p41))
end
function v3.map(p42, p43)
    local v44 = v_u_1.dictionary
    if not v_u_1.isGtType(p42) then
        if typeof(p42) == "function" then
            p42 = v_u_1.custom(p42)
        elseif p42 == nil then
            p42 = v_u_1.none()
        else
            p42 = v_u_1.typeof(p42)
        end
    end
    return v44(p42, v_u_5(p43))
end
function v3.set(p45)
    local v46 = v_u_1.dictionary
    if not v_u_1.isGtType(p45) then
        if typeof(p45) == "function" then
            p45 = v_u_1.custom(p45)
        elseif p45 == nil then
            p45 = v_u_1.none()
        else
            p45 = v_u_1.typeof(p45)
        end
    end
    return v46(p45, v_u_1.literal(true))
end
function v3.numberMin(p47)
    return v_u_1.number({
        ["range"] = ("[%*, inf]"):format(p47)
    })
end
function v3.numberMax(p48)
    return v_u_1.number({
        ["range"] = ("[-inf, %*]"):format(p48)
    })
end
function v3.numberConstrained(p49, p50)
    return v_u_1.number({
        ["range"] = ("[%*, %*]"):format(p49, p50)
    })
end
function v3.numberMinExclusive(p51)
    return v_u_1.number({
        ["range"] = ("(%*, inf]"):format(p51)
    })
end
function v3.numberMaxExclusive(p52)
    return v_u_1.number({
        ["range"] = ("[-inf, %*)"):format(p52)
    })
end
function v3.numberConstrainedExclusive(p53, p54)
    return v_u_1.number({
        ["range"] = ("(%*, %*)"):format(p53, p54)
    })
end
function v3.match(p55)
    return v_u_1.string({
        ["pattern"] = p55
    })
end
function v3.array(p56)
    return v_u_1.array(v_u_5(p56))
end
function v3.strictArray(...)
    local v57 = {
        ...,
        [v_u_1.any()] = v_u_1.never()
    }
    local v58 = select("#", ...)
    for v59 = 1, v58 do
        local v60 = v57[v59]
        if not v_u_1.isGtType(v60) then
            if typeof(v60) == "function" then
                v60 = v_u_1.custom(v60)
            elseif v60 == nil then
                v60 = v_u_1.none()
            else
                v60 = v_u_1.typeof(v60)
            end
        end
        v57[v59] = v60
    end
    local v61 = {
        ["raw"] = true,
        ["count"] = {
            ["min"] = 0,
            ["max"] = v58
        }
    }
    return v_u_1.table(v57, v61)
end
function v3.interface(p62)
    local v63 = {}
    for v64, v66 in pairs(p62) do
        if not v_u_1.isGtType(v66) then
            local v66
            if typeof(v66) == "function" then
                v66 = v_u_1.custom(v66)
            elseif v66 == nil then
                v66 = v_u_1.none()
            else
                v66 = v_u_1.typeof(v66)
            end
        end
        v63[v64] = v66
    end
    return v_u_1.table(v63, {
        ["raw"] = true
    })
end
function v3.strictInterface(p67)
    local v68 = {}
    for v69, v71 in pairs(p67) do
        if not v_u_1.isGtType(v71) then
            local v71
            if typeof(v71) == "function" then
                v71 = v_u_1.custom(v71)
            elseif v71 == nil then
                v71 = v_u_1.none()
            else
                v71 = v_u_1.typeof(v71)
            end
        end
        v68[v69] = v71
    end
    v68[v_u_1.any()] = v_u_1.never()
    return v_u_1.table(v68, {
        ["raw"] = true
    })
end
local function v_u_85(p72)
    local v_u_73 = {}
    for v74, v77 in pairs(p72) do
        local v76 = typeof(v74) == "string"
        assert(v76, "children keys must be strings")
        if not v_u_1.isGtType(v77) then
            local v77
            if typeof(v77) == "function" then
                v77 = v_u_1.custom(v77)
            elseif v77 == nil then
                v77 = v_u_1.none()
            else
                v77 = v_u_1.typeof(v77)
            end
        end
        v_u_73[v74] = v77
    end
    return function(p78)
        if not p78 or typeof(p78) ~= "Instance" then
            return false, "expected an instance"
        end
        for v79, v80 in pairs(v_u_73) do
            if not p78:FindFirstChild(v79) then
                return false, "missing child " .. v79
            end
            local v81, v82 = v80(p78:FindFirstChild(v79))
            if not v81 then
                return false, v82
            end
        end
        local v83 = {}
        for _, v84 in p78:GetChildren() do
            if v83[v84.Name] then
                return false, "duplicate child " .. v84.Name
            end
            v83[v84.Name] = true
        end
        return true, nil
    end
end
function v3.instanceOf(p_u_86, p_u_87)
    if p_u_87 then
        p_u_87 = v_u_85(p_u_87)
    end
    return v_u_1.withCustom(v_u_2(p_u_86), function(p88)
        if p88.ClassName == p_u_86 then
            return not p_u_87 and true or p_u_87(p88)
        else
            return false, "expected an instance of " .. p_u_86
        end
    end, "InstanceOf")
end
v3.instance = v3.instanceOf
function v3.instanceIsA(p89, p90)
    if p90 then
        return v_u_1.withCustom(v_u_2(p89), v_u_85(p90), "Children")
    else
        return v_u_2(p89)
    end
end
function v3.children(p91)
    return v_u_1.custom(v_u_85(p91), "Children")
end
function v3.enum(p_u_92)
    return v_u_1.custom(function(p93)
        if typeof(p93) ~= "EnumItem" then
            return false, "expected an enum item"
        end
        if p93.EnumType == p_u_92 then
            return true
        end
        local v94 = p_u_92
        return false, "expected an enum item of type " .. tostring(v94)
    end, (("%*"):format(p_u_92)))
end
function v3.wrap(p_u_95, p_u_96)
    if not v_u_1.isGtType(p_u_96) then
        if typeof(p_u_96) == "function" then
            p_u_96 = v_u_1.custom(p_u_96)
        elseif p_u_96 == nil then
            p_u_96 = v_u_1.none()
        else
            p_u_96 = v_u_1.typeof(p_u_96)
        end
    end
    return function(...)
        p_u_96:assert(...)
        return p_u_95(...)
    end
end
function v3.strict(p_u_97)
    if not v_u_1.isGtType(p_u_97) then
        if typeof(p_u_97) == "function" then
            p_u_97 = v_u_1.custom(p_u_97)
        elseif p_u_97 == nil then
            p_u_97 = v_u_1.none()
        else
            p_u_97 = v_u_1.typeof(p_u_97)
        end
    end
    return function(...)
        p_u_97:assert(...)
    end
end
return setmetatable(v3, {
    ["__index"] = function(_, p98)
        if v_u_6[p98] then
            return v_u_6[p98]()
        else
            return nil
        end
    end
})