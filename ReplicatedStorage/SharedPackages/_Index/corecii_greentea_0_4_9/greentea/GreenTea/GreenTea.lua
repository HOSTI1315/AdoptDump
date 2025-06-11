--// ReplicatedStorage.SharedPackages._Index.corecii_greentea@0.4.9.greentea.GreenTea (ModuleScript)

local v_u_1 = {}
local function v_u_8(p2)
    local v3 = 1
    local v4 = 0
    while true do
        local v5, v6 = string.find(p2, "[^\n]+", v3)
        if not (v5 and v6) then
            break
        end
        local v7 = v6 - v5 + 1
        if v4 >= v7 then
            v7 = v4
        end
        v3 = v6 + 1
        v4 = v7
    end
    return v4
end
local function v_u_15(p9)
    local v10 = nil
    for _, v11 in string.split(p9, "\n") do
        local v12, v13 = string.find(v11, "^ *")
        if v12 and v13 then
            local v14 = v13 - v12 + 1
            if not v10 or v14 < v10 then
                v10 = v14
            end
        end
    end
    return v10 or 0
end
local function v_u_17(p16)
    return string.gsub(p16, "\n", "\n    ")
end
local function v_u_35(p18)
    if typeof(p18) ~= "table" then
        ::l2::
        local v19 = tonumber(p18)
        if v19 then
            return {
                ["min"] = nil,
                ["minExclusive"] = false,
                ["max"] = v19,
                ["maxExclusive"] = false
            }
        end
        local v20 = type(p18) == "string"
        assert(v20, "analysis hint")
        local v21, v22, v23, v24 = string.match(p18, (("^%%s*(%*)%%s*(%*),%%s*(%*)%%s*(%*)%%s*$"):format("[%[%(]", ".-", ".-", "[%]%)]")))
        if not v21 then
            error("invalid range string, expected format: one of \"[min, max]\", \"(min, max)\", \"[min, max)\", \"(min, max]\", or \"max\" (leave min/max empty for no limit)")
        end
        local v25 = v21 == "("
        local v26 = v24 == ")"
        local v27
        if v22 == "" then
            v27 = nil
            v25 = false
        else
            v27 = tonumber(v22)
            if not v27 then
                error((("invalid number for min in range string: %*"):format(v22)))
            end
        end
        local v28
        if v23 == "" then
            v28 = nil
            v26 = false
        else
            v28 = tonumber(v23)
            if not v28 then
                error((("invalid number for max in range string: %*"):format(v23)))
            end
        end
        return {
            ["min"] = v27,
            ["minExclusive"] = v25,
            ["max"] = v28,
            ["maxExclusive"] = v26
        }
    end
    local v29 = p18.min
    if typeof(v29) == "number" then
        local v30 = p18.max
        if typeof(v30) == "number" then
            if p18.minExclusive ~= nil then
                local v31 = p18.minExclusive
                if typeof(v31) ~= "boolean" then
                    goto l4
                end
            end
            if p18.maxExclusive ~= nil then
                local v32 = p18.maxExclusive
                if typeof(v32) ~= "boolean" then
                    goto l4
                end
            end
            local v33 = {
                ["min"] = p18.min
            }
            local v34
            if p18.min then
                v34 = p18.minExclusive or false
            else
                v34 = false
            end
            v33.minExclusive = v34
            v33.max = p18.max
            v33.maxExclusive = p18.max and p18.maxExclusive or false
            return v33
        end
    end
    ::l4::
    error("invalid range table")
    goto l2
end
local v_u_36 = {
    ["__greenteaConstructorsSet"] = v_u_1
}
local v_u_38 = {
    ["__tostring"] = function(p37)
        return p37.ok and "ok" or p37:formatErr()
    end
}
local function v_u_39(...)
    return {
        ["__tuple"] = table.pack(...)
    }
end
local function v_u_43(p40)
    if type(p40) ~= "table" or not p40.__tuple then
        return p40
    end
    local v41 = p40.__tuple
    local v42 = p40.__tuple.n
    return unpack(v41, 1, v42)
end
local v_u_44 = {}
local function v_u_46(p45, ...)
    return p45.ok and "ok" or (p45.encompassingType or p45.errs[#p45.errs].type):formatErr(p45)
end
function v_u_44.new(p47, p48)
    local v49 = {
        ["ok"] = p47,
        ["errs"] = p48,
        ["formatErr"] = v_u_46
    }
    local v50 = v_u_38
    return setmetatable(v49, v50)
end
function v_u_44.ok()
    return v_u_44.new(true, {})
end
function v_u_44.extendOk(p51)
    return p51 or v_u_44.new(true, {})
end
function v_u_44.err(p52, p53, p54)
    return v_u_44.new(false, {
        {
            ["type"] = p52,
            ["input"] = p53,
            ["message"] = p54
        }
    })
end
function v_u_44.extendErr(p55, p56, p57, p58)
    if not p55 then
        return v_u_44.new(false, {
            {
                ["type"] = p56,
                ["input"] = p57,
                ["message"] = p58
            }
        })
    end
    local v59 = p55.errs
    table.insert(v59, {
        ["type"] = p56,
        ["input"] = p57,
        ["message"] = p58
    })
    return p55
end
function v_u_44.errs(p60)
    return v_u_44.new(false, p60)
end
function v_u_44.extendErrs(p61, p62)
    if not p61 then
        return v_u_44.new(false, p62)
    end
    table.move(p62, 1, #p62, #p61.errs + 1, p61.errs)
    return p61
end
local v_u_63 = {}
v_u_63.__index = v_u_63
function v_u_63.matches(p64, ...)
    local v65 = p64._matches(...)
    v65.encompassingType = p64
    return v65.ok, v65
end
function v_u_63.assert(p66, ...)
    local v67, v68 = p66:matches(...)
    if not v67 then
        error(v68:formatErr())
    end
    return ...
end
function v_u_63.format(p69)
    return p69._format({}, 80, {})
end
function v_u_63.wrapFn(p_u_70, p_u_71)
    local v72 = typeof(p_u_71) == "function"
    assert(v72, "fn must be a function")
    local v73 = p_u_70.fn ~= nil
    assert(v73, "self must be a GreenTea.fn type")
    return function(...)
        p_u_70.fn.args:assert(...)
        return p_u_70.fn.returns:assert(p_u_71(...))
    end
end
function v_u_63.type(p74)
    return p74
end
local function v_u_81(p75, p76)
    if pcall(utf8.graphemes, p76) ~= true then
        return "<invalid unicode>"
    end
    if #p76 < p75 then
        return p76
    end
    local v77 = {}
    for v78, v79 in utf8.graphemes(p76) do
        local v80 = p76:sub(v78, v79)
        table.insert(v77, v80)
        if p75 <= #v77 then
            return ("[%*...]"):format((table.concat(v77)))
        end
    end
    return p76
end
function v_u_63.__call(p82, ...)
    local v83, v84 = p82:matches(...)
    if v83 then
        return true
    else
        return false, tostring(v84)
    end
end
function v_u_63.__tostring(p85)
    return ("GreenTea.Type(%*)"):format((p85:format()))
end
local function v_u_87(p86)
    if typeof(p86) == "string" then
        return string.format("%q", p86)
    else
        return tostring(p86)
    end
end
local function v_u_101(...)
    local v88, v89
    if select("#", ...) <= 1 then
        local v90 = ...
        if v90 and (typeof(v90) == "table" and v90.__tuple) then
            return v_u_101(v_u_43(v90))
        end
        if typeof(...) == "string" then
            v88 = string.format("%q", ...)
        else
            v88 = tostring(...)
        end
        v89 = typeof(...)
    else
        local v91 = select("#", ...)
        local v92 = table.create(v91)
        local v93 = table.create(v91)
        local v94 = table.create(v91)
        for v95 = 1, select("#", ...) do
            local v96 = select(v95, ...)
            local v97 = v_u_36.typeof
            table.insert(v92, v97(v96))
            local v98
            if typeof(v96) == "string" then
                v98 = string.format("%q", v96)
            else
                v98 = tostring(v96)
            end
            table.insert(v93, v98)
            local v99 = typeof(v96)
            table.insert(v94, v99)
        end
        v89 = ("(%*)"):format((table.concat(v94, ", ")))
        v88 = ("(%*)"):format((table.concat(v93, ", ")))
    end
    local v100 = v_u_81(20, v88)
    return ("%* (%*)"):format(v_u_81(20, v89), v100)
end
function v_u_63.formatErr(p102, p103)
    local v104 = p103.errs[1]
    local v105
    if v104.message then
        v105 = string.gsub(v104.message, "$input", v_u_101(v104.input))
    else
        v105 = ("expected %*, got %*"):format(v104.type:format(), (v_u_101(v104.input)))
    end
    local v106 = {}
    for v107, v108 in p103.errs do
        if v108.message or v107 == 1 then
            v106[v108.type] = ("error%*"):format(v107)
        end
    end
    local v109 = ("\n%*\n"):format((p102._format(v106, 80, {})))
    local v110 = {}
    for v111 in string.gmatch(v109, "%$%$error(%d+)%$:") do
        local v112 = tonumber(v111)
        table.insert(v110, v112)
    end
    for v113 = #v110, 1, -1 do
        local v_u_114 = v110[v113]
        local v_u_115 = p103.errs[v_u_114]
        v109 = string.gsub(v109, ("([^\n]*)$$error%*$:(.*):$error%*$$([^\n]*)\n(.*)$"):format(v_u_114, v_u_114), function(p116, p117, p118, p119)
            local v120
            if string.find(p117, "\n", 1, true) == nil then
                local v121 = string.gsub(string.gsub(p116, "%$%$error%d+%$:", ""), ":%$error%d+%$%$", "")
                v120 = string.rep(" ", #v121) .. string.rep("^", #p117)
            else
                local v122 = ("%*%*%*"):format(p116, p117, p118)
                local v123 = v_u_8(v122)
                local v124 = v_u_15(v122)
                v120 = string.rep(" ", v124) .. string.rep("^", v123 - v124)
            end
            if v_u_115.message then
                v120 = ("%* $$error%*$$"):format(v120, v_u_114)
            end
            local v125 = {}
            while true do
                local v126, v127 = string.match(p119, "^([^\n]*)\n(.*)$")
                if not (v126 and (v127 and string.match(v126, "^%s*^"))) then
                    break
                end
                table.insert(v125, v126)
                p119 = v127
            end
            if v125[1] then
                return ("%*%*%*\n%*\n%*\n%*"):format(p116, p117, p118, table.concat(v125, "\n"), v120, p119)
            else
                return ("%*%*%*\n%*\n%*"):format(p116, p117, p118, v120, p119)
            end
        end)
    end
    for v128, v129 in p103.errs do
        if v129.message then
            local v130 = string.gsub(v129.message, "$input", v_u_101(v129.input))
            v109 = string.gsub(v109, ("%%$%%$error%*%%$%%$"):format(v128), v130)
        end
    end
    return ("%*%*"):format(v105, (string.gsub(v109, "\n(%s*)(^+) ([^\n]+)", function(p131, p132, p133)
        if #p131 + #p132 + #p133 + 1 <= 80 then
            return nil
        else
            return ("\n%*%*\n%*%*"):format(p131, p132, string.rep(" ", #p131), p133)
        end
    end):sub(1, -2)))
end
function v_u_36.isGreenTeaType(p134)
    local v135
    if typeof(p134) == "table" then
        v135 = getmetatable(p134) == v_u_63
    else
        v135 = false
    end
    return v135
end
v_u_36.isGtType = v_u_36.isGreenTeaType
function v_u_36.__newBasicType(p_u_136, p_u_137)
    return function()
        local v_u_138 = nil
        local v139 = {
            ["kind"] = "basic"
        }
        local v140 = {}
        local v141
        if p_u_137 then
            v141 = nil
        else
            v141 = p_u_136
        end
        v140.typeof = v141
        local v142
        if p_u_137 then
            v142 = p_u_136
        else
            v142 = nil
        end
        v140.type = v142
        v139.basic = v140
        function v139._matches(p143, ...)
            if (p_u_137 and type(p143) or typeof(p143)) == p_u_136 then
                return v_u_44.ok()
            else
                return v_u_44.err(v_u_138, p143, (("expected %*, got $input"):format(p_u_136)))
            end
        end
        function v139._format(p144, _, _)
            local v145 = p_u_136
            local v146 = p144[v_u_138]
            if v146 then
                return ("$$%*$:%*:$%*$$"):format(v146, v145, v146)
            else
                return v145
            end
        end
        local v147 = v139
        local v148 = v_u_63
        local v149 = v147
        return setmetatable(v149, v148)
    end
end
function v_u_36.any(p_u_150)
    if p_u_150 then
        p_u_150 = p_u_150.allowNil
    end
    local v_u_151 = nil
    local v155 = {
        ["kind"] = "any",
        ["any"] = {
            ["allowNil"] = p_u_150 or nil
        },
        ["_matches"] = function(p152, ...)
            if p_u_150 or p152 ~= nil then
                return v_u_44.ok()
            else
                return v_u_44.err(v_u_151, p152, "expected non-nil, got nil")
            end
        end,
        ["_format"] = function(p153, _, _)
            local v154 = p153[v_u_151]
            return not v154 and "any" or ("$$%*$:%*:$%*$$"):format(v154, "any", v154)
        end
    }
    v_u_151 = v155
    local v156 = v_u_63
    local v157 = v_u_151
    return setmetatable(v157, v156)
end
function v_u_36.unknown(p_u_158)
    if p_u_158 then
        p_u_158 = p_u_158.allowNil
    end
    local v_u_159 = nil
    local v163 = {
        ["kind"] = "unknown",
        ["unknown"] = {
            ["allowNil"] = p_u_158 or nil
        },
        ["_matches"] = function(p160, ...)
            if p_u_158 or p160 ~= nil then
                return v_u_44.ok()
            else
                return v_u_44.err(v_u_159, p160, "expected non-nil, got nil")
            end
        end,
        ["_format"] = function(p161, _, _)
            local v162 = p161[v_u_159]
            return not v162 and "unknown" or ("$$%*$:%*:$%*$$"):format(v162, "unknown", v162)
        end
    }
    v_u_159 = v163
    local v164 = v_u_63
    local v165 = v_u_159
    return setmetatable(v165, v164)
end
function v_u_36.never()
    local v_u_166 = nil
    v_u_166 = {
        ["kind"] = "never",
        ["_matches"] = function(p167, ...)
            return v_u_44.err(v_u_166, p167, "expected never, got $input")
        end,
        ["_format"] = function(p168, _, _)
            local v169 = p168[v_u_166]
            return not v169 and "never" or ("$$%*$:%*:$%*$$"):format(v169, "never", v169)
        end
    }
    local v170 = v_u_63
    local v171 = v_u_166
    return setmetatable(v171, v170)
end
function v_u_36.boolean()
    return nil
end
local v_u_172 = nil
local v_u_173 = "boolean"
function v_u_36.boolean()
    local v_u_174 = nil
    local v175 = {
        ["kind"] = "basic"
    }
    local v176 = {}
    local v177
    if v_u_172 then
        v177 = nil
    else
        v177 = v_u_173
    end
    v176.typeof = v177
    local v178
    if v_u_172 then
        v178 = v_u_173
    else
        v178 = nil
    end
    v176.type = v178
    v175.basic = v176
    function v175._matches(p179, ...)
        if (v_u_172 and type(p179) or typeof(p179)) == v_u_173 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_174, p179, (("expected %*, got $input"):format(v_u_173)))
        end
    end
    function v175._format(p180, _, _)
        local v181 = v_u_173
        local v182 = p180[v_u_174]
        if v182 then
            return ("$$%*$:%*:$%*$$"):format(v182, v181, v182)
        else
            return v181
        end
    end
    local v183 = v175
    local v184 = v_u_63
    local v185 = v183
    return setmetatable(v185, v184)
end
v_u_36.bool = v_u_36.boolean
function v_u_36.Instance()
    return nil
end
local v_u_186 = nil
local v_u_187 = "Instance"
function v_u_36.Instance()
    local v_u_188 = nil
    local v189 = {
        ["kind"] = "basic"
    }
    local v190 = {}
    local v191
    if v_u_186 then
        v191 = nil
    else
        v191 = v_u_187
    end
    v190.typeof = v191
    local v192
    if v_u_186 then
        v192 = v_u_187
    else
        v192 = nil
    end
    v190.type = v192
    v189.basic = v190
    function v189._matches(p193, ...)
        if (v_u_186 and type(p193) or typeof(p193)) == v_u_187 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_188, p193, (("expected %*, got $input"):format(v_u_187)))
        end
    end
    function v189._format(p194, _, _)
        local v195 = v_u_187
        local v196 = p194[v_u_188]
        if v196 then
            return ("$$%*$:%*:$%*$$"):format(v196, v195, v196)
        else
            return v195
        end
    end
    local v197 = v189
    local v198 = v_u_63
    local v199 = v197
    return setmetatable(v199, v198)
end
local v_u_200 = {
    "dead",
    "normal",
    "running",
    "suspended"
}
function v_u_36.coroutine(p201)
    local v_u_202, v_u_203
    if p201 and p201.status then
        v_u_202 = {}
        local v204 = p201.status
        if type(v204) == "string" then
            v_u_202[p201.status] = true
        else
            local v205 = p201.status
            if type(v205) == "table" then
                for _, v206 in p201.status do
                    v_u_202[v206] = true
                end
            end
        end
        local v207 = {}
        for v208, _ in v_u_202 do
            if not table.find(v_u_200, v208) then
                error((("%* is not a valid coroutine status"):format(v208)))
            end
            table.insert(v207, v208)
        end
        table.sort(v207)
        v_u_203 = table.concat(v207, " | ")
        if #v207 > 1 then
            v_u_203 = ("(%*)"):format(v_u_203)
        end
    else
        v_u_202 = nil
        v_u_203 = "any"
    end
    local v_u_209 = nil
    local v216 = {
        ["kind"] = "thread",
        ["thread"] = {
            ["status"] = v_u_202
        },
        ["_matches"] = function(p210, ...)
            if type(p210) ~= "thread" then
                return v_u_44.err(v_u_209, p210, "expected thread, got $input")
            end
            if v_u_202 then
                local v211 = coroutine.status(p210)
                if not v_u_202[v211] then
                    return v_u_44.err(v_u_209, p210, (("expected thread with status %*, got thread with status %*"):format(v_u_203, v211)))
                end
            end
            return v_u_44.ok()
        end,
        ["_format"] = function(p212, _, _)
            if v_u_202 then
                local v213 = ("thread<status: %*>"):format(v_u_203)
                local v214 = p212[v_u_209]
                if v214 then
                    return ("$$%*$:%*:$%*$$"):format(v214, v213, v214)
                else
                    return v213
                end
            else
                local v215 = p212[v_u_209]
                return not v215 and "thread" or ("$$%*$:%*:$%*$$"):format(v215, "thread", v215)
            end
        end
    }
    v_u_209 = v216
    local v217 = v_u_63
    local v218 = v_u_209
    return setmetatable(v218, v217)
end
v_u_36.thread = v_u_36.coroutine
function v_u_36.buffer()
    return nil
end
local v_u_219 = nil
local v_u_220 = "buffer"
function v_u_36.buffer()
    local v_u_221 = nil
    local v222 = {
        ["kind"] = "basic"
    }
    local v223 = {}
    local v224
    if v_u_219 then
        v224 = nil
    else
        v224 = v_u_220
    end
    v223.typeof = v224
    local v225
    if v_u_219 then
        v225 = v_u_220
    else
        v225 = nil
    end
    v223.type = v225
    v222.basic = v223
    function v222._matches(p226, ...)
        if (v_u_219 and type(p226) or typeof(p226)) == v_u_220 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_221, p226, (("expected %*, got $input"):format(v_u_220)))
        end
    end
    function v222._format(p227, _, _)
        local v228 = v_u_220
        local v229 = p227[v_u_221]
        if v229 then
            return ("$$%*$:%*:$%*$$"):format(v229, v228, v229)
        else
            return v228
        end
    end
    local v230 = v222
    local v231 = v_u_63
    local v232 = v230
    return setmetatable(v232, v231)
end
local v_u_233 = true
local v_u_234 = "userdata"
function v_u_36.userdata()
    local v_u_235 = nil
    local v236 = {
        ["kind"] = "basic"
    }
    local v237 = {}
    local v238
    if v_u_233 then
        v238 = nil
    else
        v238 = v_u_234
    end
    v237.typeof = v238
    local v239
    if v_u_233 then
        v239 = v_u_234
    else
        v239 = nil
    end
    v237.type = v239
    v236.basic = v237
    function v236._matches(p240, ...)
        if (v_u_233 and type(p240) or typeof(p240)) == v_u_234 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_235, p240, (("expected %*, got $input"):format(v_u_234)))
        end
    end
    function v236._format(p241, _, _)
        local v242 = v_u_234
        local v243 = p241[v_u_235]
        if v243 then
            return ("$$%*$:%*:$%*$$"):format(v243, v242, v243)
        else
            return v242
        end
    end
    local v244 = v236
    local v245 = v_u_63
    local v246 = v244
    return setmetatable(v246, v245)
end
local v_u_247 = nil
local v_u_248 = "Vector2"
function v_u_36.Vector2()
    local v_u_249 = nil
    local v250 = {
        ["kind"] = "basic"
    }
    local v251 = {}
    local v252
    if v_u_247 then
        v252 = nil
    else
        v252 = v_u_248
    end
    v251.typeof = v252
    local v253
    if v_u_247 then
        v253 = v_u_248
    else
        v253 = nil
    end
    v251.type = v253
    v250.basic = v251
    function v250._matches(p254, ...)
        if (v_u_247 and type(p254) or typeof(p254)) == v_u_248 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_249, p254, (("expected %*, got $input"):format(v_u_248)))
        end
    end
    function v250._format(p255, _, _)
        local v256 = v_u_248
        local v257 = p255[v_u_249]
        if v257 then
            return ("$$%*$:%*:$%*$$"):format(v257, v256, v257)
        else
            return v256
        end
    end
    local v258 = v250
    local v259 = v_u_63
    local v260 = v258
    return setmetatable(v260, v259)
end
local v_u_261 = true
local v_u_262 = "vector"
function v_u_36.vector()
    local v_u_263 = nil
    local v264 = {
        ["kind"] = "basic"
    }
    local v265 = {}
    local v266
    if v_u_261 then
        v266 = nil
    else
        v266 = v_u_262
    end
    v265.typeof = v266
    local v267
    if v_u_261 then
        v267 = v_u_262
    else
        v267 = nil
    end
    v265.type = v267
    v264.basic = v265
    function v264._matches(p268, ...)
        if (v_u_261 and type(p268) or typeof(p268)) == v_u_262 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_263, p268, (("expected %*, got $input"):format(v_u_262)))
        end
    end
    function v264._format(p269, _, _)
        local v270 = v_u_262
        local v271 = p269[v_u_263]
        if v271 then
            return ("$$%*$:%*:$%*$$"):format(v271, v270, v271)
        else
            return v270
        end
    end
    local v272 = v264
    local v273 = v_u_63
    local v274 = v272
    return setmetatable(v274, v273)
end
local v_u_275 = nil
local v_u_276 = "Vector3"
function v_u_36.Vector3()
    local v_u_277 = nil
    local v278 = {
        ["kind"] = "basic"
    }
    local v279 = {}
    local v280
    if v_u_275 then
        v280 = nil
    else
        v280 = v_u_276
    end
    v279.typeof = v280
    local v281
    if v_u_275 then
        v281 = v_u_276
    else
        v281 = nil
    end
    v279.type = v281
    v278.basic = v279
    function v278._matches(p282, ...)
        if (v_u_275 and type(p282) or typeof(p282)) == v_u_276 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_277, p282, (("expected %*, got $input"):format(v_u_276)))
        end
    end
    function v278._format(p283, _, _)
        local v284 = v_u_276
        local v285 = p283[v_u_277]
        if v285 then
            return ("$$%*$:%*:$%*$$"):format(v285, v284, v285)
        else
            return v284
        end
    end
    local v286 = v278
    local v287 = v_u_63
    local v288 = v286
    return setmetatable(v288, v287)
end
local v_u_289 = nil
local v_u_290 = "CFrame"
function v_u_36.CFrame()
    local v_u_291 = nil
    local v292 = {
        ["kind"] = "basic"
    }
    local v293 = {}
    local v294
    if v_u_289 then
        v294 = nil
    else
        v294 = v_u_290
    end
    v293.typeof = v294
    local v295
    if v_u_289 then
        v295 = v_u_290
    else
        v295 = nil
    end
    v293.type = v295
    v292.basic = v293
    function v292._matches(p296, ...)
        if (v_u_289 and type(p296) or typeof(p296)) == v_u_290 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_291, p296, (("expected %*, got $input"):format(v_u_290)))
        end
    end
    function v292._format(p297, _, _)
        local v298 = v_u_290
        local v299 = p297[v_u_291]
        if v299 then
            return ("$$%*$:%*:$%*$$"):format(v299, v298, v299)
        else
            return v298
        end
    end
    local v300 = v292
    local v301 = v_u_63
    local v302 = v300
    return setmetatable(v302, v301)
end
local v_u_303 = nil
local v_u_304 = "Color3"
function v_u_36.Color3()
    local v_u_305 = nil
    local v306 = {
        ["kind"] = "basic"
    }
    local v307 = {}
    local v308
    if v_u_303 then
        v308 = nil
    else
        v308 = v_u_304
    end
    v307.typeof = v308
    local v309
    if v_u_303 then
        v309 = v_u_304
    else
        v309 = nil
    end
    v307.type = v309
    v306.basic = v307
    function v306._matches(p310, ...)
        if (v_u_303 and type(p310) or typeof(p310)) == v_u_304 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_305, p310, (("expected %*, got $input"):format(v_u_304)))
        end
    end
    function v306._format(p311, _, _)
        local v312 = v_u_304
        local v313 = p311[v_u_305]
        if v313 then
            return ("$$%*$:%*:$%*$$"):format(v313, v312, v313)
        else
            return v312
        end
    end
    local v314 = v306
    local v315 = v_u_63
    local v316 = v314
    return setmetatable(v316, v315)
end
local v_u_317 = nil
local v_u_318 = "UDim"
function v_u_36.UDim()
    local v_u_319 = nil
    local v320 = {
        ["kind"] = "basic"
    }
    local v321 = {}
    local v322
    if v_u_317 then
        v322 = nil
    else
        v322 = v_u_318
    end
    v321.typeof = v322
    local v323
    if v_u_317 then
        v323 = v_u_318
    else
        v323 = nil
    end
    v321.type = v323
    v320.basic = v321
    function v320._matches(p324, ...)
        if (v_u_317 and type(p324) or typeof(p324)) == v_u_318 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_319, p324, (("expected %*, got $input"):format(v_u_318)))
        end
    end
    function v320._format(p325, _, _)
        local v326 = v_u_318
        local v327 = p325[v_u_319]
        if v327 then
            return ("$$%*$:%*:$%*$$"):format(v327, v326, v327)
        else
            return v326
        end
    end
    local v328 = v320
    local v329 = v_u_63
    local v330 = v328
    return setmetatable(v330, v329)
end
local v_u_331 = nil
local v_u_332 = "UDim2"
function v_u_36.UDim2()
    local v_u_333 = nil
    local v334 = {
        ["kind"] = "basic"
    }
    local v335 = {}
    local v336
    if v_u_331 then
        v336 = nil
    else
        v336 = v_u_332
    end
    v335.typeof = v336
    local v337
    if v_u_331 then
        v337 = v_u_332
    else
        v337 = nil
    end
    v335.type = v337
    v334.basic = v335
    function v334._matches(p338, ...)
        if (v_u_331 and type(p338) or typeof(p338)) == v_u_332 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_333, p338, (("expected %*, got $input"):format(v_u_332)))
        end
    end
    function v334._format(p339, _, _)
        local v340 = v_u_332
        local v341 = p339[v_u_333]
        if v341 then
            return ("$$%*$:%*:$%*$$"):format(v341, v340, v341)
        else
            return v340
        end
    end
    local v342 = v334
    local v343 = v_u_63
    local v344 = v342
    return setmetatable(v344, v343)
end
local v_u_345 = nil
local v_u_346 = "Ray"
function v_u_36.Ray()
    local v_u_347 = nil
    local v348 = {
        ["kind"] = "basic"
    }
    local v349 = {}
    local v350
    if v_u_345 then
        v350 = nil
    else
        v350 = v_u_346
    end
    v349.typeof = v350
    local v351
    if v_u_345 then
        v351 = v_u_346
    else
        v351 = nil
    end
    v349.type = v351
    v348.basic = v349
    function v348._matches(p352, ...)
        if (v_u_345 and type(p352) or typeof(p352)) == v_u_346 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_347, p352, (("expected %*, got $input"):format(v_u_346)))
        end
    end
    function v348._format(p353, _, _)
        local v354 = v_u_346
        local v355 = p353[v_u_347]
        if v355 then
            return ("$$%*$:%*:$%*$$"):format(v355, v354, v355)
        else
            return v354
        end
    end
    local v356 = v348
    local v357 = v_u_63
    local v358 = v356
    return setmetatable(v358, v357)
end
local v_u_359 = nil
local v_u_360 = "Rect"
function v_u_36.Rect()
    local v_u_361 = nil
    local v362 = {
        ["kind"] = "basic"
    }
    local v363 = {}
    local v364
    if v_u_359 then
        v364 = nil
    else
        v364 = v_u_360
    end
    v363.typeof = v364
    local v365
    if v_u_359 then
        v365 = v_u_360
    else
        v365 = nil
    end
    v363.type = v365
    v362.basic = v363
    function v362._matches(p366, ...)
        if (v_u_359 and type(p366) or typeof(p366)) == v_u_360 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_361, p366, (("expected %*, got $input"):format(v_u_360)))
        end
    end
    function v362._format(p367, _, _)
        local v368 = v_u_360
        local v369 = p367[v_u_361]
        if v369 then
            return ("$$%*$:%*:$%*$$"):format(v369, v368, v369)
        else
            return v368
        end
    end
    local v370 = v362
    local v371 = v_u_63
    local v372 = v370
    return setmetatable(v372, v371)
end
local v_u_373 = nil
local v_u_374 = "Region3"
function v_u_36.Region3()
    local v_u_375 = nil
    local v376 = {
        ["kind"] = "basic"
    }
    local v377 = {}
    local v378
    if v_u_373 then
        v378 = nil
    else
        v378 = v_u_374
    end
    v377.typeof = v378
    local v379
    if v_u_373 then
        v379 = v_u_374
    else
        v379 = nil
    end
    v377.type = v379
    v376.basic = v377
    function v376._matches(p380, ...)
        if (v_u_373 and type(p380) or typeof(p380)) == v_u_374 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_375, p380, (("expected %*, got $input"):format(v_u_374)))
        end
    end
    function v376._format(p381, _, _)
        local v382 = v_u_374
        local v383 = p381[v_u_375]
        if v383 then
            return ("$$%*$:%*:$%*$$"):format(v383, v382, v383)
        else
            return v382
        end
    end
    local v384 = v376
    local v385 = v_u_63
    local v386 = v384
    return setmetatable(v386, v385)
end
local v_u_387 = nil
local v_u_388 = "BrickColor"
function v_u_36.BrickColor()
    local v_u_389 = nil
    local v390 = {
        ["kind"] = "basic"
    }
    local v391 = {}
    local v392
    if v_u_387 then
        v392 = nil
    else
        v392 = v_u_388
    end
    v391.typeof = v392
    local v393
    if v_u_387 then
        v393 = v_u_388
    else
        v393 = nil
    end
    v391.type = v393
    v390.basic = v391
    function v390._matches(p394, ...)
        if (v_u_387 and type(p394) or typeof(p394)) == v_u_388 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_389, p394, (("expected %*, got $input"):format(v_u_388)))
        end
    end
    function v390._format(p395, _, _)
        local v396 = v_u_388
        local v397 = p395[v_u_389]
        if v397 then
            return ("$$%*$:%*:$%*$$"):format(v397, v396, v397)
        else
            return v396
        end
    end
    local v398 = v390
    local v399 = v_u_63
    local v400 = v398
    return setmetatable(v400, v399)
end
local v_u_401 = nil
local v_u_402 = "Font"
function v_u_36.Font()
    local v_u_403 = nil
    local v404 = {
        ["kind"] = "basic"
    }
    local v405 = {}
    local v406
    if v_u_401 then
        v406 = nil
    else
        v406 = v_u_402
    end
    v405.typeof = v406
    local v407
    if v_u_401 then
        v407 = v_u_402
    else
        v407 = nil
    end
    v405.type = v407
    v404.basic = v405
    function v404._matches(p408, ...)
        if (v_u_401 and type(p408) or typeof(p408)) == v_u_402 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_403, p408, (("expected %*, got $input"):format(v_u_402)))
        end
    end
    function v404._format(p409, _, _)
        local v410 = v_u_402
        local v411 = p409[v_u_403]
        if v411 then
            return ("$$%*$:%*:$%*$$"):format(v411, v410, v411)
        else
            return v410
        end
    end
    local v412 = v404
    local v413 = v_u_63
    local v414 = v412
    return setmetatable(v414, v413)
end
local v_u_415 = nil
local v_u_416 = "Enum"
function v_u_36.Enum()
    local v_u_417 = nil
    local v418 = {
        ["kind"] = "basic"
    }
    local v419 = {}
    local v420
    if v_u_415 then
        v420 = nil
    else
        v420 = v_u_416
    end
    v419.typeof = v420
    local v421
    if v_u_415 then
        v421 = v_u_416
    else
        v421 = nil
    end
    v419.type = v421
    v418.basic = v419
    function v418._matches(p422, ...)
        if (v_u_415 and type(p422) or typeof(p422)) == v_u_416 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_417, p422, (("expected %*, got $input"):format(v_u_416)))
        end
    end
    function v418._format(p423, _, _)
        local v424 = v_u_416
        local v425 = p423[v_u_417]
        if v425 then
            return ("$$%*$:%*:$%*$$"):format(v425, v424, v425)
        else
            return v424
        end
    end
    local v426 = v418
    local v427 = v_u_63
    local v428 = v426
    return setmetatable(v428, v427)
end
local v_u_429 = nil
local v_u_430 = "EnumItem"
function v_u_36.EnumItem()
    local v_u_431 = nil
    local v432 = {
        ["kind"] = "basic"
    }
    local v433 = {}
    local v434
    if v_u_429 then
        v434 = nil
    else
        v434 = v_u_430
    end
    v433.typeof = v434
    local v435
    if v_u_429 then
        v435 = v_u_430
    else
        v435 = nil
    end
    v433.type = v435
    v432.basic = v433
    function v432._matches(p436, ...)
        if (v_u_429 and type(p436) or typeof(p436)) == v_u_430 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_431, p436, (("expected %*, got $input"):format(v_u_430)))
        end
    end
    function v432._format(p437, _, _)
        local v438 = v_u_430
        local v439 = p437[v_u_431]
        if v439 then
            return ("$$%*$:%*:$%*$$"):format(v439, v438, v439)
        else
            return v438
        end
    end
    local v440 = v432
    local v441 = v_u_63
    local v442 = v440
    return setmetatable(v442, v441)
end
function v_u_36.none()
    return nil
end
local v_u_443 = nil
local v_u_444 = "nil"
function v_u_36.none()
    local v_u_445 = nil
    local v446 = {
        ["kind"] = "basic"
    }
    local v447 = {}
    local v448
    if v_u_443 then
        v448 = nil
    else
        v448 = v_u_444
    end
    v447.typeof = v448
    local v449
    if v_u_443 then
        v449 = v_u_444
    else
        v449 = nil
    end
    v447.type = v449
    v446.basic = v447
    function v446._matches(p450, ...)
        if (v_u_443 and type(p450) or typeof(p450)) == v_u_444 then
            return v_u_44.ok()
        else
            return v_u_44.err(v_u_445, p450, (("expected %*, got $input"):format(v_u_444)))
        end
    end
    function v446._format(p451, _, _)
        local v452 = v_u_444
        local v453 = p451[v_u_445]
        if v453 then
            return ("$$%*$:%*:$%*$$"):format(v453, v452, v453)
        else
            return v452
        end
    end
    local v454 = v446
    local v455 = v_u_63
    local v456 = v454
    return setmetatable(v456, v455)
end
function v_u_36.literal(p_u_457)
    local v_u_458
    if typeof(p_u_457) == "string" then
        v_u_458 = string.format("%q", p_u_457)
    else
        v_u_458 = tostring(p_u_457)
    end
    local v_u_459 = nil
    local v465 = {
        ["kind"] = "literal",
        ["literal"] = {
            ["value"] = p_u_457
        },
        ["_matches"] = function(p460, ...)
            if p460 == p_u_457 then
                return v_u_44.ok()
            else
                return v_u_44.err(v_u_459, p460, (("expected literally %*, got $input"):format(v_u_458)))
            end
        end,
        ["_format"] = function(p461, _, _)
            local v462 = p_u_457
            local v463
            if typeof(v462) == "string" then
                v463 = v_u_458
            else
                v463 = ("literal<%*>"):format(v_u_458)
            end
            local v464 = p461[v_u_459]
            if v464 then
                return ("$$%*$:%*:$%*$$"):format(v464, v463, v464)
            else
                return v463
            end
        end
    }
    v_u_459 = v465
    local v466 = v_u_63
    local v467 = v_u_459
    return setmetatable(v467, v466)
end
local v_u_468 = {
    "spec",
    "t",
    "d",
    "story",
    "storybook",
    "bench"
}
function v_u_36.withCustom(p469, p_u_470, p_u_471)
    if not p_u_471 then
        local v472, v473, v474 = debug.info(p_u_470, "sln")
        local v475 = v472 or "unknown"
        local v476 = v473 or 0
        p_u_471 = v474 or ""
        if p_u_471 == "" then
            local v477, v478 = string.match(v475, "([^%.]+)%.(.-)$")
            if v477 and v478 then
                if table.find(v_u_468, v478) then
                    p_u_471 = ("%*.%*:%*"):format(v477, v478, v476)
                else
                    p_u_471 = ("%*:%*"):format(v478, v476)
                end
            else
                p_u_471 = ("%*:%*"):format(v475, v476)
            end
        end
    end
    assert(p_u_471, "analysis hint")
    local v_u_479
    if p469 == nil then
        v_u_479 = nil
    else
        v_u_479 = v_u_36.typeof(p469)
    end
    local v_u_480 = nil
    v_u_480 = {
        ["kind"] = "custom",
        ["custom"] = {
            ["typechecker"] = p_u_470,
            ["name"] = p_u_471,
            ["type"] = v_u_479
        },
        ["_matches"] = function(p481, ...)
            if v_u_479 then
                local v482 = v_u_479._matches(p481)
                if not v482.ok then
                    return v_u_44.extendErr(v482, v_u_480, p481)
                end
            end
            local v483, v484 = p_u_470(p481)
            if v483 then
                return v_u_44.ok()
            else
                return v_u_44.err(v_u_480, p481, v484)
            end
        end,
        ["_format"] = function(p485, p486, p487)
            if p487[v_u_480] then
                return "<cyclic>"
            else
                p487[v_u_480] = true
                local v488 = ("custom<%*>"):format(p_u_471)
                local v489 = p485[v_u_480]
                if v489 then
                    v488 = ("$$%*$:%*:$%*$$"):format(v489, v488, v489)
                end
                if v_u_479 then
                    local v490 = v_u_479._format(p485, p486 - 1, p487)
                    local v491 = ("%* & %*"):format(v490, v488)
                    if p486 < #v491 then
                        return v_u_17((("%* & %*"):format(v490, v488)))
                    else
                        return v491
                    end
                else
                    return v488
                end
            end
        end
    }
    local v492 = v_u_63
    local v493 = v_u_480
    return setmetatable(v493, v492)
end
function v_u_36.custom(p494, p495)
    return v_u_36.withCustom(nil, p494, p495)
end
function v_u_36.__highlightWrap(p496, p497)
    if p497 then
        return ("$$%*$:%*:$%*$$"):format(p497, p496, p497)
    else
        return p496
    end
end
v_u_36.__Type = v_u_63
v_u_36.__Cause = v_u_44
function v_u_36.number(p_u_498)
    local v_u_499 = p_u_498 and p_u_498.range
    if v_u_499 then
        v_u_499 = v_u_35(p_u_498.range)
    end
    local v_u_500 = nil
    local v501 = {
        ["kind"] = "number"
    }
    local v502 = {
        ["range"] = v_u_499
    }
    local v503
    if p_u_498 then
        v503 = p_u_498.integer
    else
        v503 = p_u_498
    end
    v502.integer = v503
    local v504
    if p_u_498 then
        v504 = p_u_498.nan
    else
        v504 = p_u_498
    end
    v502.nan = v504
    v501.number = v502
    function v501._matches(p505, ...)
        if typeof(p505) ~= "number" then
            return v_u_44.err(v_u_500, p505, "expected number, got $input")
        end
        if not p_u_498 then
            ::l4::
            if p_u_498 and p_u_498.nan or p505 == p505 then
                return v_u_44.ok()
            else
                return v_u_44.err(v_u_500, p505, "input is NaN")
            end
        end
        if not v_u_499 then
            ::l6::
            if p_u_498.integer and p505 % 1 ~= 0 then
                return v_u_44.err(v_u_500, p505, (("input is not an integer (input: %*)"):format(p505)))
            end
            goto l4
        end
        local v506 = v_u_499
        local v507
        if v506.min then
            if v506.minExclusive then
                if p505 <= v506.min then
                    v507 = false
                    ::l13::
                    if not v507 then
                        return v_u_44.err(v_u_500, p505, (("input out of range (input: %*)"):format(p505)))
                    end
                    goto l6
                end
            elseif p505 < v506.min then
                v507 = false
                goto l13
            end
        end
        if v506.max then
            if v506.maxExclusive then
                v507 = v506.max > p505
            else
                v507 = v506.max >= p505
            end
        else
            v507 = true
        end
        goto l13
    end
    function v501._format(p508, _, _)
        if p_u_498 then
            local v509 = {}
            if p_u_498.integer then
                table.insert(v509, "integer")
            end
            if p_u_498.nan then
                table.insert(v509, "NaN allowed")
            end
            if v_u_499 then
                local v510 = "range %*"
                local v511 = v_u_499
                local v512
                if v511.min or v511.max then
                    local v513 = v511.minExclusive and "(" or "["
                    local v514 = v511.maxExclusive and ")" or "]"
                    v512 = v513 .. (v511.min or "") .. ", " .. (v511.max or "") .. v514
                else
                    v512 = "[-inf, inf]"
                end
                local v515 = v510:format(v512)
                table.insert(v509, v515)
            end
            if #v509 == 0 then
                local v516 = p508[v_u_500]
                return not v516 and "number" or ("$$%*$:%*:$%*$$"):format(v516, "number", v516)
            else
                local v517 = ("number<%*>"):format((table.concat(v509, ", ")))
                local v518 = p508[v_u_500]
                if v518 then
                    return ("$$%*$:%*:$%*$$"):format(v518, v517, v518)
                else
                    return v517
                end
            end
        else
            local v519 = p508[v_u_500]
            return not v519 and "number" or ("$$%*$:%*:$%*$$"):format(v519, "number", v519)
        end
    end
    local v520 = v501
    local v521 = v_u_63
    local v522 = v520
    return setmetatable(v522, v521)
end
local v_u_523 = {
    ["\r"] = "\\r",
    ["\n"] = "\\n",
    ["\t"] = "\\t"
}
function v_u_36.string(p_u_524)
    local v_u_525 = p_u_524 and p_u_524.bytes
    if v_u_525 then
        v_u_525 = v_u_35(p_u_524.bytes)
    end
    local v_u_526 = p_u_524 and p_u_524.graphemes
    if v_u_526 then
        v_u_526 = v_u_35(p_u_524.graphemes)
    end
    if v_u_526 and not v_u_525 then
        error("graphemes limit requires bytes limit. Graphemes have no upper limit on size, so if only graphemes limit is set, the byte limit is practically infinite. If you really want infinite byte length, set bytes to `[0, inf]`")
    end
    local v_u_527 = nil
    local v528 = {
        ["kind"] = "string"
    }
    local v529 = {}
    local v530
    if p_u_524 then
        v530 = p_u_524.pattern
    else
        v530 = p_u_524
    end
    v529.pattern = v530
    v529.bytes = v_u_525
    v529.graphemes = v_u_526
    local v531
    if p_u_524 then
        v531 = p_u_524.unicode
    else
        v531 = p_u_524
    end
    v529.unicode = v531
    v528.string = v529
    function v528._matches(p532, ...)
        if typeof(p532) ~= "string" then
            return v_u_44.err(v_u_527, p532, "expected string, got $input")
        end
        if not p_u_524 then
            ::l4::
            return v_u_44.ok()
        end
        if p_u_524.unicode and pcall(utf8.graphemes, p532) ~= true then
            return v_u_44.err(v_u_527, p532, "input is not unicode")
        end
        if not v_u_525 then
            ::l12::
            if v_u_526 then
                local v533
                if #p532 == 0 then
                    v533 = 0
                else
                    v533 = 0
                    for _ in utf8.graphemes(p532) do
                        v533 = v533 + 1
                    end
                end
                if not v533 then
                    return v_u_44.err(v_u_527, p532, "input is not a valid unicode string")
                end
                local v534 = v_u_526
                local v535
                if v534.min then
                    if not v534.minExclusive then
                        if v533 < v534.min then
                            v535 = false
                            goto l45
                        end
                        goto l40
                    end
                    if v533 <= v534.min then
                        v535 = false
                        goto l45
                    end
                end
                ::l40::
                if v534.max then
                    if v534.maxExclusive then
                        v535 = v534.max > v533
                    else
                        v535 = v534.max >= v533
                    end
                else
                    v535 = true
                end
                ::l45::
                if not v535 then
                    return v_u_44.err(v_u_527, p532, (("input length out of range (# graphemes: %* from %*)"):format(v533, (v_u_81(15, v_u_87(p532))))))
                end
            end
            if p_u_524.pattern and not string.match(p532, p_u_524.pattern) then
                return v_u_44.err(v_u_527, p532, (("input does not match pattern (input: %*)"):format((v_u_81(15, v_u_87(p532))))))
            end
            goto l4
        end
        local v536 = #p532
        local v537 = v_u_525
        local v538
        if v537.min then
            if not v537.minExclusive then
                if v536 < v537.min then
                    v538 = false
                    goto l19
                end
                goto l14
            end
            if v536 <= v537.min then
                v538 = false
                goto l19
            end
        end
        ::l14::
        if v537.max then
            if v537.maxExclusive then
                v538 = v537.max > v536
            else
                v538 = v537.max >= v536
            end
        else
            v538 = true
        end
        ::l19::
        if not v538 then
            return v_u_44.err(v_u_527, p532, (("input length out of range (#input: %* from #%*)"):format(#p532, (v_u_81(15, v_u_87(p532))))))
        end
        goto l12
    end
    function v528._format(p539, _, _)
        if p_u_524 then
            local v540 = {}
            if p_u_524.unicode then
                table.insert(v540, "unicode")
            end
            if v_u_526 then
                local v541 = "graphemes %*"
                local v542 = v_u_526
                local v543
                if v542.min or v542.max then
                    local v544 = v542.minExclusive and "(" or "["
                    local v545 = v542.maxExclusive and ")" or "]"
                    v543 = v544 .. (v542.min or "") .. ", " .. (v542.max or "") .. v545
                else
                    v543 = "[-inf, inf]"
                end
                local v546 = v541:format(v543)
                table.insert(v540, v546)
            end
            if v_u_525 then
                local v547 = "bytes %*"
                local v548 = v_u_525
                local v549
                if v548.min or v548.max then
                    local v550 = v548.minExclusive and "(" or "["
                    local v551 = v548.maxExclusive and ")" or "]"
                    v549 = v550 .. (v548.min or "") .. ", " .. (v548.max or "") .. v551
                else
                    v549 = "[-inf, inf]"
                end
                local v552 = v547:format(v549)
                table.insert(v540, v552)
            end
            if p_u_524.pattern then
                local v553 = ("pattern \"%*\""):format((string.gsub(p_u_524.pattern, "[\r\n\t]", v_u_523)))
                table.insert(v540, v553)
            end
            if #v540 == 0 then
                local v554 = p539[v_u_527]
                return not v554 and "string" or ("$$%*$:%*:$%*$$"):format(v554, "string", v554)
            else
                local v555 = ("string<%*>"):format((table.concat(v540, ", ")))
                local v556 = p539[v_u_527]
                if v556 then
                    return ("$$%*$:%*:$%*$$"):format(v556, v555, v556)
                else
                    return v555
                end
            end
        else
            local v557 = p539[v_u_527]
            return not v557 and "string" or ("$$%*$:%*:$%*$$"):format(v557, "string", v557)
        end
    end
    local v558 = v528
    local v559 = v_u_63
    local v560 = v558
    return setmetatable(v560, v559)
end
function v_u_36.isTypeof(p_u_561, _)
    local v_u_562 = nil
    return (function()
        local v_u_563 = nil
        local v564 = {
            ["kind"] = "basic"
        }
        local v565 = {}
        local v566
        if v_u_562 then
            v566 = nil
        else
            v566 = p_u_561
        end
        v565.typeof = v566
        local v567
        if v_u_562 then
            v567 = p_u_561
        else
            v567 = nil
        end
        v565.type = v567
        v564.basic = v565
        function v564._matches(p568, ...)
            if (v_u_562 and type(p568) or typeof(p568)) == p_u_561 then
                return v_u_44.ok()
            else
                return v_u_44.err(v_u_563, p568, (("expected %*, got $input"):format(p_u_561)))
            end
        end
        function v564._format(p569, _, _)
            local v570 = p_u_561
            local v571 = p569[v_u_563]
            if v571 then
                return ("$$%*$:%*:$%*$$"):format(v571, v570, v571)
            else
                return v570
            end
        end
        local v572 = v564
        local v573 = v_u_63
        local v574 = v572
        return setmetatable(v574, v573)
    end)()
end
function v_u_36.isType(p_u_575, _)
    local v_u_576 = nil
    return (function()
        local v_u_577 = nil
        local v578 = {
            ["kind"] = "basic"
        }
        local v579 = {}
        local v580
        if v_u_576 then
            v580 = nil
        else
            v580 = p_u_575
        end
        v579.typeof = v580
        local v581
        if v_u_576 then
            v581 = p_u_575
        else
            v581 = nil
        end
        v579.type = v581
        v578.basic = v579
        function v578._matches(p582, ...)
            if (v_u_576 and type(p582) or typeof(p582)) == p_u_575 then
                return v_u_44.ok()
            else
                return v_u_44.err(v_u_577, p582, (("expected %*, got $input"):format(p_u_575)))
            end
        end
        function v578._format(p583, _, _)
            local v584 = p_u_575
            local v585 = p583[v_u_577]
            if v585 then
                return ("$$%*$:%*:$%*$$"):format(v585, v584, v585)
            else
                return v584
            end
        end
        local v586 = v578
        local v587 = v_u_63
        local v588 = v586
        return setmetatable(v588, v587)
    end)()
end
local function v_u_589(...)
    return ...
end
function v_u_36.vararg(p590, p591)
    local v_u_592 = p591 and p591.length
    if v_u_592 then
        v_u_592 = v_u_35(p591.length)
    end
    local v_u_593 = v_u_36.typeof(p590)
    local v_u_594 = nil
    local v616 = {
        ["kind"] = "vararg",
        ["vararg"] = {
            ["type"] = v_u_593,
            ["length"] = v_u_592
        },
        ["_matches"] = function(...)
            local v595 = table.pack(...)
            local v596 = {}
            local v597 = false
            for v598 = v595.n, 1, -1 do
                if v595[v598] ~= nil then
                    break
                end
                v595.n = v595.n - 1
            end
            if not v_u_592 then
                ::l7::
                if v_u_593.kind == "any" or v_u_593.kind == "unknown" then
                    return v_u_44.ok()
                end
                for v599 = 1, v595.n do
                    local v600 = v_u_593._matches(v595[v599])
                    if not v600.ok then
                        table.move(v600.errs, 1, #v600.errs, #v596 + 1, v596)
                        v597 = true
                    end
                end
                if not v597 then
                    return v_u_44.ok()
                end
                local v601 = {
                    ["type"] = v_u_594,
                    ["input"] = table.pack(...)
                }
                table.insert(v596, 1, v601)
                return v_u_44.new(false, v596)
            end
            local v602 = v595.n
            local v603 = v_u_592
            local v604
            if v603.min then
                if v603.minExclusive then
                    if v602 <= v603.min then
                        v604 = false
                        ::l14::
                        if not v604 then
                            local v605 = {
                                ["type"] = v_u_594,
                                ["input"] = table.pack(...)
                            }
                            local v606 = "expected input count to be within range %*"
                            local v607 = v_u_592
                            local v608
                            if v607.min or v607.max then
                                local v609 = v607.minExclusive and "(" or "["
                                local v610 = v607.maxExclusive and ")" or "]"
                                v608 = v609 .. (v607.min or "") .. ", " .. (v607.max or "") .. v610
                            else
                                v608 = "[-inf, inf]"
                            end
                            v605.message = v606:format(v608)
                            table.insert(v596, v605)
                            return v_u_44.new(false, v596)
                        end
                        goto l7
                    end
                elseif v602 < v603.min then
                    v604 = false
                    goto l14
                end
            end
            if v603.max then
                if v603.maxExclusive then
                    v604 = v603.max > v602
                else
                    v604 = v603.max >= v602
                end
            else
                v604 = true
            end
            goto l14
        end,
        ["_format"] = function(p611, p612, p613)
            if p613[v_u_594] then
                return "<cyclic>"
            else
                p613[v_u_594] = true
                local v614 = ("...%*"):format((v_u_593._format(p611, p612 - 3, p613)))
                local v615 = p611[v_u_594]
                if v615 then
                    return ("$$%*$:%*:$%*$$"):format(v615, v614, v615)
                else
                    return v614
                end
            end
        end
    }
    v_u_594 = v616
    local v617 = v_u_63
    local v618 = v_u_594
    return setmetatable(v618, v617)
end
local function v_u_625(...)
    local v619 = table.pack(...)
    for v620 = 1, v619.n do
        local v621 = v619[v620]
        if v_u_36.isGtType(v621) then
            if v621.tuple then
                if v620 == v619.n then
                    v619[v620] = nil
                    table.move(v621.tuple.contents, 1, #v621.tuple.contents, v620, v619)
                    v619.n = v619.n + (#v621.tuple.contents - 1)
                    if v621.tuple.vararg then
                        local v622 = v621.tuple.vararg
                        table.insert(v619, v622)
                        v619.n = v619.n + 1
                    end
                else
                    v619[v620] = v621.tuple.contents[1] or (v621.tuple.vararg or v_u_36.none())
                end
            elseif v621.vararg and v620 ~= v619.n then
                v619[v620] = v621.vararg.type
            end
        end
    end
    local v623 = v_u_589
    local v624 = v619.n
    return v623(unpack(v619, 1, v624))
end
function v_u_36.tuple(...)
    local v_u_626 = table.pack(v_u_625(...))
    for v627 = 1, v_u_626.n do
        if v_u_626[v627] == nil then
            error("nil types are not allowed implicitly in tuples; specify explicitly or fix your arguments to not have nil")
        end
        v_u_626[v627] = v_u_36.typeof(v_u_626[v627])
    end
    v_u_626.n = nil
    local v_u_628
    if v_u_626[#v_u_626] and v_u_626[#v_u_626].kind == "vararg" then
        v_u_628 = v_u_626[#v_u_626]
        v_u_626[#v_u_626] = nil
    else
        v_u_628 = nil
    end
    local v_u_629 = nil
    local v653 = {
        ["kind"] = "tuple",
        ["tuple"] = {
            ["contents"] = v_u_626,
            ["vararg"] = v_u_628
        },
        ["_matches"] = function(...)
            local v630 = table.pack(...)
            local v631 = {}
            local v632 = false
            for v633 = v630.n, 1, -1 do
                if v630[v633] ~= nil then
                    break
                end
                v630.n = v630.n - 1
            end
            for v634, v635 in v_u_626 do
                local v636 = v630[v634]
                local v637 = v635._matches(v636)
                if not v637.ok then
                    table.move(v637.errs, 1, #v637.errs, #v631 + 1, v631)
                    v632 = true
                end
            end
            if v632 then
                local v638 = {
                    ["type"] = v_u_629,
                    ["input"] = v_u_39(...)
                }
                table.insert(v631, 1, v638)
                return v_u_44.new(false, v631)
            elseif v630.n <= #v_u_626 then
                return v_u_44.ok()
            elseif v_u_628 then
                return v_u_628._matches(select(#v_u_626 + 1, ...))
            else
                return v_u_44.errs({
                    {
                        ["type"] = v_u_629,
                        ["input"] = v630[#v_u_626 + 1]
                    },
                    {
                        ["type"] = v_u_629,
                        ["input"] = v_u_39(...),
                        ["message"] = ("expected a tuple of %* elements, got %* elements from $input"):format(#v_u_626, v630.n)
                    }
                })
            end
        end,
        ["_format"] = function(p639, p640, p641)
            if p641[v_u_629] then
                return "<cyclic>"
            else
                p641[v_u_629] = true
                local v642 = {}
                for _, v643 in ipairs(v_u_626) do
                    local v644
                    if v643._needsParens then
                        v644 = ("(%*)"):format((v643._format(p639, p640 - 4, p641)))
                    else
                        v644 = v643._format(p639, p640 - 2, p641)
                    end
                    table.insert(v642, v644)
                end
                if v_u_628 then
                    local v645 = v_u_628._format
                    local v646 = p640 - 3
                    table.insert(v642, v645(p639, v646, p641))
                end
                local v647 = table.concat(v642, ", ")
                if p640 < v_u_8(v647) or string.find(v647, "\n", 1, true) then
                    local v648 = table.concat(v642, ",\n")
                    local v649 = ("(\n%*\n)"):format("    " .. string.gsub(v648, "\n", "\n    "))
                    local v650 = p639[v_u_629]
                    if v650 then
                        return ("$$%*$:%*:$%*$$"):format(v650, v649, v650)
                    else
                        return v649
                    end
                else
                    local v651 = ("(%*)"):format((table.concat(v642, ", ")))
                    local v652 = p639[v_u_629]
                    if v652 then
                        return ("$$%*$:%*:$%*$$"):format(v652, v651, v652)
                    else
                        return v651
                    end
                end
            end
        end
    }
    v_u_629 = v653
    local v654 = v_u_63
    local v655 = v_u_629
    return v_u_589((setmetatable(v655, v654)))
end
function v_u_36.args(...)
    return v_u_36.tuple(...)
end
function v_u_36.returns(...)
    return v_u_36.tuple(...)
end
function v_u_36.fn(p_u_656, p_u_657)
    local v658 = v_u_36.isGtType(p_u_656)
    assert(v658, "args must be a GreenTea type. Use GreenTea.args to specify args.")
    local v659 = v_u_36.isGtType(p_u_657)
    assert(v659, "returns must be a GreenTea type. Use GreenTea.returns returns.")
    local v660 = p_u_656.tuple
    assert(v660, "args must be a GreenTea tuple type. Use GreenTea.args to specify args.")
    local v661 = p_u_657.tuple
    assert(v661, "returns must be a GreenTea tuple type. Use GreenTea.returns returns.")
    local v_u_662 = nil
    local v688 = {
        ["kind"] = "function",
        ["fn"] = {
            ["args"] = p_u_656,
            ["returns"] = p_u_657
        },
        ["_matches"] = function(p663, ...)
            if typeof(p663) == "function" then
                return v_u_44.ok()
            else
                return v_u_44.err(v_u_662, p663, "expected function")
            end
        end,
        ["_format"] = function(p664, p665, p666)
            if p666[v_u_662] then
                return "<cyclic>"
            else
                p666[v_u_662] = true
                local v667 = {}
                for _, v668 in p_u_656.tuple.contents do
                    local v669 = v668._format
                    local v670 = p665 - 1
                    table.insert(v667, v669(p664, v670, p666))
                end
                if p_u_656.tuple.vararg then
                    local v671 = p_u_656.tuple.vararg._format
                    local v672 = p665 - 1
                    table.insert(v667, v671(p664, v672, p666))
                end
                local v673 = {}
                for _, v674 in p_u_657.tuple.contents do
                    local v675 = v674._format
                    local v676 = p665 - 1
                    table.insert(v673, v675(p664, v676, p666))
                end
                if p_u_657.tuple.vararg then
                    local v677 = p_u_657.tuple.vararg._format
                    local v678 = p665 - 1
                    table.insert(v673, v677(p664, v678, p666))
                end
                local v679
                if #v667 == 0 then
                    v679 = "() ->"
                else
                    v679 = ("(%*) ->"):format((table.concat(v667, ", ")))
                    if v_u_8(v679) > 80 or string.find(v679, "\n", 1, true) then
                        local v680 = table.concat(v667, ",\n")
                        v679 = ("(\n%*\n) ->"):format("    " .. string.gsub(v680, "\n", "\n    "))
                    end
                end
                local v681 = p_u_657.tuple.vararg or p_u_657.tuple.contents[#p_u_657.tuple.contents]
                local v682
                if #v673 == 0 then
                    v682 = "()"
                elseif #v673 == 1 and not v681.__needsParens then
                    v682 = v673[1]
                else
                    v682 = ("(%*)"):format((table.concat(v673, ", ")))
                    if v_u_8(v682) > 80 or string.find(v682, "\n", 1, true) then
                        local v683 = ("(%*)"):format((table.concat(v673, ",\n")))
                        v682 = string.gsub(v683, "\n", "\n    ")
                    end
                end
                local v684 = ("%* %*"):format(v679, v682)
                if p665 < v_u_8(v684) or string.find(v684, "\n", 1, true) then
                    local v685 = ("%*\n%*"):format(v679, "    " .. string.gsub(v682, "\n", "\n    "))
                    local v686 = p664[v_u_662]
                    if v686 then
                        return ("$$%*$:%*:$%*$$"):format(v686, v685, v686)
                    else
                        return v685
                    end
                else
                    local v687 = p664[v_u_662]
                    if v687 then
                        return ("$$%*$:%*:$%*$$"):format(v687, v684, v687)
                    else
                        return v684
                    end
                end
            end
        end
    }
    v_u_662 = v688
    local v689 = v_u_63
    local v690 = v_u_662
    return setmetatable(v690, v689)
end
function v_u_36.anyfn()
    return v_u_36.fn(v_u_36.args(v_u_36.vararg(v_u_36.any({
        ["allowNil"] = true
    }))), v_u_36.returns(v_u_36.vararg(v_u_36.any({
        ["allowNil"] = true
    }))))
end
function v_u_36.tuplePacked(...)
    return v_u_36.fn(v_u_36.args(), v_u_36.returns(...))
end
function v_u_36.table(p691, p692)
    local v_u_693
    if p692 then
        v_u_693 = p692.array or nil
    else
        v_u_693 = nil
    end
    local v_u_694
    if p692 and p692.count then
        v_u_694 = v_u_35(p692.count)
    else
        v_u_694 = nil
    end
    local v695 = p692 and p692.raw or nil
    local v_u_696 = {}
    local v_u_697 = nil
    local v698 = {}
    local v_u_699 = nil
    for v700, v701 in p691 do
        if typeof(v700) == "table" and v_u_36.isGtType(v700) then
            if v_u_697 then
                error("Only one indexer can be specified")
            else
                v_u_697 = v_u_36.typeof(v700)
                v_u_699 = v_u_36.typeof(v701)
            end
        elseif v695 then
            v_u_696[v700] = v_u_36.typeof(v701)
        elseif typeof(v700) == "number" then
            if v_u_697 then
                error("Only one indexer can be specified")
            end
            v_u_697 = v_u_36.number()
            local v702 = v_u_36.typeof
            table.insert(v698, v702(v701))
        elseif typeof(v700) == "string" then
            v_u_696[v700] = v_u_36.typeof(v701)
        else
            error("Tables must be defined as arrays or dictionaries with string keys")
        end
    end
    if #v698 > 0 then
        if #v698 == 1 then
            v_u_699 = v698[1]
        else
            v_u_699 = v_u_36.union(table.unpack(v698))
        end
    end
    if v_u_693 and (not v_u_697 or v_u_697.kind ~= "number") then
        error("If array is true, the table must have an indexer with number keys")
    end
    local v_u_703 = nil
    local v766 = {
        ["kind"] = "table",
        ["table"] = {
            ["contents"] = v_u_696,
            ["indexer"] = v_u_697 and ({
                ["key"] = v_u_697,
                ["value"] = v_u_699
            } or nil) or nil,
            ["array"] = v_u_693,
            ["count"] = v_u_694,
            ["raw"] = v695
        },
        ["_matches"] = function(p704, ...)
            if typeof(p704) ~= "table" then
                return v_u_44.err(v_u_703, p704, "expected table")
            end
            local v705 = {}
            local v706 = 0
            local v707 = 0
            for v708, v709 in v_u_696 do
                local v710 = p704[v708]
                local v711 = v709._matches(v710)
                if not v711.ok then
                    return v_u_44.extendErr(v711, v_u_703, p704)
                end
                v705[v708] = true
            end
            for v712, v713 in p704 do
                if not v705[v712] then
                    local v714 = v_u_696[v712]
                    if v714 then
                        local v715 = v714._matches(v713)
                        if not v715.ok then
                            return v_u_44.extendErr(v715, v_u_703, p704)
                        end
                    elseif v_u_697 then
                        local v716 = v_u_699
                        assert(v716, "analysis hint")
                        v706 = v706 + 1
                        if v_u_694 then
                            local v717 = v_u_694
                            local v718
                            if v717.min then
                                if v717.minExclusive then
                                    if v706 <= v717.min then
                                        v718 = false
                                        ::l23::
                                        if not v718 then
                                            local v719 = v_u_44.err
                                            local v720 = v_u_703
                                            local v721 = "expected number of items to be in range %*, but we saw %* (or more) items"
                                            local v722 = v_u_694
                                            local v723
                                            if v722.min or v722.max then
                                                local v724 = v722.minExclusive and "(" or "["
                                                local v725 = v722.maxExclusive and ")" or "]"
                                                v723 = v724 .. (v722.min or "") .. ", " .. (v722.max or "") .. v725
                                            else
                                                v723 = "[-inf, inf]"
                                            end
                                            return v719(v720, p704, (v721:format(v723, v706)))
                                        end
                                        goto l16
                                    end
                                elseif v706 < v717.min then
                                    v718 = false
                                    goto l23
                                end
                            end
                            if v717.max then
                                if v717.maxExclusive then
                                    v718 = v717.max > v706
                                else
                                    v718 = v717.max >= v706
                                end
                            else
                                v718 = true
                            end
                            goto l23
                        end
                        ::l16::
                        local v726 = v_u_697._matches(v712)
                        if not v726.ok then
                            return v_u_44.extendErr(v726, v_u_703, p704)
                        end
                        local v727 = v_u_699._matches(v713)
                        if not v727.ok then
                            return v_u_44.extendErr(v727, v_u_703, p704)
                        end
                        if typeof(v712) == "number" then
                            v707 = math.max(v707, v712)
                            if v_u_693 then
                                if v712 < 1 then
                                    return v_u_44.err(v_u_703, p704, (("key %* is less than 1, but we expected a contiguous array"):format(v712)))
                                end
                                if math.floor(v712) ~= v712 then
                                    return v_u_44.err(v_u_703, p704, (("key %* is not an integer, but we expected a contiguous array"):format(v712)))
                                end
                                if v712 ~= v712 then
                                    return v_u_44.err(v_u_703, p704, (("key %* is NaN, but we expected a contiguous array"):format(v712)))
                                end
                            end
                        end
                    end
                end
            end
            if not v_u_694 then
                ::l56::
                if v_u_693 and v706 ~= v707 then
                    local v728 = v_u_699
                    assert(v728, "analysis hint")
                    local v729 = v_u_699._matches(nil)
                    if not v729.ok then
                        return v_u_44.extendErr(v729, v_u_703, p704, (("expected contiguous array, but we saw only %* items when the max index was %*"):format(v706, v707)))
                    end
                end
                return v_u_44.ok()
            end
            local v730 = v_u_694
            local v731
            if v730.min then
                if not v730.minExclusive then
                    if v706 < v730.min then
                        v731 = false
                        goto l63
                    end
                    goto l58
                end
                if v706 <= v730.min then
                    v731 = false
                    goto l63
                end
            end
            ::l58::
            if v730.max then
                if v730.maxExclusive then
                    v731 = v730.max > v706
                else
                    v731 = v730.max >= v706
                end
            else
                v731 = true
            end
            ::l63::
            if not v731 then
                local v732 = v_u_44.err
                local v733 = v_u_703
                local v734 = "expected number of items to be in range %*, but we saw only %* items"
                local v735 = v_u_694
                local v736
                if v735.min or v735.max then
                    local v737 = v735.minExclusive and "(" or "["
                    local v738 = v735.maxExclusive and ")" or "]"
                    v736 = v737 .. (v735.min or "") .. ", " .. (v735.max or "") .. v738
                else
                    v736 = "[-inf, inf]"
                end
                return v732(v733, p704, (v734:format(v736, v706)))
            end
            goto l56
        end,
        ["_format"] = function(p739, p740, p741)
            if p741[v_u_703] then
                return "<cyclic>"
            else
                p741[v_u_703] = true
                local v742 = {}
                if v_u_693 then
                    table.insert(v742, "@array")
                end
                if v_u_694 then
                    local v743 = "@count %*"
                    local v744 = v_u_694
                    local v745
                    if v744.min or v744.max then
                        local v746 = v744.minExclusive and "(" or "["
                        local v747 = v744.maxExclusive and ")" or "]"
                        v745 = v746 .. (v744.min or "") .. ", " .. (v744.max or "") .. v747
                    else
                        v745 = "[-inf, inf]"
                    end
                    local v748 = v743:format(v745)
                    table.insert(v742, v748)
                end
                if v_u_697 then
                    local v749 = v_u_699
                    assert(v749, "analysis hint")
                    if v_u_697.kind == "number" then
                        local v750 = v_u_699._format
                        local v751 = p740 - 1
                        table.insert(v742, v750(p739, v751, p741))
                    else
                        local v752 = v_u_697._format(p739, p740 - 3, p741)
                        local v753 = v_u_699._format(p739, p740 - 1, p741)
                        local v754 = ("[%*]: %*"):format(v752, v753)
                        if p740 < v_u_8(v754) then
                            v754 = ("[%*]:\n%*"):format(v752, v753)
                        end
                        table.insert(v742, v754)
                    end
                end
                for v755, v756 in v_u_696 do
                    local v757 = tostring(v755)
                    local v758 = v756._format(p739, p740 - 3, p741)
                    local v759 = ("%*: %*"):format(v757, v758)
                    if p740 < v_u_8(v759) then
                        v759 = ("%*: %*"):format(v757, v758)
                    end
                    table.insert(v742, v759)
                end
                if #v742 == 0 then
                    local v760 = p739[v_u_703]
                    return not v760 and "{}" or ("$$%*$:%*:$%*$$"):format(v760, "{}", v760)
                else
                    local v761 = ("%* %* %*"):format("{", table.concat(v742, ", "), "}")
                    if p740 < v_u_8(v761) or string.find(v761, "\n", 1, true) then
                        local v762 = table.concat(v742, ",\n")
                        local v763 = ("%*\n%*\n%*"):format("{", "    " .. string.gsub(v762, "\n", "\n    "), "}")
                        local v764 = p739[v_u_703]
                        if v764 then
                            return ("$$%*$:%*:$%*$$"):format(v764, v763, v764)
                        else
                            return v763
                        end
                    else
                        local v765 = p739[v_u_703]
                        if v765 then
                            return ("$$%*$:%*:$%*$$"):format(v765, v761, v765)
                        else
                            return v761
                        end
                    end
                end
            end
        end
    }
    local v767 = v766
    local v768 = v_u_63
    local v769 = v767
    return setmetatable(v769, v768)
end
v_u_36.struct = v_u_36.table
function v_u_36.anyTable(p770)
    local v771 = v_u_36.table
    local v772 = {
        [v_u_36.any()] = v_u_36.any()
    }
    local v773 = {}
    if p770 then
        p770 = p770.count
    end
    v773.count = p770
    return v771(v772, v773)
end
function v_u_36.array(p774, p775)
    local v776 = v_u_36.table
    local v777 = { v_u_36.typeof(p774) }
    local v778 = {
        ["array"] = true
    }
    if p775 then
        p775 = p775.count
    end
    v778.count = p775
    return v776(v777, v778)
end
function v_u_36.dictionary(p779, p780, p781)
    local v782 = v_u_36.table
    local v783 = {
        [v_u_36.typeof(p779)] = v_u_36.typeof(p780)
    }
    local v784 = {}
    if p781 then
        p781 = p781.count
    end
    v784.count = p781
    return v782(v783, v784)
end
function v_u_36.union(...)
    local v_u_785 = table.pack(...)
    for v786 = v_u_785.n, 1, -1 do
        if v_u_785[v786] ~= nil then
            break
        end
        v_u_785.n = v_u_785.n - 1
    end
    local v_u_787 = {}
    local v_u_788 = {}
    for v789 = 1, v_u_785.n do
        if v_u_785[v789] == nil then
            error("implicit nil type not allowed in union; specify explicitly or fix your arguments to not have nil")
        end
        local v790 = v_u_36.typeof(v_u_785[v789])
        v_u_785[v789] = v790
        if v790.basic and (v790.basic.type == "nil" or v790.basic.typeof == "nil") then
            table.insert(v_u_787, v790)
        else
            table.insert(v_u_788, v790)
        end
    end
    v_u_785.n = nil
    local v791 = #v_u_785 > 0
    assert(v791, "union must have at least one type")
    local v_u_792 = nil
    local v815 = {
        ["kind"] = "union",
        ["union"] = {
            ["contents"] = v_u_785,
            ["optional"] = #v_u_787 > 0
        },
        ["_needsParens"] = true,
        ["_matches"] = function(p793, ...)
            local v794 = {}
            for _, v795 in v_u_785 do
                local v796 = v795._matches(p793)
                if v796.ok then
                    return v796
                end
                table.move(v796.errs, 1, #v796.errs, #v794 + 1, v794)
            end
            local v797 = {
                ["type"] = v_u_792,
                ["input"] = p793,
                ["message"] = "input did not match any union member"
            }
            table.insert(v794, 1, v797)
            return v_u_44.errs(v794)
        end,
        ["_format"] = function(p798, p799, p800)
            if p800[v_u_792] then
                return "<cyclic>"
            else
                p800[v_u_792] = true
                if #v_u_788 == 0 then
                    return "nil"
                elseif #v_u_788 == 1 then
                    if #v_u_787 > 0 then
                        local v801 = v_u_788[1]
                        local v802
                        if v801._needsParens then
                            v802 = ("(%*)?"):format((v801._format(p798, p799 - 3, p800)))
                        else
                            v802 = ("%*?"):format((v801._format(p798, p799 - 1, p800)))
                        end
                        local v803 = p798[v_u_792]
                        if v803 then
                            return ("$$%*$:%*:$%*$$"):format(v803, v802, v803)
                        else
                            return v802
                        end
                    else
                        local v804 = v_u_788[1]._format(p798, p799, p800)
                        local v805 = p798[v_u_792]
                        if v805 then
                            return ("$$%*$:%*:$%*$$"):format(v805, v804, v805)
                        else
                            return v804
                        end
                    end
                else
                    local v806 = {}
                    for _, v807 in v_u_785 do
                        local v808
                        if v807._needsParens then
                            v808 = ("(%*)"):format((v807._format(p798, p799 - 4, p800)))
                        else
                            v808 = v807._format(p798, p799 - 2, p800)
                        end
                        table.insert(v806, v808)
                    end
                    local v809 = table.concat(v806, " | ")
                    if p799 < v_u_8(v809) or string.find(v809, "\n", 1, true) then
                        local v810 = v806[1]
                        local v811 = "\n| " .. table.concat(v806, "\n| ", 2)
                        local v812 = v810 .. "    " .. string.gsub(v811, "\n", "\n    ")
                        local v813 = p798[v_u_792]
                        if v813 then
                            return ("$$%*$:%*:$%*$$"):format(v813, v812, v813)
                        else
                            return v812
                        end
                    else
                        local v814 = p798[v_u_792]
                        if v814 then
                            return ("$$%*$:%*:$%*$$"):format(v814, v809, v814)
                        else
                            return v809
                        end
                    end
                end
            end
        end
    }
    local v816 = v815
    local v817 = v_u_63
    local v818 = v816
    return setmetatable(v818, v817)
end
function v_u_36.intersection(...)
    local v_u_819 = table.pack(...)
    for v820 = v_u_819.n, 1, -1 do
        if v_u_819[v820] ~= nil then
            break
        end
        v_u_819.n = v_u_819.n - 1
    end
    for v821 = 1, v_u_819.n do
        if v_u_819[v821] == nil then
            error("implicit nil type not allowed in intersection; specify explicitly or fix your arguments to not have nil")
        end
        v_u_819[v821] = v_u_36.typeof(v_u_819[v821])
    end
    v_u_819.n = nil
    local v822 = #v_u_819 > 0
    assert(v822, "intersection must have at least one type")
    local v_u_823 = nil
    v_u_823 = {
        ["kind"] = "intersection",
        ["intersection"] = {
            ["contents"] = v_u_819
        },
        ["_needsParens"] = true,
        ["_matches"] = function(p824, ...)
            local v825 = {}
            local v826 = false
            for _, v827 in v_u_819 do
                local v828 = v827._matches(p824)
                if not v828.ok then
                    table.move(v828.errs, 1, #v828.errs, #v825 + 1, v825)
                    v826 = true
                end
            end
            if not v826 then
                return v_u_44.ok()
            end
            local v829 = {
                ["type"] = v_u_823,
                ["input"] = p824,
                ["message"] = "input did not match all intersection members"
            }
            table.insert(v825, 1, v829)
            return v_u_44.errs(v825)
        end,
        ["_format"] = function(p830, p831, p832)
            if p832[v_u_823] then
                return "<cyclic>"
            else
                p832[v_u_823] = true
                if #v_u_819 == 0 then
                    return "()"
                elseif #v_u_819 == 1 then
                    local v833 = v_u_819[1]._format(p830, p831, p832)
                    local v834 = p830[v_u_823]
                    if v834 then
                        return ("$$%*$:%*:$%*$$"):format(v834, v833, v834)
                    else
                        return v833
                    end
                else
                    local v835 = {}
                    for _, v836 in v_u_819 do
                        local v837
                        if v836._needsParens then
                            v837 = ("(%*)"):format((v836._format(p830, p831 - 4, p832)))
                        else
                            v837 = v836._format(p830, p831 - 2, p832)
                        end
                        table.insert(v835, v837)
                    end
                    local v838 = table.concat(v835, " & ")
                    if p831 < v_u_8(v838) or string.find(v838, "\n", 1, true) then
                        local v839 = v835[1]
                        local v840 = "\n& " .. table.concat(v835, "\n& ", 2)
                        local v841 = v839 .. "    " .. string.gsub(v840, "\n", "\n    ")
                        local v842 = p830[v_u_823]
                        if v842 then
                            return ("$$%*$:%*:$%*$$"):format(v842, v841, v842)
                        else
                            return v841
                        end
                    else
                        local v843 = p830[v_u_823]
                        if v843 then
                            return ("$$%*$:%*:$%*$$"):format(v843, v838, v843)
                        else
                            return v838
                        end
                    end
                end
            end
        end
    }
    local v844 = v_u_63
    local v845 = v_u_823
    return setmetatable(v845, v844)
end
function v_u_36.optional(p846)
    return v_u_36.union(p846, v_u_36.none())
end
v_u_36.oneOf = v_u_36.union
v_u_36.allOf = v_u_36.intersection
v_u_36.opt = v_u_36.optional
function v_u_36.typeof(p847, p848)
    if v_u_36.isGtType(p847) then
        return p847
    else
        if v_u_1[p847] then
            local v849 = v_u_1[p847]
            error((("Attempt to use a GreenTea constructor without calling it: you used %*; did you mean to use %*() instead?"):format(v849, v849)))
        end
        local v850 = p848 or {}
        if typeof(p847) == "table" then
            local v851 = {}
            for v852, v853 in pairs(p847) do
                if v850[v853] then
                    v851[v852] = v850[v853]
                end
                v851[v852] = v_u_36.typeof(v853, v850)
            end
            local v854 = getmetatable(p847)
            if typeof(v854) == "table" then
                local v855 = getmetatable(p847)
                setmetatable(v851, v855)
            end
            return v_u_36.table(v851)
        elseif typeof(p847) == "function" then
            return v_u_36.anyfn()
        elseif typeof(p847) == "string" then
            return v_u_36.string()
        elseif typeof(p847) == "number" then
            return v_u_36.number()
        else
            return v_u_36.isTypeof(typeof(p847), p847)
        end
    end
end
function v_u_36.typecast(p856)
    local v857 = v_u_36.isGtType(p856)
    assert(v857, "value must be a GreenTea type")
    return p856
end
v_u_36.asGreenTeaType = v_u_36.typecast
v_u_36.asGtType = v_u_36.typecast
local function v_u_858(...)
    return ...
end
({}).type = function(p859)
    return v_u_858(p859)
end
function v_u_36.build(...)
    local v860 = select("#", ...) > 1
    if v860 then
        v860 = false
        for v861 = 2, select("#", ...) do
            if select(v861, ...) ~= nil then
                v860 = true
                break
            end
        end
    end
    local v_u_862
    if v860 then
        v_u_862 = v_u_36.tuple(...)
    else
        v_u_862 = v_u_36.typeof((v_u_858(...)))
    end
    function v_u_862.type(_)
        return v_u_862
    end
    return v_u_862
end
function v_u_36.meta(p863, p864)
    local v865 = v_u_36.typeof(p863)
    v865.meta = v865.meta or {}
    local v866 = v865.meta
    assert(v866, "analysis hint")
    for v867, v868 in p864 do
        v865.meta[v867] = v868
    end
    return v865
end
return v_u_36