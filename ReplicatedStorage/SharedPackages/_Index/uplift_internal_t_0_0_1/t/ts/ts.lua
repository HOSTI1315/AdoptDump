--// ReplicatedStorage.SharedPackages._Index.uplift-internal_t@0.0.1.t.ts (ModuleScript)

local v_u_1 = typeof or type
local v_u_3 = {
    ["any"] = function(p2)
        return p2 ~= nil
    end
}
local v_u_4 = "boolean"
function v_u_3.boolean(p5)
    return v_u_1(p5) == v_u_4
end
local v_u_6 = "thread"
function v_u_3.thread(p7)
    return v_u_1(p7) == v_u_6
end
local v_u_8 = "function"
function v_u_3.callback(p9)
    return v_u_1(p9) == v_u_8
end
v_u_3["function"] = v_u_3.callback
local v_u_10 = "nil"
function v_u_3.none(p11)
    return v_u_1(p11) == v_u_10
end
v_u_3["nil"] = v_u_3.none
local v_u_12 = "string"
function v_u_3.string(p13)
    return v_u_1(p13) == v_u_12
end
local v_u_14 = "table"
function v_u_3.table(p15)
    return v_u_1(p15) == v_u_14
end
local v_u_16 = "userdata"
function v_u_3.userdata(p17)
    return v_u_1(p17) == v_u_16
end
function v_u_3.number(p18)
    if v_u_1(p18) == "number" then
        return p18 == p18
    else
        return false
    end
end
function v_u_3.nan(p19)
    if v_u_1(p19) == "number" then
        return p19 ~= p19
    else
        return false
    end
end
local v_u_20 = "Axes"
function v_u_3.Axes(p21)
    return v_u_1(p21) == v_u_20
end
local v_u_22 = "BrickColor"
function v_u_3.BrickColor(p23)
    return v_u_1(p23) == v_u_22
end
local v_u_24 = "CFrame"
function v_u_3.CFrame(p25)
    return v_u_1(p25) == v_u_24
end
local v_u_26 = "Color3"
function v_u_3.Color3(p27)
    return v_u_1(p27) == v_u_26
end
local v_u_28 = "ColorSequence"
function v_u_3.ColorSequence(p29)
    return v_u_1(p29) == v_u_28
end
local v_u_30 = "ColorSequenceKeypoint"
function v_u_3.ColorSequenceKeypoint(p31)
    return v_u_1(p31) == v_u_30
end
local v_u_32 = "DockWidgetPluginGuiInfo"
function v_u_3.DockWidgetPluginGuiInfo(p33)
    return v_u_1(p33) == v_u_32
end
local v_u_34 = "Faces"
function v_u_3.Faces(p35)
    return v_u_1(p35) == v_u_34
end
local v_u_36 = "Instance"
function v_u_3.Instance(p37)
    return v_u_1(p37) == v_u_36
end
local v_u_38 = "NumberRange"
function v_u_3.NumberRange(p39)
    return v_u_1(p39) == v_u_38
end
local v_u_40 = "NumberSequence"
function v_u_3.NumberSequence(p41)
    return v_u_1(p41) == v_u_40
end
local v_u_42 = "NumberSequenceKeypoint"
function v_u_3.NumberSequenceKeypoint(p43)
    return v_u_1(p43) == v_u_42
end
local v_u_44 = "PathWaypoint"
function v_u_3.PathWaypoint(p45)
    return v_u_1(p45) == v_u_44
end
local v_u_46 = "PhysicalProperties"
function v_u_3.PhysicalProperties(p47)
    return v_u_1(p47) == v_u_46
end
local v_u_48 = "Random"
function v_u_3.Random(p49)
    return v_u_1(p49) == v_u_48
end
local v_u_50 = "Ray"
function v_u_3.Ray(p51)
    return v_u_1(p51) == v_u_50
end
local v_u_52 = "Rect"
function v_u_3.Rect(p53)
    return v_u_1(p53) == v_u_52
end
local v_u_54 = "Region3"
function v_u_3.Region3(p55)
    return v_u_1(p55) == v_u_54
end
local v_u_56 = "Region3int16"
function v_u_3.Region3int16(p57)
    return v_u_1(p57) == v_u_56
end
local v_u_58 = "TweenInfo"
function v_u_3.TweenInfo(p59)
    return v_u_1(p59) == v_u_58
end
local v_u_60 = "UDim"
function v_u_3.UDim(p61)
    return v_u_1(p61) == v_u_60
end
local v_u_62 = "UDim2"
function v_u_3.UDim2(p63)
    return v_u_1(p63) == v_u_62
end
local v_u_64 = "Vector2"
function v_u_3.Vector2(p65)
    return v_u_1(p65) == v_u_64
end
local v_u_66 = "Vector3"
function v_u_3.Vector3(p67)
    return v_u_1(p67) == v_u_66
end
local v_u_68 = "Vector3int16"
function v_u_3.Vector3int16(p69)
    return v_u_1(p69) == v_u_68
end
local v_u_70 = "Enum"
function v_u_3.Enum(p71)
    return v_u_1(p71) == v_u_70
end
local v_u_72 = "EnumItem"
function v_u_3.EnumItem(p73)
    return v_u_1(p73) == v_u_72
end
local v_u_74 = "RBXScriptSignal"
function v_u_3.RBXScriptSignal(p75)
    return v_u_1(p75) == v_u_74
end
local v_u_76 = "RBXScriptConnection"
function v_u_3.RBXScriptConnection(p77)
    return v_u_1(p77) == v_u_76
end
function v_u_3.literal(...)
    local v78 = select("#", ...)
    if v78 == 1 then
        local v_u_79 = ...
        return function(p80)
            return p80 == v_u_79
        end
    end
    local v81 = {}
    for v82 = 1, v78 do
        local v83 = select(v82, ...)
        v81[v82] = v_u_3.literal(v83)
    end
    return v_u_3.union(table.unpack(v81, 1, v78))
end
v_u_3.exactly = v_u_3.literal
function v_u_3.keyOf(p84)
    local v85 = 0
    local v86 = {}
    for v87 in pairs(p84) do
        v85 = v85 + 1
        v86[v85] = v87
    end
    return v_u_3.literal(table.unpack(v86, 1, v85))
end
function v_u_3.valueOf(p88)
    local v89 = 0
    local v90 = {}
    for _, v91 in pairs(p88) do
        v89 = v89 + 1
        v90[v89] = v91
    end
    return v_u_3.literal(table.unpack(v90, 1, v89))
end
function v_u_3.integer(p92)
    if v_u_3.number(p92) then
        return p92 % 1 == 0
    else
        return false
    end
end
function v_u_3.numberMin(p_u_93)
    return function(p94)
        if v_u_3.number(p94) then
            return p_u_93 <= p94
        else
            return false
        end
    end
end
function v_u_3.numberMax(p_u_95)
    return function(p96)
        if v_u_3.number(p96) then
            return p96 <= p_u_95
        else
            return false
        end
    end
end
function v_u_3.numberMinExclusive(p_u_97)
    return function(p98)
        if v_u_3.number(p98) then
            return p_u_97 < p98
        else
            return false
        end
    end
end
function v_u_3.numberMaxExclusive(p_u_99)
    return function(p100)
        if v_u_3.number(p100) then
            return p100 < p_u_99
        else
            return false
        end
    end
end
v_u_3.numberPositive = v_u_3.numberMinExclusive(0)
v_u_3.numberNegative = v_u_3.numberMaxExclusive(0)
function v_u_3.numberConstrained(p101, p102)
    local v103 = v_u_3.number
    assert(v103(p101))
    local v104 = v_u_3.number
    assert(v104(p102))
    local v_u_105 = v_u_3.numberMin(p101)
    local v_u_106 = v_u_3.numberMax(p102)
    return function(p107)
        if v_u_105(p107) then
            return v_u_106(p107) and true or false
        else
            return false
        end
    end
end
function v_u_3.numberConstrainedExclusive(p108, p109)
    local v110 = v_u_3.number
    assert(v110(p108))
    local v111 = v_u_3.number
    assert(v111(p109))
    local v_u_112 = v_u_3.numberMinExclusive(p108)
    local v_u_113 = v_u_3.numberMaxExclusive(p109)
    return function(p114)
        if v_u_112(p114) then
            return v_u_113(p114) and true or false
        else
            return false
        end
    end
end
function v_u_3.match(p_u_115)
    local v116 = v_u_3.string
    assert(v116(p_u_115))
    return function(p117)
        if v_u_3.string(p117) then
            return string.match(p117, p_u_115) ~= nil
        else
            return false
        end
    end
end
function v_u_3.optional(p_u_118)
    local v119 = v_u_3.callback
    assert(v119(p_u_118))
    return function(p120)
        return p120 == nil and true or (p_u_118(p120) and true or false)
    end
end
function v_u_3.tuple(...)
    local v_u_121 = { ... }
    return function(...)
        local v122 = { ... }
        for v123, v124 in ipairs(v_u_121) do
            if v124(v122[v123]) == false then
                return false
            end
        end
        return true
    end
end
function v_u_3.keys(p_u_125)
    local v126 = v_u_3.callback
    assert(v126(p_u_125))
    return function(p127)
        if v_u_3.table(p127) == false then
            return false
        end
        for v128 in pairs(p127) do
            if p_u_125(v128) == false then
                return false
            end
        end
        return true
    end
end
function v_u_3.values(p_u_129)
    local v130 = v_u_3.callback
    assert(v130(p_u_129))
    return function(p131)
        if v_u_3.table(p131) == false then
            return false
        end
        for _, v132 in pairs(p131) do
            if p_u_129(v132) == false then
                return false
            end
        end
        return true
    end
end
function v_u_3.map(p133, p134)
    local v135 = v_u_3.callback
    assert(v135(p133))
    local v136 = v_u_3.callback
    assert(v136(p134))
    local v_u_137 = v_u_3.keys(p133)
    local v_u_138 = v_u_3.values(p134)
    return function(p139)
        if v_u_137(p139) then
            return v_u_138(p139) and true or false
        else
            return false
        end
    end
end
function v_u_3.set(p140)
    return v_u_3.map(p140, v_u_3.literal(true))
end
local v_u_141 = v_u_3.keys(v_u_3.integer)
function v_u_3.array(p142)
    local v143 = v_u_3.callback
    assert(v143(p142))
    local v_u_144 = v_u_3.values(p142)
    return function(p145)
        if v_u_141(p145) == false then
            return false
        end
        local v146 = 0
        for _ in ipairs(p145) do
            v146 = v146 + 1
        end
        for v147 in pairs(p145) do
            if v147 < 1 or v146 < v147 then
                return false
            end
        end
        return v_u_144(p145) and true or false
    end
end
function v_u_3.strictArray(...)
    local v_u_148 = { ... }
    local v149 = v_u_3.array(v_u_3.callback)
    assert(v149(v_u_148))
    return function(p150)
        if v_u_141(p150) == false then
            return false
        end
        if #v_u_148 < #p150 then
            return false
        end
        for v151, v152 in pairs(v_u_148) do
            if not v152(p150[v151]) then
                return false
            end
        end
        return true
    end
end
local v_u_153 = v_u_3.array(v_u_3.callback)
function v_u_3.union(...)
    local v_u_154 = { ... }
    local v155 = v_u_153
    assert(v155(v_u_154))
    return function(p156)
        for _, v157 in ipairs(v_u_154) do
            if v157(p156) then
                return true
            end
        end
        return false
    end
end
v_u_3.some = v_u_3.union
function v_u_3.intersection(...)
    local v_u_158 = { ... }
    local v159 = v_u_153
    assert(v159(v_u_158))
    return function(p160)
        for _, v161 in ipairs(v_u_158) do
            if not v161(p160) then
                return false
            end
        end
        return true
    end
end
v_u_3.every = v_u_3.intersection
local v_u_162 = v_u_3.map(v_u_3.any, v_u_3.callback)
function v_u_3.interface(p_u_163)
    local v164 = v_u_162
    assert(v164(p_u_163))
    return function(p165)
        if v_u_3.table(p165) == false then
            return false
        end
        for v166, v167 in pairs(p_u_163) do
            if v167(p165[v166]) == false then
                return false
            end
        end
        return true
    end
end
function v_u_3.strictInterface(p_u_168)
    local v169 = v_u_162
    assert(v169(p_u_168))
    return function(p170)
        if v_u_3.table(p170) == false then
            return false
        end
        for v171, v172 in pairs(p_u_168) do
            if v172(p170[v171]) == false then
                return false
            end
        end
        for v173 in pairs(p170) do
            if not p_u_168[v173] then
                return false
            end
        end
        return true
    end
end
function v_u_3.instanceOf(p_u_174, p175)
    local v176 = v_u_3.string
    assert(v176(p_u_174))
    local v_u_177
    if p175 == nil then
        v_u_177 = nil
    else
        v_u_177 = v_u_3.children(p175)
    end
    return function(p178)
        if v_u_3.Instance(p178) then
            if p178.ClassName == p_u_174 then
                return (not v_u_177 or v_u_177(p178)) and true or false
            else
                return false
            end
        else
            return false
        end
    end
end
v_u_3.instance = v_u_3.instanceOf
function v_u_3.instanceIsA(p_u_179, p180)
    local v181 = v_u_3.string
    assert(v181(p_u_179))
    local v_u_182
    if p180 == nil then
        v_u_182 = nil
    else
        v_u_182 = v_u_3.children(p180)
    end
    return function(p183)
        if v_u_3.Instance(p183) then
            if p183:IsA(p_u_179) then
                return (not v_u_182 or v_u_182(p183)) and true or false
            else
                return false
            end
        else
            return false
        end
    end
end
function v_u_3.enum(p_u_184)
    local v185 = v_u_3.Enum
    assert(v185(p_u_184))
    return function(p186)
        if v_u_3.EnumItem(p186) then
            return p186.EnumType == p_u_184
        else
            return false
        end
    end
end
local v_u_187 = v_u_3.tuple(v_u_3.callback, v_u_3.callback)
function v_u_3.wrap(p_u_188, p_u_189)
    local v190 = v_u_187
    assert(v190(p_u_188, p_u_189))
    return function(...)
        local v191 = p_u_189
        assert(v191(...))
        return p_u_188(...)
    end
end
function v_u_3.strict(p_u_192)
    return function(...)
        local v193 = p_u_192
        assert(v193(...))
    end
end
local v_u_194 = v_u_3.map(v_u_3.string, v_u_3.callback)
function v_u_3.children(p_u_195)
    local v196 = v_u_194
    assert(v196(p_u_195))
    return function(p197)
        if not v_u_3.Instance(p197) then
            return false
        end
        local v198 = {}
        for _, v199 in ipairs(p197:GetChildren()) do
            local v200 = v199.Name
            if p_u_195[v200] then
                if v198[v200] then
                    return false
                end
                v198[v200] = v199
            end
        end
        for v201, v202 in pairs(p_u_195) do
            if not v202(v198[v201]) then
                return false
            end
        end
        return true
    end
end
return {
    ["t"] = v_u_3
}