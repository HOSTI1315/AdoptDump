--// ReplicatedStorage.SharedPackages._Index.uplift-internal_t@0.0.1.t (ModuleScript)

local v_u_1 = typeof or type
local v_u_3 = {
    ["any"] = function(p2)
        if p2 == nil then
            return false, "any expected, got nil"
        else
            return true
        end
    end
}
local v_u_4 = "boolean"
function v_u_3.boolean(p5)
    local v6 = v_u_1(p5)
    if v6 == v_u_4 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_4, v6)
    end
end
local v_u_7 = "thread"
function v_u_3.thread(p8)
    local v9 = v_u_1(p8)
    if v9 == v_u_7 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_7, v9)
    end
end
local v_u_10 = "function"
function v_u_3.callback(p11)
    local v12 = v_u_1(p11)
    if v12 == v_u_10 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_10, v12)
    end
end
v_u_3["function"] = v_u_3.callback
local v_u_13 = "nil"
function v_u_3.none(p14)
    local v15 = v_u_1(p14)
    if v15 == v_u_13 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_13, v15)
    end
end
v_u_3["nil"] = v_u_3.none
local v_u_16 = "string"
function v_u_3.string(p17)
    local v18 = v_u_1(p17)
    if v18 == v_u_16 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_16, v18)
    end
end
local v_u_19 = "table"
function v_u_3.table(p20)
    local v21 = v_u_1(p20)
    if v21 == v_u_19 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_19, v21)
    end
end
local v_u_22 = "userdata"
function v_u_3.userdata(p23)
    local v24 = v_u_1(p23)
    if v24 == v_u_22 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_22, v24)
    end
end
function v_u_3.number(p25)
    local v26 = v_u_1(p25)
    if v26 == "number" then
        if p25 == p25 then
            return true
        else
            return false, "unexpected NaN value"
        end
    else
        return false, string.format("number expected, got %s", v26)
    end
end
function v_u_3.nan(p27)
    local v28 = v_u_1(p27)
    if v28 == "number" then
        if p27 == p27 then
            return false, "unexpected non-NaN value"
        else
            return true
        end
    else
        return false, string.format("number expected, got %s", v28)
    end
end
local v_u_29 = "Axes"
function v_u_3.Axes(p30)
    local v31 = v_u_1(p30)
    if v31 == v_u_29 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_29, v31)
    end
end
local v_u_32 = "BrickColor"
function v_u_3.BrickColor(p33)
    local v34 = v_u_1(p33)
    if v34 == v_u_32 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_32, v34)
    end
end
local v_u_35 = "CFrame"
function v_u_3.CFrame(p36)
    local v37 = v_u_1(p36)
    if v37 == v_u_35 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_35, v37)
    end
end
local v_u_38 = "Color3"
function v_u_3.Color3(p39)
    local v40 = v_u_1(p39)
    if v40 == v_u_38 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_38, v40)
    end
end
local v_u_41 = "ColorSequence"
function v_u_3.ColorSequence(p42)
    local v43 = v_u_1(p42)
    if v43 == v_u_41 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_41, v43)
    end
end
local v_u_44 = "ColorSequenceKeypoint"
function v_u_3.ColorSequenceKeypoint(p45)
    local v46 = v_u_1(p45)
    if v46 == v_u_44 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_44, v46)
    end
end
local v_u_47 = "DockWidgetPluginGuiInfo"
function v_u_3.DockWidgetPluginGuiInfo(p48)
    local v49 = v_u_1(p48)
    if v49 == v_u_47 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_47, v49)
    end
end
local v_u_50 = "Faces"
function v_u_3.Faces(p51)
    local v52 = v_u_1(p51)
    if v52 == v_u_50 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_50, v52)
    end
end
local v_u_53 = "Instance"
function v_u_3.Instance(p54)
    local v55 = v_u_1(p54)
    if v55 == v_u_53 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_53, v55)
    end
end
local v_u_56 = "NumberRange"
function v_u_3.NumberRange(p57)
    local v58 = v_u_1(p57)
    if v58 == v_u_56 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_56, v58)
    end
end
local v_u_59 = "NumberSequence"
function v_u_3.NumberSequence(p60)
    local v61 = v_u_1(p60)
    if v61 == v_u_59 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_59, v61)
    end
end
local v_u_62 = "NumberSequenceKeypoint"
function v_u_3.NumberSequenceKeypoint(p63)
    local v64 = v_u_1(p63)
    if v64 == v_u_62 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_62, v64)
    end
end
local v_u_65 = "PathWaypoint"
function v_u_3.PathWaypoint(p66)
    local v67 = v_u_1(p66)
    if v67 == v_u_65 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_65, v67)
    end
end
local v_u_68 = "PhysicalProperties"
function v_u_3.PhysicalProperties(p69)
    local v70 = v_u_1(p69)
    if v70 == v_u_68 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_68, v70)
    end
end
local v_u_71 = "Random"
function v_u_3.Random(p72)
    local v73 = v_u_1(p72)
    if v73 == v_u_71 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_71, v73)
    end
end
local v_u_74 = "Ray"
function v_u_3.Ray(p75)
    local v76 = v_u_1(p75)
    if v76 == v_u_74 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_74, v76)
    end
end
local v_u_77 = "Rect"
function v_u_3.Rect(p78)
    local v79 = v_u_1(p78)
    if v79 == v_u_77 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_77, v79)
    end
end
local v_u_80 = "Region3"
function v_u_3.Region3(p81)
    local v82 = v_u_1(p81)
    if v82 == v_u_80 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_80, v82)
    end
end
local v_u_83 = "Region3int16"
function v_u_3.Region3int16(p84)
    local v85 = v_u_1(p84)
    if v85 == v_u_83 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_83, v85)
    end
end
local v_u_86 = "TweenInfo"
function v_u_3.TweenInfo(p87)
    local v88 = v_u_1(p87)
    if v88 == v_u_86 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_86, v88)
    end
end
local v_u_89 = "UDim"
function v_u_3.UDim(p90)
    local v91 = v_u_1(p90)
    if v91 == v_u_89 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_89, v91)
    end
end
local v_u_92 = "UDim2"
function v_u_3.UDim2(p93)
    local v94 = v_u_1(p93)
    if v94 == v_u_92 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_92, v94)
    end
end
local v_u_95 = "Vector2"
function v_u_3.Vector2(p96)
    local v97 = v_u_1(p96)
    if v97 == v_u_95 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_95, v97)
    end
end
local v_u_98 = "Vector3"
function v_u_3.Vector3(p99)
    local v100 = v_u_1(p99)
    if v100 == v_u_98 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_98, v100)
    end
end
local v_u_101 = "Vector3int16"
function v_u_3.Vector3int16(p102)
    local v103 = v_u_1(p102)
    if v103 == v_u_101 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_101, v103)
    end
end
local v_u_104 = "Enum"
function v_u_3.Enum(p105)
    local v106 = v_u_1(p105)
    if v106 == v_u_104 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_104, v106)
    end
end
local v_u_107 = "EnumItem"
function v_u_3.EnumItem(p108)
    local v109 = v_u_1(p108)
    if v109 == v_u_107 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_107, v109)
    end
end
local v_u_110 = "RBXScriptSignal"
function v_u_3.RBXScriptSignal(p111)
    local v112 = v_u_1(p111)
    if v112 == v_u_110 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_110, v112)
    end
end
local v_u_113 = "RBXScriptConnection"
function v_u_3.RBXScriptConnection(p114)
    local v115 = v_u_1(p114)
    if v115 == v_u_113 then
        return true
    else
        return false, string.format("%s expected, got %s", v_u_113, v115)
    end
end
function v_u_3.literal(...)
    local v116 = select("#", ...)
    if v116 == 1 then
        local v_u_117 = ...
        return function(p118)
            if p118 == v_u_117 then
                return true
            end
            local v119 = v_u_117
            return false, string.format("expected %s, got %s", tostring(v119), (tostring(p118)))
        end
    end
    local v120 = {}
    for v121 = 1, v116 do
        local v122 = select(v121, ...)
        v120[v121] = v_u_3.literal(v122)
    end
    return v_u_3.union(table.unpack(v120, 1, v116))
end
v_u_3.exactly = v_u_3.literal
function v_u_3.keyOf(p123)
    local v124 = 0
    local v125 = {}
    for v126 in pairs(p123) do
        v124 = v124 + 1
        v125[v124] = v126
    end
    return v_u_3.literal(table.unpack(v125, 1, v124))
end
function v_u_3.valueOf(p127)
    local v128 = 0
    local v129 = {}
    for _, v130 in pairs(p127) do
        v128 = v128 + 1
        v129[v128] = v130
    end
    return v_u_3.literal(table.unpack(v129, 1, v128))
end
function v_u_3.integer(p131)
    local v132, v133 = v_u_3.number(p131)
    if v132 then
        if p131 % 1 == 0 then
            return true
        else
            return false, string.format("integer expected, got %s", p131)
        end
    else
        return false, v133 or ""
    end
end
function v_u_3.numberMin(p_u_134)
    return function(p135)
        local v136, v137 = v_u_3.number(p135)
        if v136 then
            if p_u_134 <= p135 then
                return true
            else
                return false, string.format("number >= %s expected, got %s", p_u_134, p135)
            end
        else
            return false, v137 or ""
        end
    end
end
function v_u_3.numberMax(p_u_138)
    return function(p139)
        local v140, v141 = v_u_3.number(p139)
        if v140 then
            if p139 <= p_u_138 then
                return true
            else
                return false, string.format("number <= %s expected, got %s", p_u_138, p139)
            end
        else
            return false, v141
        end
    end
end
function v_u_3.numberMinExclusive(p_u_142)
    return function(p143)
        local v144, v145 = v_u_3.number(p143)
        if v144 then
            if p_u_142 < p143 then
                return true
            else
                return false, string.format("number > %s expected, got %s", p_u_142, p143)
            end
        else
            return false, v145 or ""
        end
    end
end
function v_u_3.numberMaxExclusive(p_u_146)
    return function(p147)
        local v148, v149 = v_u_3.number(p147)
        if v148 then
            if p147 < p_u_146 then
                return true
            else
                return false, string.format("number < %s expected, got %s", p_u_146, p147)
            end
        else
            return false, v149 or ""
        end
    end
end
v_u_3.numberPositive = v_u_3.numberMinExclusive(0)
v_u_3.numberNegative = v_u_3.numberMaxExclusive(0)
function v_u_3.numberConstrained(p150, p151)
    local v152 = v_u_3.number
    assert(v152(p150))
    local v153 = v_u_3.number
    assert(v153(p151))
    local v_u_154 = v_u_3.numberMin(p150)
    local v_u_155 = v_u_3.numberMax(p151)
    return function(p156)
        local v157, v158 = v_u_154(p156)
        if v157 then
            local v159, v160 = v_u_155(p156)
            if v159 then
                return true
            else
                return false, v160 or ""
            end
        else
            return false, v158 or ""
        end
    end
end
function v_u_3.numberConstrainedExclusive(p161, p162)
    local v163 = v_u_3.number
    assert(v163(p161))
    local v164 = v_u_3.number
    assert(v164(p162))
    local v_u_165 = v_u_3.numberMinExclusive(p161)
    local v_u_166 = v_u_3.numberMaxExclusive(p162)
    return function(p167)
        local v168, v169 = v_u_165(p167)
        if v168 then
            local v170, v171 = v_u_166(p167)
            if v170 then
                return true
            else
                return false, v171 or ""
            end
        else
            return false, v169 or ""
        end
    end
end
function v_u_3.match(p_u_172)
    local v173 = v_u_3.string
    assert(v173(p_u_172))
    return function(p174)
        local v175, v176 = v_u_3.string(p174)
        if v175 then
            if string.match(p174, p_u_172) == nil then
                return false, string.format("%q failed to match pattern %q", p174, p_u_172)
            else
                return true
            end
        else
            return false, v176
        end
    end
end
function v_u_3.optional(p_u_177)
    local v178 = v_u_3.callback
    assert(v178(p_u_177))
    return function(p179)
        if p179 == nil then
            return true
        else
            local v180, v181 = p_u_177(p179)
            if v180 then
                return true
            else
                return false, string.format("(optional) %s", v181 or "")
            end
        end
    end
end
function v_u_3.tuple(...)
    local v_u_182 = { ... }
    return function(...)
        local v183 = { ... }
        for v184, v185 in ipairs(v_u_182) do
            local v186, v187 = v185(v183[v184])
            if v186 == false then
                return false, string.format("Bad tuple index #%s:\n\t%s", v184, v187 or "")
            end
        end
        return true
    end
end
function v_u_3.keys(p_u_188)
    local v189 = v_u_3.callback
    assert(v189(p_u_188))
    return function(p190)
        local v191, v192 = v_u_3.table(p190)
        if v191 == false then
            return false, v192 or ""
        end
        for v193 in pairs(p190) do
            local v194, v195 = p_u_188(v193)
            if v194 == false then
                return false, string.format("bad key %s:\n\t%s", tostring(v193), v195 or "")
            end
        end
        return true
    end
end
function v_u_3.values(p_u_196)
    local v197 = v_u_3.callback
    assert(v197(p_u_196))
    return function(p198)
        local v199, v200 = v_u_3.table(p198)
        if v199 == false then
            return false, v200 or ""
        end
        for v201, v202 in pairs(p198) do
            local v203, v204 = p_u_196(v202)
            if v203 == false then
                return false, string.format("bad value for key %s:\n\t%s", tostring(v201), v204 or "")
            end
        end
        return true
    end
end
function v_u_3.map(p205, p206)
    local v207 = v_u_3.callback
    assert(v207(p205))
    local v208 = v_u_3.callback
    assert(v208(p206))
    local v_u_209 = v_u_3.keys(p205)
    local v_u_210 = v_u_3.values(p206)
    return function(p211)
        local v212, v213 = v_u_209(p211)
        if v212 then
            local v214, v215 = v_u_210(p211)
            if v214 then
                return true
            else
                return false, v215 or ""
            end
        else
            return false, v213 or ""
        end
    end
end
function v_u_3.set(p216)
    return v_u_3.map(p216, v_u_3.literal(true))
end
local v_u_217 = v_u_3.keys(v_u_3.integer)
function v_u_3.array(p218)
    local v219 = v_u_3.callback
    assert(v219(p218))
    local v_u_220 = v_u_3.values(p218)
    return function(p221)
        local v222, v223 = v_u_217(p221)
        if v222 == false then
            return false, string.format("[array] %s", v223 or "")
        else
            local v224 = 0
            for _ in ipairs(p221) do
                v224 = v224 + 1
            end
            for v225 in pairs(p221) do
                if v225 < 1 or v224 < v225 then
                    return false, string.format("[array] key %s must be sequential", (tostring(v225)))
                end
            end
            local v226, v227 = v_u_220(p221)
            if v226 then
                return true
            else
                return false, string.format("[array] %s", v227 or "")
            end
        end
    end
end
function v_u_3.strictArray(...)
    local v_u_228 = { ... }
    local v229 = v_u_3.array(v_u_3.callback)
    assert(v229(v_u_228))
    return function(p230)
        local v231, v232 = v_u_217(p230)
        if v231 == false then
            return false, string.format("[strictArray] %s", v232 or "")
        end
        if #v_u_228 < #p230 then
            return false, string.format("[strictArray] Array size exceeds limit of %d", #v_u_228)
        end
        for v233, v234 in pairs(v_u_228) do
            local v235, v236 = v234(p230[v233])
            if not v235 then
                return false, string.format("[strictArray] Array index #%d - %s", v233, v236)
            end
        end
        return true
    end
end
local v_u_237 = v_u_3.array(v_u_3.callback)
function v_u_3.union(...)
    local v_u_238 = { ... }
    local v239 = v_u_237
    assert(v239(v_u_238))
    return function(p240)
        for _, v241 in ipairs(v_u_238) do
            if v241(p240) then
                return true
            end
        end
        return false, "bad type for union"
    end
end
v_u_3.some = v_u_3.union
function v_u_3.intersection(...)
    local v_u_242 = { ... }
    local v243 = v_u_237
    assert(v243(v_u_242))
    return function(p244)
        for _, v245 in ipairs(v_u_242) do
            local v246, v247 = v245(p244)
            if not v246 then
                return false, v247 or ""
            end
        end
        return true
    end
end
v_u_3.every = v_u_3.intersection
local v_u_248 = v_u_3.map(v_u_3.any, v_u_3.callback)
function v_u_3.interface(p_u_249)
    local v250 = v_u_248
    assert(v250(p_u_249))
    return function(p251)
        local v252, v253 = v_u_3.table(p251)
        if v252 == false then
            return false, v253 or ""
        end
        for v254, v255 in pairs(p_u_249) do
            local v256, v257 = v255(p251[v254])
            if v256 == false then
                return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v254), v257 or "")
            end
        end
        return true
    end
end
function v_u_3.strictInterface(p_u_258)
    local v259 = v_u_248
    assert(v259(p_u_258))
    return function(p260)
        local v261, v262 = v_u_3.table(p260)
        if v261 == false then
            return false, v262 or ""
        end
        for v263, v264 in pairs(p_u_258) do
            local v265, v266 = v264(p260[v263])
            if v265 == false then
                return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v263), v266 or "")
            end
        end
        for v267 in pairs(p260) do
            if not p_u_258[v267] then
                return false, string.format("[interface] unexpected field %q", (tostring(v267)))
            end
        end
        return true
    end
end
function v_u_3.instanceOf(p_u_268, p269)
    local v270 = v_u_3.string
    assert(v270(p_u_268))
    local v_u_271
    if p269 == nil then
        v_u_271 = nil
    else
        v_u_271 = v_u_3.children(p269)
    end
    return function(p272)
        local v273, v274 = v_u_3.Instance(p272)
        if not v273 then
            return false, v274 or ""
        end
        if p272.ClassName ~= p_u_268 then
            return false, string.format("%s expected, got %s", p_u_268, p272.ClassName)
        end
        if v_u_271 then
            local v275, v276 = v_u_271(p272)
            if not v275 then
                return false, v276
            end
        end
        return true
    end
end
v_u_3.instance = v_u_3.instanceOf
function v_u_3.instanceIsA(p_u_277, p278)
    local v279 = v_u_3.string
    assert(v279(p_u_277))
    local v_u_280
    if p278 == nil then
        v_u_280 = nil
    else
        v_u_280 = v_u_3.children(p278)
    end
    return function(p281)
        local v282, v283 = v_u_3.Instance(p281)
        if not v282 then
            return false, v283 or ""
        end
        if not p281:IsA(p_u_277) then
            return false, string.format("%s expected, got %s", p_u_277, p281.ClassName)
        end
        if v_u_280 then
            local v284, v285 = v_u_280(p281)
            if not v284 then
                return false, v285
            end
        end
        return true
    end
end
function v_u_3.enum(p_u_286)
    local v287 = v_u_3.Enum
    assert(v287(p_u_286))
    return function(p288)
        local v289, v290 = v_u_3.EnumItem(p288)
        if not v289 then
            return false, v290
        end
        if p288.EnumType == p_u_286 then
            return true
        end
        local v291 = string.format
        local v292 = p_u_286
        local v293 = tostring(v292)
        local v294 = p288.EnumType
        return false, v291("enum of %s expected, got enum of %s", v293, (tostring(v294)))
    end
end
local v_u_295 = v_u_3.tuple(v_u_3.callback, v_u_3.callback)
function v_u_3.wrap(p_u_296, p_u_297)
    local v298 = v_u_295
    assert(v298(p_u_296, p_u_297))
    return function(...)
        local v299 = p_u_297
        assert(v299(...))
        return p_u_296(...)
    end
end
function v_u_3.strict(p_u_300)
    return function(...)
        local v301 = p_u_300
        assert(v301(...))
    end
end
local v_u_302 = v_u_3.map(v_u_3.string, v_u_3.callback)
function v_u_3.children(p_u_303)
    local v304 = v_u_302
    assert(v304(p_u_303))
    return function(p305)
        local v306, v307 = v_u_3.Instance(p305)
        if not v306 then
            return false, v307 or ""
        end
        local v308 = {}
        for _, v309 in ipairs(p305:GetChildren()) do
            local v310 = v309.Name
            if p_u_303[v310] then
                if v308[v310] then
                    return false, string.format("Cannot process multiple children with the same name %q", v310)
                end
                v308[v310] = v309
            end
        end
        for v311, v312 in pairs(p_u_303) do
            local v313, v314 = v312(v308[v311])
            if not v313 then
                return false, string.format("[%s.%s] %s", p305:GetFullName(), v311, v314 or "")
            end
        end
        return true
    end
end
return v_u_3