--// ReplicatedStorage.SharedPackages._Index.evaera_promise@3.1.0.promise (ModuleScript)

local v_u_1 = {
    ["__mode"] = "k"
}
local function v7(p_u_2, p3)
    local v4 = {}
    for _, v5 in ipairs(p3) do
        v4[v5] = v5
    end
    return setmetatable(v4, {
        ["__index"] = function(_, p6)
            error(string.format("%s is not in %s!", p6, p_u_2), 2)
        end,
        ["__newindex"] = function()
            error(string.format("Creating new members in %s is not allowed!", p_u_2), 2)
        end
    })
end
local v_u_8 = {
    ["Kind"] = v7("Promise.Error.Kind", {
        "ExecutionError",
        "AlreadyCancelled",
        "NotResolvedInTime",
        "TimedOut"
    })
}
v_u_8.__index = v_u_8
function v_u_8.new(p9, p10)
    local v11 = p9 or {}
    local v12 = {}
    local v13 = v11.error
    v12.error = tostring(v13) or "[This error has no error text.]"
    v12.trace = v11.trace
    v12.context = v11.context
    v12.kind = v11.kind
    v12.parent = p10
    v12.createdTick = os.clock()
    v12.createdTrace = debug.traceback()
    local v14 = v_u_8
    return setmetatable(v12, v14)
end
function v_u_8.is(p15)
    if type(p15) == "table" then
        local v16 = getmetatable(p15)
        if type(v16) == "table" then
            local v17
            if rawget(p15, "error") == nil then
                v17 = false
            else
                local v18 = rawget(v16, "extend")
                v17 = type(v18) == "function"
            end
            return v17
        end
    end
    return false
end
function v_u_8.isKind(p19, p20)
    local v21 = p20 ~= nil
    assert(v21, "Argument #2 to Promise.Error.isKind must not be nil")
    local v22 = v_u_8.is(p19)
    if v22 then
        v22 = p19.kind == p20
    end
    return v22
end
function v_u_8.extend(p23, p24)
    local v25 = p24 or {}
    v25.kind = v25.kind or p23.kind
    return v_u_8.new(v25, p23)
end
function v_u_8.getErrorChain(p26)
    local v27 = { p26 }
    while v27[#v27].parent do
        local v28 = v27[#v27].parent
        table.insert(v27, v28)
    end
    return v27
end
function v_u_8.__tostring(p29)
    local v30 = { string.format("-- Promise.Error(%s) --", p29.kind or "?") }
    for _, v31 in ipairs(p29:getErrorChain()) do
        local v32 = table.concat
        local v33 = { v31.trace or v31.error, v31.context }
        table.insert(v30, v32(v33, "\n"))
    end
    return table.concat(v30, "\n")
end
local function v_u_34(...)
    return select("#", ...), { ... }
end
local function v_u_36(p35, ...)
    return p35, select("#", ...), { ... }
end
local function v_u_43(p_u_37, p38, ...)
    local v39 = v_u_36
    local v40 = xpcall
    local v41 = p_u_37 ~= nil
    assert(v41)
    return v39(v40(p38, function(p42)
        if type(p42) == "table" then
            return p42
        else
            return v_u_8.new({
                ["error"] = p42,
                ["kind"] = v_u_8.Kind.ExecutionError,
                ["trace"] = debug.traceback(tostring(p42), 2),
                ["context"] = "Promise created at:\n\n" .. p_u_37
            })
        end
    end, ...))
end
local v_u_44 = {
    ["Error"] = v_u_8,
    ["Status"] = v7("Promise.Status", {
        "Started",
        "Resolved",
        "Rejected",
        "Cancelled"
    }),
    ["_getTime"] = os.clock,
    ["_timeEvent"] = game:GetService("RunService").Heartbeat,
    ["prototype"] = {}
}
v_u_44.__index = v_u_44.prototype
function v_u_44._new(p45, p_u_46, p47)
    if p47 ~= nil and not v_u_44.is(p47) then
        error("Argument #2 to Promise.new must be a promise or nil", 2)
    end
    local v_u_48 = {
        ["_source"] = p45,
        ["_status"] = v_u_44.Status.Started,
        ["_values"] = nil,
        ["_valuesLength"] = -1,
        ["_unhandledRejection"] = true,
        ["_queuedResolve"] = {},
        ["_queuedReject"] = {},
        ["_queuedFinally"] = {},
        ["_cancellationHook"] = nil,
        ["_parent"] = p47
    }
    local v49 = v_u_1
    v_u_48._consumers = setmetatable({}, v49)
    if p47 and p47._status == v_u_44.Status.Started then
        p47._consumers[v_u_48] = true
    end
    local v50 = v_u_44
    setmetatable(v_u_48, v50)
    local function v_u_51(...)
        v_u_48:_resolve(...)
    end
    local function v_u_52(...)
        v_u_48:_reject(...)
    end
    local function v_u_54(p53)
        if p53 then
            if v_u_48._status == v_u_44.Status.Cancelled then
                p53()
            else
                v_u_48._cancellationHook = p53
            end
        end
        return v_u_48._status == v_u_44.Status.Cancelled
    end
    coroutine.wrap(function()
        local v55, _, v56 = v_u_43(v_u_48._source, p_u_46, v_u_51, v_u_52, v_u_54)
        if not v55 then
            v_u_52(v56[1])
        end
    end)()
    return v_u_48
end
function v_u_44.new(p57)
    return v_u_44._new(debug.traceback(nil, 2), p57)
end
function v_u_44.__tostring(p58)
    return string.format("Promise(%s)", p58._status)
end
function v_u_44.defer(p_u_59)
    local v_u_60 = debug.traceback(nil, 2)
    return v_u_44._new(v_u_60, function(p_u_61, p_u_62, p_u_63)
        local v_u_64 = nil
        v_u_64 = v_u_44._timeEvent:Connect(function()
            v_u_64:Disconnect()
            local v65, _, v66 = v_u_43(v_u_60, p_u_59, p_u_61, p_u_62, p_u_63)
            if not v65 then
                p_u_62(v66[1])
            end
        end)
    end)
end
v_u_44.async = v_u_44.defer
function v_u_44.resolve(...)
    local v_u_67, v_u_68 = v_u_34(...)
    return v_u_44._new(debug.traceback(nil, 2), function(p69)
        local v70 = v_u_68
        local v71 = v_u_67
        p69(unpack(v70, 1, v71))
    end)
end
function v_u_44.reject(...)
    local v_u_72, v_u_73 = v_u_34(...)
    return v_u_44._new(debug.traceback(nil, 2), function(_, p74)
        local v75 = v_u_73
        local v76 = v_u_72
        p74(unpack(v75, 1, v76))
    end)
end
function v_u_44._try(p77, p_u_78, ...)
    local v_u_79, v_u_80 = v_u_34(...)
    return v_u_44._new(p77, function(p81)
        local v82 = v_u_80
        local v83 = v_u_79
        p81(p_u_78(unpack(v82, 1, v83)))
    end)
end
function v_u_44.try(...)
    return v_u_44._try(debug.traceback(nil, 2), ...)
end
function v_u_44._all(p84, p_u_85, p_u_86)
    if type(p_u_85) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.all"), 3)
    end
    for v87, v88 in pairs(p_u_85) do
        if not v_u_44.is(v88) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v87))), 3)
        end
    end
    if #p_u_85 == 0 or p_u_86 == 0 then
        return v_u_44.resolve({})
    else
        return v_u_44._new(p84, function(p_u_89, p_u_90, p91)
            local v_u_92 = {}
            local v_u_93 = {}
            local v_u_94 = 0
            local v_u_95 = 0
            local v_u_96 = false
            local function v_u_99(p97, ...)
                if not v_u_96 then
                    v_u_94 = v_u_94 + 1
                    if p_u_86 == nil then
                        v_u_92[p97] = ...
                    else
                        v_u_92[v_u_94] = ...
                    end
                    if v_u_94 >= (p_u_86 or #p_u_85) then
                        v_u_96 = true
                        p_u_89(v_u_92)
                        for _, v98 in ipairs(v_u_93) do
                            v98:cancel()
                        end
                    end
                end
            end
            p91(function()
                for _, v100 in ipairs(v_u_93) do
                    v100:cancel()
                end
            end)
            local v_u_101 = v_u_96
            for v_u_102, v103 in ipairs(p_u_85) do
                v_u_93[v_u_102] = v103:andThen(function(...)
                    v_u_99(v_u_102, ...)
                end, function(...)
                    v_u_95 = v_u_95 + 1
                    if p_u_86 == nil or #p_u_85 - v_u_95 < p_u_86 then
                        for _, v104 in ipairs(v_u_93) do
                            v104:cancel()
                        end
                        v_u_101 = true
                        p_u_90(...)
                    end
                end)
            end
            if v_u_101 then
                for _, v105 in ipairs(v_u_93) do
                    v105:cancel()
                end
            end
        end)
    end
end
function v_u_44.all(p106)
    return v_u_44._all(debug.traceback(nil, 2), p106)
end
function v_u_44.fold(p107, p_u_108, p109)
    local v110 = type(p107) == "table"
    assert(v110, "Bad argument #1 to Promise.fold: must be a table")
    local v111 = type(p_u_108) == "function"
    assert(v111, "Bad argument #2 to Promise.fold: must be a function")
    local v_u_112 = v_u_44.resolve(p109)
    return v_u_44.each(p107, function(p_u_113, p_u_114)
        v_u_112 = v_u_112:andThen(function(p115)
            return p_u_108(p115, p_u_113, p_u_114)
        end)
    end):andThenReturn(v_u_112)
end
function v_u_44.some(p116, p117)
    local v118 = type(p117) == "number"
    assert(v118, "Bad argument #2 to Promise.some: must be a number")
    return v_u_44._all(debug.traceback(nil, 2), p116, p117)
end
function v_u_44.any(p119)
    return v_u_44._all(debug.traceback(nil, 2), p119, 1):andThen(function(p120)
        return p120[1]
    end)
end
function v_u_44.allSettled(p_u_121)
    if type(p_u_121) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2)
    end
    for v122, v123 in pairs(p_u_121) do
        if not v_u_44.is(v123) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v122))), 2)
        end
    end
    if #p_u_121 == 0 then
        return v_u_44.resolve({})
    else
        return v_u_44._new(debug.traceback(nil, 2), function(p_u_124, _, p125)
            local v_u_126 = {}
            local v_u_127 = {}
            local v_u_128 = 0
            local function v_u_130(p129, ...)
                v_u_128 = v_u_128 + 1
                v_u_126[p129] = ...
                if v_u_128 >= #p_u_121 then
                    p_u_124(v_u_126)
                end
            end
            p125(function()
                for _, v131 in ipairs(v_u_127) do
                    v131:cancel()
                end
            end)
            for v_u_132, v133 in ipairs(p_u_121) do
                v_u_127[v_u_132] = v133:finally(function(...)
                    v_u_130(v_u_132, ...)
                end)
            end
        end)
    end
end
function v_u_44.race(p_u_134)
    local v135 = type(p_u_134) == "table"
    local v136 = string.format
    assert(v135, v136("Please pass a list of promises to %s", "Promise.race"))
    for v137, v138 in pairs(p_u_134) do
        local v139 = v_u_44.is(v138)
        local v140 = string.format
        local v141 = tostring(v137)
        assert(v139, v140("Non-promise value passed into %s at index %s", "Promise.race", v141))
    end
    return v_u_44._new(debug.traceback(nil, 2), function(p_u_142, p_u_143, p144)
        local v_u_145 = {}
        local v_u_146 = false
        if not p144(function(...)
            for _, v147 in ipairs(v_u_145) do
                v147:cancel()
            end
            v_u_146 = true
            return p_u_143(...)
        end) then
            local v_u_148 = v_u_146
            for v149, v150 in ipairs(p_u_134) do
                v_u_145[v149] = v150:andThen(function(...)
                    for _, v151 in ipairs(v_u_145) do
                        v151:cancel()
                    end
                    v_u_148 = true
                    return p_u_142(...)
                end, function(...)
                    for _, v152 in ipairs(v_u_145) do
                        v152:cancel()
                    end
                    v_u_148 = true
                    return p_u_143(...)
                end)
            end
            if v_u_148 then
                for _, v153 in ipairs(v_u_145) do
                    v153:cancel()
                end
            end
        end
    end)
end
function v_u_44.each(p_u_154, p_u_155)
    local v156 = type(p_u_154) == "table"
    local v157 = string.format
    assert(v156, v157("Please pass a list of promises to %s", "Promise.each"))
    local v158 = type(p_u_155) == "function"
    local v159 = string.format
    assert(v158, v159("Please pass a handler function to %s!", "Promise.each"))
    return v_u_44._new(debug.traceback(nil, 2), function(p160, p161, p162)
        local v163 = {}
        local v_u_164 = {}
        local v_u_165 = false
        p162(function()
            v_u_165 = true
            for _, v166 in ipairs(v_u_164) do
                v166:cancel()
            end
        end)
        local v167 = v_u_165
        local v168 = {}
        for v169, v170 in ipairs(p_u_154) do
            if v_u_44.is(v170) then
                if v170:getStatus() == v_u_44.Status.Cancelled then
                    for _, v171 in ipairs(v_u_164) do
                        v171:cancel()
                    end
                    return p161(v_u_8.new({
                        ["error"] = "Promise is cancelled",
                        ["kind"] = v_u_8.Kind.AlreadyCancelled,
                        ["context"] = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v169, v170._source)
                    }))
                end
                if v170:getStatus() == v_u_44.Status.Rejected then
                    for _, v172 in ipairs(v_u_164) do
                        v172:cancel()
                    end
                    return p161(select(2, v170:await()))
                end
                local v173 = v170:andThen(function(...)
                    return ...
                end)
                table.insert(v_u_164, v173)
                v168[v169] = v173
            else
                v168[v169] = v170
            end
        end
        for v174, v177 in ipairs(v168) do
            if v_u_44.is(v177) then
                local v176, v177 = v177:await()
                if not v176 then
                    for _, v178 in ipairs(v_u_164) do
                        v178:cancel()
                    end
                    return p161(v177)
                end
            end
            if v167 then
                return
            end
            local v179 = v_u_44.resolve(p_u_155(v177, v174))
            table.insert(v_u_164, v179)
            local v180, v181 = v179:await()
            if not v180 then
                for _, v182 in ipairs(v_u_164) do
                    v182:cancel()
                end
                return p161(v181)
            end
            v163[v174] = v181
        end
        p160(v163)
    end)
end
function v_u_44.is(p183)
    if type(p183) == "table" then
        local v184 = getmetatable(p183)
        if v184 == v_u_44 then
            return true
        elseif v184 == nil then
            local v185 = p183.andThen
            return type(v185) == "function"
        else
            if type(v184) == "table" then
                local v186 = rawget(v184, "__index")
                if type(v186) == "table" then
                    local v187 = rawget(v184, "__index")
                    local v188 = rawget(v187, "andThen")
                    if type(v188) == "function" then
                        return true
                    end
                end
            end
            return false
        end
    else
        return false
    end
end
function v_u_44.promisify(p_u_189)
    return function(...)
        return v_u_44._try(debug.traceback(nil, 2), p_u_189, ...)
    end
end
local v_u_190 = nil
local v_u_191 = nil
function v_u_44.delay(p192)
    local v193 = type(p192) == "number"
    assert(v193, "Bad argument #1 to Promise.delay, must be a number.")
    local v_u_194 = (p192 < 0.016666666666666666 or p192 == (1 / 0)) and 0.016666666666666666 or p192
    return v_u_44._new(debug.traceback(nil, 2), function(p195, _, p196)
        local v197 = v_u_44._getTime()
        local v198 = v197 + v_u_194
        local v_u_199 = {
            ["resolve"] = p195,
            ["startTime"] = v197,
            ["endTime"] = v198
        }
        if v_u_191 == nil then
            v_u_190 = v_u_199
            v_u_191 = v_u_44._timeEvent:Connect(function()
                local v200 = v_u_44._getTime()
                while v_u_190 ~= nil and v_u_190.endTime < v200 do
                    local v201 = v_u_190
                    v_u_190 = v201.next
                    if v_u_190 == nil then
                        v_u_191:Disconnect()
                        v_u_191 = nil
                    else
                        v_u_190.previous = nil
                    end
                    v201.resolve(v_u_44._getTime() - v201.startTime)
                end
            end)
        elseif v_u_190.endTime < v198 then
            local v202 = v_u_190
            local v203 = v202.next
            while v203 ~= nil and v203.endTime < v198 do
                local v204 = v203.next
                v202 = v203
                v203 = v204
            end
            v202.next = v_u_199
            v_u_199.previous = v202
            if v203 ~= nil then
                v_u_199.next = v203
                v203.previous = v_u_199
            end
        else
            v_u_199.next = v_u_190
            v_u_190.previous = v_u_199
            v_u_190 = v_u_199
        end
        p196(function()
            local v205 = v_u_199.next
            if v_u_190 == v_u_199 then
                if v205 == nil then
                    v_u_191:Disconnect()
                    v_u_191 = nil
                else
                    v205.previous = nil
                end
                v_u_190 = v205
            else
                local v206 = v_u_199.previous
                v206.next = v205
                if v205 ~= nil then
                    v205.previous = v206
                end
            end
        end)
    end)
end
local function v211(p207, p_u_208, p_u_209)
    local v_u_210 = debug.traceback(nil, 2)
    return v_u_44.race({ v_u_44.delay(p_u_208):andThen(function()
            return v_u_44.reject(p_u_209 == nil and v_u_8.new({
                ["kind"] = v_u_8.Kind.TimedOut,
                ["error"] = "Timed out",
                ["context"] = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p_u_208, v_u_210)
            }) or p_u_209)
        end), p207 })
end
v_u_44.prototype.timeout = v211
function v_u_44.prototype.getStatus(p212)
    return p212._status
end
local function v237(p_u_213, p_u_214, p_u_215, p_u_216)
    p_u_213._unhandledRejection = false
    return v_u_44._new(p_u_214, function(p_u_217, p_u_218)
        local v219
        if p_u_215 then
            local v_u_220 = p_u_214
            local v_u_221 = p_u_215
            v219 = function(...)
                local v222, v223, v224 = v_u_43(v_u_220, v_u_221, ...)
                if v222 then
                    p_u_217(unpack(v224, 1, v223))
                else
                    p_u_218(v224[1])
                end
            end
        else
            v219 = p_u_217
        end
        local v225
        if p_u_216 then
            local v_u_226 = p_u_214
            local v_u_227 = p_u_216
            v225 = function(...)
                local v228, v229, v230 = v_u_43(v_u_226, v_u_227, ...)
                if v228 then
                    p_u_217(unpack(v230, 1, v229))
                else
                    p_u_218(v230[1])
                end
            end
        else
            v225 = p_u_218
        end
        if p_u_213._status == v_u_44.Status.Started then
            local v231 = p_u_213._queuedResolve
            table.insert(v231, v219)
            local v232 = p_u_213._queuedReject
            table.insert(v232, v225)
            return
        elseif p_u_213._status == v_u_44.Status.Resolved then
            local v233 = p_u_213._values
            local v234 = p_u_213._valuesLength
            v219(unpack(v233, 1, v234))
            return
        elseif p_u_213._status == v_u_44.Status.Rejected then
            local v235 = p_u_213._values
            local v236 = p_u_213._valuesLength
            v225(unpack(v235, 1, v236))
        elseif p_u_213._status == v_u_44.Status.Cancelled then
            p_u_218(v_u_8.new({
                ["error"] = "Promise is cancelled",
                ["kind"] = v_u_8.Kind.AlreadyCancelled,
                ["context"] = "Promise created at\n\n" .. p_u_214
            }))
        end
    end, p_u_213)
end
v_u_44.prototype._andThen = v237
function v_u_44.prototype.andThen(p238, p239, p240)
    local v241 = p239 == nil and true or type(p239) == "function"
    local v242 = string.format
    assert(v241, v242("Please pass a handler function to %s!", "Promise:andThen"))
    local v243 = p240 == nil and true or type(p240) == "function"
    local v244 = string.format
    assert(v243, v244("Please pass a handler function to %s!", "Promise:andThen"))
    return p238:_andThen(debug.traceback(nil, 2), p239, p240)
end
function v_u_44.prototype.catch(p245, p246)
    local v247 = p246 == nil and true or type(p246) == "function"
    local v248 = string.format
    assert(v247, v248("Please pass a handler function to %s!", "Promise:catch"))
    return p245:_andThen(debug.traceback(nil, 2), nil, p246)
end
function v_u_44.prototype.tap(p249, p_u_250)
    local v251 = type(p_u_250) == "function"
    local v252 = string.format
    assert(v251, v252("Please pass a handler function to %s!", "Promise:tap"))
    return p249:_andThen(debug.traceback(nil, 2), function(...)
        local v253 = p_u_250(...)
        if not v_u_44.is(v253) then
            return ...
        end
        local v_u_254, v_u_255 = v_u_34(...)
        return v253:andThen(function()
            local v256 = v_u_255
            local v257 = v_u_254
            return unpack(v256, 1, v257)
        end)
    end)
end
function v_u_44.prototype.andThenCall(p258, p_u_259, ...)
    local v260 = type(p_u_259) == "function"
    local v261 = string.format
    assert(v260, v261("Please pass a handler function to %s!", "Promise:andThenCall"))
    local v_u_262, v_u_263 = v_u_34(...)
    return p258:_andThen(debug.traceback(nil, 2), function()
        local v264 = v_u_263
        local v265 = v_u_262
        return p_u_259(unpack(v264, 1, v265))
    end)
end
function v_u_44.prototype.andThenReturn(p266, ...)
    local v_u_267, v_u_268 = v_u_34(...)
    return p266:_andThen(debug.traceback(nil, 2), function()
        local v269 = v_u_268
        local v270 = v_u_267
        return unpack(v269, 1, v270)
    end)
end
function v_u_44.prototype.cancel(p271)
    if p271._status == v_u_44.Status.Started then
        p271._status = v_u_44.Status.Cancelled
        if p271._cancellationHook then
            p271._cancellationHook()
        end
        if p271._parent then
            p271._parent:_consumerCancelled(p271)
        end
        for v272 in pairs(p271._consumers) do
            v272:cancel()
        end
        p271:_finalize()
    end
end
function v_u_44.prototype._consumerCancelled(p273, p274)
    if p273._status == v_u_44.Status.Started then
        p273._consumers[p274] = nil
        if next(p273._consumers) == nil then
            p273:cancel()
        end
    end
end
function v_u_44.prototype._finally(p_u_275, p_u_276, p_u_277, p_u_278)
    if not p_u_278 then
        p_u_275._unhandledRejection = false
    end
    return v_u_44._new(p_u_276, function(p_u_279, p_u_280)
        local v_u_281
        if p_u_277 then
            local v_u_282 = p_u_276
            local v_u_283 = p_u_277
            v_u_281 = function(...)
                local v284, v285, v286 = v_u_43(v_u_282, v_u_283, ...)
                if v284 then
                    p_u_279(unpack(v286, 1, v285))
                else
                    p_u_280(v286[1])
                end
            end
        else
            v_u_281 = p_u_279
        end
        local v287 = p_u_278 and function(...)
            if p_u_275._status == v_u_44.Status.Rejected then
                return p_u_279(p_u_275)
            else
                return v_u_281(...)
            end
        end or v_u_281
        if p_u_275._status == v_u_44.Status.Started then
            local v288 = p_u_275._queuedFinally
            table.insert(v288, v287)
        else
            v287(p_u_275._status)
        end
    end, p_u_275)
end
function v_u_44.prototype.finally(p289, p290)
    local v291 = p290 == nil and true or type(p290) == "function"
    local v292 = string.format
    assert(v291, v292("Please pass a handler function to %s!", "Promise:finally"))
    return p289:_finally(debug.traceback(nil, 2), p290)
end
function v_u_44.prototype.finallyCall(p293, p_u_294, ...)
    local v295 = type(p_u_294) == "function"
    local v296 = string.format
    assert(v295, v296("Please pass a handler function to %s!", "Promise:finallyCall"))
    local v_u_297, v_u_298 = v_u_34(...)
    return p293:_finally(debug.traceback(nil, 2), function()
        local v299 = v_u_298
        local v300 = v_u_297
        return p_u_294(unpack(v299, 1, v300))
    end)
end
function v_u_44.prototype.finallyReturn(p301, ...)
    local v_u_302, v_u_303 = v_u_34(...)
    return p301:_finally(debug.traceback(nil, 2), function()
        local v304 = v_u_303
        local v305 = v_u_302
        return unpack(v304, 1, v305)
    end)
end
function v_u_44.prototype.done(p306, p307)
    local v308 = p307 == nil and true or type(p307) == "function"
    local v309 = string.format
    assert(v308, v309("Please pass a handler function to %s!", "Promise:done"))
    return p306:_finally(debug.traceback(nil, 2), p307, true)
end
function v_u_44.prototype.doneCall(p310, p_u_311, ...)
    local v312 = type(p_u_311) == "function"
    local v313 = string.format
    assert(v312, v313("Please pass a handler function to %s!", "Promise:doneCall"))
    local v_u_314, v_u_315 = v_u_34(...)
    return p310:_finally(debug.traceback(nil, 2), function()
        local v316 = v_u_315
        local v317 = v_u_314
        return p_u_311(unpack(v316, 1, v317))
    end, true)
end
function v_u_44.prototype.doneReturn(p318, ...)
    local v_u_319, v_u_320 = v_u_34(...)
    return p318:_finally(debug.traceback(nil, 2), function()
        local v321 = v_u_320
        local v322 = v_u_319
        return unpack(v321, 1, v322)
    end, true)
end
function v_u_44.prototype.awaitStatus(p323)
    p323._unhandledRejection = false
    if p323._status == v_u_44.Status.Started then
        local v_u_324 = Instance.new("BindableEvent")
        p323:finally(function()
            v_u_324:Fire()
        end)
        v_u_324.Event:Wait()
        v_u_324:Destroy()
    end
    if p323._status == v_u_44.Status.Resolved then
        local v325 = p323._status
        local v326 = p323._values
        local v327 = p323._valuesLength
        return v325, unpack(v326, 1, v327)
    end
    if p323._status ~= v_u_44.Status.Rejected then
        return p323._status
    end
    local v328 = p323._status
    local v329 = p323._values
    local v330 = p323._valuesLength
    return v328, unpack(v329, 1, v330)
end
local function v_u_332(p331, ...)
    return p331 == v_u_44.Status.Resolved, ...
end
function v_u_44.prototype.await(p333)
    return v_u_332(p333:awaitStatus())
end
local function v_u_335(p334, ...)
    if p334 ~= v_u_44.Status.Resolved then
        error(... == nil and "Expected Promise rejected with no value." or ..., 3)
    end
    return ...
end
function v_u_44.prototype.expect(p336)
    return v_u_335(p336:awaitStatus())
end
v_u_44.prototype.awaitValue = v_u_44.prototype.expect
function v_u_44.prototype._unwrap(p337)
    if p337._status == v_u_44.Status.Started then
        error("Promise has not resolved or rejected.", 2)
    end
    local v338 = p337._status == v_u_44.Status.Resolved
    local v339 = p337._values
    local v340 = p337._valuesLength
    return v338, unpack(v339, 1, v340)
end
local function v349(p_u_341, ...)
    if p_u_341._status == v_u_44.Status.Started then
        if v_u_44.is((...)) then
            if select("#", ...) > 1 then
                local v342 = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p_u_341._source)
                warn(v342)
            end
            local v_u_343 = ...
            local v345 = v_u_343:andThen(function(...)
                p_u_341:_resolve(...)
            end, function(...)
                local v344 = v_u_343._values[1]
                if v_u_343._error then
                    v344 = v_u_8.new({
                        ["error"] = v_u_343._error,
                        ["kind"] = v_u_8.Kind.ExecutionError,
                        ["context"] = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
                    })
                end
                if v_u_8.isKind(v344, v_u_8.Kind.ExecutionError) then
                    return p_u_341:_reject(v344:extend({
                        ["error"] = "This Promise was chained to a Promise that errored.",
                        ["trace"] = "",
                        ["context"] = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p_u_341._source)
                    }))
                end
                p_u_341:_reject(...)
            end)
            if v345._status == v_u_44.Status.Cancelled then
                p_u_341:cancel()
            elseif v345._status == v_u_44.Status.Started then
                p_u_341._parent = v345
                v345._consumers[p_u_341] = true
            end
        else
            p_u_341._status = v_u_44.Status.Resolved
            local v346, v347 = v_u_34(...)
            p_u_341._valuesLength = v346
            p_u_341._values = v347
            for _, v348 in ipairs(p_u_341._queuedResolve) do
                coroutine.wrap(v348)(...)
            end
            p_u_341:_finalize()
            return
        end
    else
        if v_u_44.is((...)) then
            (...):_consumerCancelled(p_u_341)
        end
        return
    end
end
v_u_44.prototype._resolve = v349
function v_u_44.prototype._reject(p_u_350, ...)
    if p_u_350._status == v_u_44.Status.Started then
        p_u_350._status = v_u_44.Status.Rejected
        local v351, v352 = v_u_34(...)
        p_u_350._valuesLength = v351
        p_u_350._values = v352
        local v353 = p_u_350._queuedReject
        if next(v353) == nil then
            local v_u_354 = tostring((...))
            coroutine.wrap(function()
                v_u_44._timeEvent:Wait()
                if p_u_350._unhandledRejection then
                    local v355 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v_u_354, p_u_350._source)
                    if not v_u_44.TEST then
                        warn(v355)
                    end
                else
                    return
                end
            end)()
        else
            for _, v356 in ipairs(p_u_350._queuedReject) do
                coroutine.wrap(v356)(...)
            end
        end
        p_u_350:_finalize()
    end
end
function v_u_44.prototype._finalize(p357)
    for _, v358 in ipairs(p357._queuedFinally) do
        coroutine.wrap(v358)(p357._status)
    end
    p357._queuedFinally = nil
    p357._queuedReject = nil
    p357._queuedResolve = nil
    if not v_u_44.TEST then
        p357._parent = nil
        p357._consumers = nil
    end
end
local function v363(p359, p360)
    local v361 = debug.traceback(nil, 2)
    if p359._status == v_u_44.Status.Resolved then
        return p359:_andThen(v361, function(...)
            return ...
        end)
    end
    local v362 = v_u_44.reject
    if p360 == nil then
        p360 = v_u_8.new({
            ["kind"] = v_u_8.Kind.NotResolvedInTime,
            ["error"] = "This Promise was not resolved in time for :now()",
            ["context"] = ":now() was called at:\n\n" .. v361
        }) or p360
    end
    return v362(p360)
end
v_u_44.prototype.now = v363
function v_u_44.retry(p_u_364, p_u_365, ...)
    local v366 = type(p_u_364) == "function"
    assert(v366, "Parameter #1 to Promise.retry must be a function")
    local v367 = type(p_u_365) == "number"
    assert(v367, "Parameter #2 to Promise.retry must be a number")
    local v_u_368 = { ... }
    local v_u_369 = select("#", ...)
    return v_u_44.resolve(p_u_364(...)):catch(function(...)
        if p_u_365 <= 0 then
            return v_u_44.reject(...)
        end
        local v370 = v_u_368
        local v371 = v_u_369
        return v_u_44.retry(p_u_364, p_u_365 - 1, unpack(v370, 1, v371))
    end)
end
function v_u_44.fromEvent(p_u_372, p373)
    local v_u_374 = p373 or function()
        return true
    end
    return v_u_44._new(debug.traceback(nil, 2), function(p_u_375, _, p376)
        local v_u_377 = nil
        local v_u_378 = false
        local function v379()
            v_u_377:Disconnect()
            v_u_377 = nil
        end
        v_u_377 = p_u_372:Connect(function(...)
            local v380 = v_u_374(...)
            if v380 == true then
                p_u_375(...)
                if v_u_377 then
                    v_u_377:Disconnect()
                    v_u_377 = nil
                else
                    v_u_378 = true
                end
            else
                if type(v380) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean")
                end
                return
            end
        end)
        if v_u_378 and v_u_377 then
            return v379()
        end
        p376(v379)
    end)
end
return v_u_44