--// ReplicatedStorage.SharedPackages._Index.jsdotlua_promise@3.5.2.promise (ModuleScript)

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
    assert(v41, "traceback is nil")
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
    ["_unhandledRejectionCallbacks"] = {},
    ["prototype"] = {}
}
v_u_44.__index = v_u_44.prototype
function v_u_44._new(p45, p_u_46, p47)
    if p47 ~= nil and not v_u_44.is(p47) then
        error("Argument #2 to Promise.new must be a promise or nil", 2)
    end
    local v_u_48 = {
        ["_thread"] = nil,
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
    v_u_48._thread = coroutine.create(function()
        local v55, _, v56 = v_u_43(v_u_48._source, p_u_46, v_u_51, v_u_52, v_u_54)
        if not v55 then
            v_u_52(v56[1])
        end
    end)
    task.spawn(v_u_48._thread)
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
function v_u_44.try(p84, ...)
    return v_u_44._try(debug.traceback(nil, 2), p84, ...)
end
function v_u_44._all(p85, p_u_86, p_u_87)
    if type(p_u_86) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.all"), 3)
    end
    for v88, v89 in pairs(p_u_86) do
        if not v_u_44.is(v89) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v88))), 3)
        end
    end
    if #p_u_86 == 0 or p_u_87 == 0 then
        return v_u_44.resolve({})
    else
        return v_u_44._new(p85, function(p_u_90, p_u_91, p92)
            local v_u_93 = {}
            local v_u_94 = {}
            local v_u_95 = 0
            local v_u_96 = 0
            local v_u_97 = false
            local function v_u_100(p98, ...)
                if not v_u_97 then
                    v_u_95 = v_u_95 + 1
                    if p_u_87 == nil then
                        v_u_93[p98] = ...
                    else
                        v_u_93[v_u_95] = ...
                    end
                    if v_u_95 >= (p_u_87 or #p_u_86) then
                        v_u_97 = true
                        p_u_90(v_u_93)
                        for _, v99 in ipairs(v_u_94) do
                            v99:cancel()
                        end
                    end
                end
            end
            p92(function()
                for _, v101 in ipairs(v_u_94) do
                    v101:cancel()
                end
            end)
            local v_u_102 = v_u_97
            for v_u_103, v104 in ipairs(p_u_86) do
                v_u_94[v_u_103] = v104:andThen(function(...)
                    v_u_100(v_u_103, ...)
                end, function(...)
                    v_u_96 = v_u_96 + 1
                    if p_u_87 == nil or #p_u_86 - v_u_96 < p_u_87 then
                        for _, v105 in ipairs(v_u_94) do
                            v105:cancel()
                        end
                        v_u_102 = true
                        p_u_91(...)
                    end
                end)
            end
            if v_u_102 then
                for _, v106 in ipairs(v_u_94) do
                    v106:cancel()
                end
            end
        end)
    end
end
function v_u_44.all(...)
    local v107 = { ... }
    local v108 = v107[1]
    if type(v108) == "table" and not v_u_44.is(v107[1]) then
        v107 = v107[1]
    end
    return v_u_44._all(debug.traceback(nil, 2), v107)
end
function v_u_44.fold(p109, p_u_110, p111)
    local v112 = type(p109) == "table"
    assert(v112, "Bad argument #1 to Promise.fold: must be a table")
    local v113
    if type(p_u_110) == "function" then
        v113 = true
    elseif type(p_u_110) == "table" then
        local v114 = getmetatable(p_u_110)
        if v114 then
            local v115 = rawget(v114, "__call")
            v113 = type(v115) == "function"
        else
            v113 = false
        end
    else
        v113 = false
    end
    assert(v113, "Bad argument #2 to Promise.fold: must be a function")
    local v_u_116 = v_u_44.resolve(p111)
    return v_u_44.each(p109, function(p_u_117, p_u_118)
        v_u_116 = v_u_116:andThen(function(p119)
            return p_u_110(p119, p_u_117, p_u_118)
        end)
    end):andThen(function()
        return v_u_116
    end)
end
function v_u_44.some(p120, p121)
    local v122 = type(p121) == "number"
    assert(v122, "Bad argument #2 to Promise.some: must be a number")
    return v_u_44._all(debug.traceback(nil, 2), p120, p121)
end
function v_u_44.any(p123)
    return v_u_44._all(debug.traceback(nil, 2), p123, 1):andThen(function(p124)
        return p124[1]
    end)
end
function v_u_44.allSettled(p_u_125)
    if type(p_u_125) ~= "table" then
        error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2)
    end
    for v126, v127 in pairs(p_u_125) do
        if not v_u_44.is(v127) then
            error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v126))), 2)
        end
    end
    if #p_u_125 == 0 then
        return v_u_44.resolve({})
    else
        return v_u_44._new(debug.traceback(nil, 2), function(p_u_128, _, p129)
            local v_u_130 = {}
            local v_u_131 = {}
            local v_u_132 = 0
            local function v_u_134(p133, ...)
                v_u_132 = v_u_132 + 1
                v_u_130[p133] = ...
                if v_u_132 >= #p_u_125 then
                    p_u_128(v_u_130)
                end
            end
            p129(function()
                for _, v135 in ipairs(v_u_131) do
                    v135:cancel()
                end
            end)
            for v_u_136, v137 in ipairs(p_u_125) do
                v_u_131[v_u_136] = v137:finally(function(...)
                    v_u_134(v_u_136, ...)
                end)
            end
        end)
    end
end
function v_u_44.race(p_u_138)
    local v139 = type(p_u_138) == "table"
    local v140 = string.format
    assert(v139, v140("Please pass a list of promises to %s", "Promise.race"))
    for v141, v142 in pairs(p_u_138) do
        local v143 = v_u_44.is(v142)
        local v144 = string.format
        local v145 = tostring(v141)
        assert(v143, v144("Non-promise value passed into %s at index %s", "Promise.race", v145))
    end
    return v_u_44._new(debug.traceback(nil, 2), function(p_u_146, p_u_147, p148)
        local v_u_149 = {}
        local v_u_150 = false
        if not p148(function(...)
            for _, v151 in ipairs(v_u_149) do
                v151:cancel()
            end
            v_u_150 = true
            return p_u_147(...)
        end) then
            local v_u_152 = v_u_150
            for v153, v154 in ipairs(p_u_138) do
                v_u_149[v153] = v154:andThen(function(...)
                    for _, v155 in ipairs(v_u_149) do
                        v155:cancel()
                    end
                    v_u_152 = true
                    return p_u_146(...)
                end, function(...)
                    for _, v156 in ipairs(v_u_149) do
                        v156:cancel()
                    end
                    v_u_152 = true
                    return p_u_147(...)
                end)
            end
            if v_u_152 then
                for _, v157 in ipairs(v_u_149) do
                    v157:cancel()
                end
            end
        end
    end)
end
function v_u_44.each(p_u_158, p_u_159)
    local v160 = type(p_u_158) == "table"
    local v161 = string.format
    assert(v160, v161("Please pass a list of promises to %s", "Promise.each"))
    local v162
    if type(p_u_159) == "function" then
        v162 = true
    elseif type(p_u_159) == "table" then
        local v163 = getmetatable(p_u_159)
        if v163 then
            local v164 = rawget(v163, "__call")
            v162 = type(v164) == "function"
        else
            v162 = false
        end
    else
        v162 = false
    end
    local v165 = string.format
    assert(v162, v165("Please pass a handler function to %s!", "Promise.each"))
    return v_u_44._new(debug.traceback(nil, 2), function(p166, p167, p168)
        local v169 = {}
        local v_u_170 = {}
        local v_u_171 = false
        p168(function()
            v_u_171 = true
            for _, v172 in ipairs(v_u_170) do
                v172:cancel()
            end
        end)
        local v173 = v_u_171
        local v174 = {}
        for v175, v176 in ipairs(p_u_158) do
            if v_u_44.is(v176) then
                if v176:getStatus() == v_u_44.Status.Cancelled then
                    for _, v177 in ipairs(v_u_170) do
                        v177:cancel()
                    end
                    return p167(v_u_8.new({
                        ["error"] = "Promise is cancelled",
                        ["kind"] = v_u_8.Kind.AlreadyCancelled,
                        ["context"] = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v175, v176._source)
                    }))
                end
                if v176:getStatus() == v_u_44.Status.Rejected then
                    for _, v178 in ipairs(v_u_170) do
                        v178:cancel()
                    end
                    return p167(select(2, v176:await()))
                end
                local v179 = v176:andThen(function(...)
                    return ...
                end)
                table.insert(v_u_170, v179)
                v174[v175] = v179
            else
                v174[v175] = v176
            end
        end
        for v180, v183 in ipairs(v174) do
            if v_u_44.is(v183) then
                local v182, v183 = v183:await()
                if not v182 then
                    for _, v184 in ipairs(v_u_170) do
                        v184:cancel()
                    end
                    return p167(v183)
                end
            end
            if v173 then
                return
            end
            local v185 = v_u_44.resolve(p_u_159(v183, v180))
            table.insert(v_u_170, v185)
            local v186, v187 = v185:await()
            if not v186 then
                for _, v188 in ipairs(v_u_170) do
                    v188:cancel()
                end
                return p167(v187)
            end
            v169[v180] = v187
        end
        p166(v169)
    end)
end
function v_u_44.is(p189)
    if type(p189) ~= "table" then
        return false
    end
    local v190 = getmetatable(p189)
    if v190 == v_u_44 then
        return true
    end
    if v190 ~= nil then
        if type(v190) == "table" then
            local v191 = rawget(v190, "__index")
            if type(v191) == "table" then
                local v192 = rawget(v190, "__index")
                local v193 = rawget(v192, "andThen")
                local v194
                if type(v193) == "function" then
                    v194 = true
                else
                    local v195 = type(v193) == "table" and getmetatable(v193)
                    if v195 then
                        local v196 = rawget(v195, "__call")
                        v194 = type(v196) == "function"
                    else
                        v194 = false
                    end
                end
                if v194 then
                    return true
                end
            end
        end
        return false
    end
    local v197 = p189.andThen
    if type(v197) == "function" then
        return true
    end
    local v198 = type(v197) == "table" and getmetatable(v197)
    if v198 then
        local v199 = rawget(v198, "__call")
        if type(v199) == "function" then
            return true
        end
    end
    return false
end
function v_u_44.promisify(p_u_200)
    return function(...)
        return v_u_44._try(debug.traceback(nil, 2), p_u_200, ...)
    end
end
local v_u_201 = nil
local v_u_202 = nil
function v_u_44.delay(p203)
    local v204 = type(p203) == "number"
    assert(v204, "Bad argument #1 to Promise.delay, must be a number.")
    local v_u_205 = (p203 < 0.016666666666666666 or p203 == (1 / 0)) and 0.016666666666666666 or p203
    return v_u_44._new(debug.traceback(nil, 2), function(p206, _, p207)
        local v208 = v_u_44._getTime()
        local v209 = v208 + v_u_205
        local v_u_210 = {
            ["resolve"] = p206,
            ["startTime"] = v208,
            ["endTime"] = v209
        }
        if v_u_202 == nil then
            v_u_201 = v_u_210
            v_u_202 = v_u_44._timeEvent:Connect(function()
                local v211 = v_u_44._getTime()
                while v_u_201 ~= nil and v_u_201.endTime < v211 do
                    local v212 = v_u_201
                    v_u_201 = v212.next
                    if v_u_201 == nil then
                        v_u_202:Disconnect()
                        v_u_202 = nil
                    else
                        v_u_201.previous = nil
                    end
                    v212.resolve(v_u_44._getTime() - v212.startTime)
                end
            end)
        elseif v_u_201.endTime < v209 then
            local v213 = v_u_201
            local v214 = v213.next
            while v214 ~= nil and v214.endTime < v209 do
                local v215 = v214.next
                v213 = v214
                v214 = v215
            end
            v213.next = v_u_210
            v_u_210.previous = v213
            if v214 ~= nil then
                v_u_210.next = v214
                v214.previous = v_u_210
            end
        else
            v_u_210.next = v_u_201
            v_u_201.previous = v_u_210
            v_u_201 = v_u_210
        end
        p207(function()
            local v216 = v_u_210.next
            if v_u_201 == v_u_210 then
                if v216 == nil then
                    v_u_202:Disconnect()
                    v_u_202 = nil
                else
                    v216.previous = nil
                end
                v_u_201 = v216
            else
                local v217 = v_u_210.previous
                v217.next = v216
                if v216 ~= nil then
                    v216.previous = v217
                end
            end
        end)
    end)
end
local function v222(p218, p_u_219, p_u_220)
    local v_u_221 = debug.traceback(nil, 2)
    return v_u_44.race({ v_u_44.delay(p_u_219):andThen(function()
            return v_u_44.reject(p_u_220 == nil and v_u_8.new({
                ["kind"] = v_u_8.Kind.TimedOut,
                ["error"] = "Timed out",
                ["context"] = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p_u_219, v_u_221)
            }) or p_u_220)
        end), p218 })
end
v_u_44.prototype.timeout = v222
function v_u_44.prototype.getStatus(p223)
    return p223._status
end
local function v248(p_u_224, p_u_225, p_u_226, p_u_227)
    p_u_224._unhandledRejection = false
    return v_u_44._new(p_u_225, function(p_u_228, p_u_229)
        local v230
        if p_u_226 then
            local v_u_231 = p_u_225
            local v_u_232 = p_u_226
            v230 = function(...)
                local v233, v234, v235 = v_u_43(v_u_231, v_u_232, ...)
                if v233 then
                    p_u_228(unpack(v235, 1, v234))
                else
                    p_u_229(v235[1])
                end
            end
        else
            v230 = p_u_228
        end
        local v236
        if p_u_227 then
            local v_u_237 = p_u_225
            local v_u_238 = p_u_227
            v236 = function(...)
                local v239, v240, v241 = v_u_43(v_u_237, v_u_238, ...)
                if v239 then
                    p_u_228(unpack(v241, 1, v240))
                else
                    p_u_229(v241[1])
                end
            end
        else
            v236 = p_u_229
        end
        if p_u_224._status == v_u_44.Status.Started then
            local v242 = p_u_224._queuedResolve
            table.insert(v242, v230)
            local v243 = p_u_224._queuedReject
            table.insert(v243, v236)
            return
        elseif p_u_224._status == v_u_44.Status.Resolved then
            local v244 = p_u_224._values
            local v245 = p_u_224._valuesLength
            v230(unpack(v244, 1, v245))
            return
        elseif p_u_224._status == v_u_44.Status.Rejected then
            local v246 = p_u_224._values
            local v247 = p_u_224._valuesLength
            v236(unpack(v246, 1, v247))
        elseif p_u_224._status == v_u_44.Status.Cancelled then
            p_u_229(v_u_8.new({
                ["error"] = "Promise is cancelled",
                ["kind"] = v_u_8.Kind.AlreadyCancelled,
                ["context"] = "Promise created at\n\n" .. p_u_225
            }))
        end
    end, p_u_224)
end
v_u_44.prototype._andThen = v248
function v_u_44.prototype.andThen(p249, p250, p251)
    local v252
    if p250 == nil or type(p250) == "function" then
        v252 = true
    elseif type(p250) == "table" then
        local v253 = getmetatable(p250)
        if v253 then
            local v254 = rawget(v253, "__call")
            v252 = type(v254) == "function"
        else
            v252 = false
        end
    else
        v252 = false
    end
    local v255 = string.format
    assert(v252, v255("Please pass a handler function to %s!", "Promise:andThen"))
    local v256
    if p251 == nil or type(p251) == "function" then
        v256 = true
    elseif type(p251) == "table" then
        local v257 = getmetatable(p251)
        if v257 then
            local v258 = rawget(v257, "__call")
            v256 = type(v258) == "function"
        else
            v256 = false
        end
    else
        v256 = false
    end
    local v259 = string.format
    assert(v256, v259("Please pass a handler function to %s!", "Promise:andThen"))
    return p249:_andThen(debug.traceback(nil, 2), p250, p251)
end
function v_u_44.prototype.andThenAsync(p260, p261, p262)
    local v263
    if p261 == nil or type(p261) == "function" then
        v263 = true
    elseif type(p261) == "table" then
        local v264 = getmetatable(p261)
        if v264 then
            local v265 = rawget(v264, "__call")
            v263 = type(v265) == "function"
        else
            v263 = false
        end
    else
        v263 = false
    end
    local v266 = string.format
    assert(v263, v266("Please pass a handler function to %s!", "Promise:andThenAsync"))
    local v267
    if p262 == nil or type(p262) == "function" then
        v267 = true
    elseif type(p262) == "table" then
        local v268 = getmetatable(p262)
        if v268 then
            local v269 = rawget(v268, "__call")
            v267 = type(v269) == "function"
        else
            v267 = false
        end
    else
        v267 = false
    end
    local v270 = string.format
    assert(v267, v270("Please pass a handler function to %s!", "Promise:andThenAsync"))
    return p260:_andThen(debug.traceback(nil, 2), function(...)
        local v_u_271, v_u_272 = v_u_34(...)
        return v_u_44.defer(function(p273)
            local v274 = v_u_272
            local v275 = v_u_271
            p273(unpack(v274, 1, v275))
        end)
    end, function(...)
        local v_u_276, v_u_277 = v_u_34(...)
        return v_u_44.defer(function(_, p278)
            local v279 = v_u_277
            local v280 = v_u_276
            p278(unpack(v279, 1, v280))
        end)
    end):andThen(p261, p262)
end
function v_u_44.prototype.catch(p281, p282)
    local v283
    if p282 == nil or type(p282) == "function" then
        v283 = true
    elseif type(p282) == "table" then
        local v284 = getmetatable(p282)
        if v284 then
            local v285 = rawget(v284, "__call")
            v283 = type(v285) == "function"
        else
            v283 = false
        end
    else
        v283 = false
    end
    local v286 = string.format
    assert(v283, v286("Please pass a handler function to %s!", "Promise:catch"))
    return p281:_andThen(debug.traceback(nil, 2), nil, p282)
end
function v_u_44.prototype.tap(p287, p_u_288)
    local v289
    if type(p_u_288) == "function" then
        v289 = true
    elseif type(p_u_288) == "table" then
        local v290 = getmetatable(p_u_288)
        if v290 then
            local v291 = rawget(v290, "__call")
            v289 = type(v291) == "function"
        else
            v289 = false
        end
    else
        v289 = false
    end
    local v292 = string.format
    assert(v289, v292("Please pass a handler function to %s!", "Promise:tap"))
    return p287:_andThen(debug.traceback(nil, 2), function(...)
        local v293 = p_u_288(...)
        if not v_u_44.is(v293) then
            return ...
        end
        local v_u_294, v_u_295 = v_u_34(...)
        return v293:andThen(function()
            local v296 = v_u_295
            local v297 = v_u_294
            return unpack(v296, 1, v297)
        end)
    end)
end
function v_u_44.prototype.andThenCall(p298, p_u_299, ...)
    local v300
    if type(p_u_299) == "function" then
        v300 = true
    elseif type(p_u_299) == "table" then
        local v301 = getmetatable(p_u_299)
        if v301 then
            local v302 = rawget(v301, "__call")
            v300 = type(v302) == "function"
        else
            v300 = false
        end
    else
        v300 = false
    end
    local v303 = string.format
    assert(v300, v303("Please pass a handler function to %s!", "Promise:andThenCall"))
    local v_u_304, v_u_305 = v_u_34(...)
    return p298:_andThen(debug.traceback(nil, 2), function()
        local v306 = v_u_305
        local v307 = v_u_304
        return p_u_299(unpack(v306, 1, v307))
    end)
end
function v_u_44.prototype.andThenReturn(p308, ...)
    local v_u_309, v_u_310 = v_u_34(...)
    return p308:_andThen(debug.traceback(nil, 2), function()
        local v311 = v_u_310
        local v312 = v_u_309
        return unpack(v311, 1, v312)
    end)
end
function v_u_44.prototype.cancel(p313)
    if p313._status == v_u_44.Status.Started then
        p313._status = v_u_44.Status.Cancelled
        if p313._cancellationHook then
            p313._cancellationHook()
        end
        coroutine.close(p313._thread)
        if p313._parent then
            p313._parent:_consumerCancelled(p313)
        end
        for v314 in pairs(p313._consumers) do
            v314:cancel()
        end
        p313:_finalize()
    end
end
function v_u_44.prototype._consumerCancelled(p315, p316)
    if p315._status == v_u_44.Status.Started then
        p315._consumers[p316] = nil
        if next(p315._consumers) == nil then
            p315:cancel()
        end
    end
end
function v_u_44.prototype._finally(p_u_317, p_u_318, p_u_319, p_u_320)
    if not p_u_320 then
        p_u_317._unhandledRejection = false
    end
    return v_u_44._new(p_u_318, function(p_u_321, p_u_322)
        local v_u_323
        if p_u_319 then
            local v_u_324 = p_u_318
            local v_u_325 = p_u_319
            v_u_323 = function(...)
                local v326, v327, v328 = v_u_43(v_u_324, v_u_325, ...)
                if v326 then
                    p_u_321(unpack(v328, 1, v327))
                else
                    p_u_322(v328[1])
                end
            end
        else
            v_u_323 = p_u_321
        end
        local v329 = p_u_320 and function(...)
            if p_u_317._status == v_u_44.Status.Rejected then
                return p_u_321(p_u_317)
            else
                return v_u_323(...)
            end
        end or v_u_323
        if p_u_317._status == v_u_44.Status.Started then
            local v330 = p_u_317._queuedFinally
            table.insert(v330, v329)
        else
            v329(p_u_317._status)
        end
    end, p_u_317)
end
function v_u_44.prototype.finally(p331, p332)
    local v333
    if p332 == nil or type(p332) == "function" then
        v333 = true
    elseif type(p332) == "table" then
        local v334 = getmetatable(p332)
        if v334 then
            local v335 = rawget(v334, "__call")
            v333 = type(v335) == "function"
        else
            v333 = false
        end
    else
        v333 = false
    end
    local v336 = string.format
    assert(v333, v336("Please pass a handler function to %s!", "Promise:finally"))
    return p331:_finally(debug.traceback(nil, 2), p332)
end
function v_u_44.prototype.finallyCall(p337, p_u_338, ...)
    local v339
    if type(p_u_338) == "function" then
        v339 = true
    elseif type(p_u_338) == "table" then
        local v340 = getmetatable(p_u_338)
        if v340 then
            local v341 = rawget(v340, "__call")
            v339 = type(v341) == "function"
        else
            v339 = false
        end
    else
        v339 = false
    end
    local v342 = string.format
    assert(v339, v342("Please pass a handler function to %s!", "Promise:finallyCall"))
    local v_u_343, v_u_344 = v_u_34(...)
    return p337:_finally(debug.traceback(nil, 2), function()
        local v345 = v_u_344
        local v346 = v_u_343
        return p_u_338(unpack(v345, 1, v346))
    end)
end
function v_u_44.prototype.finallyReturn(p347, ...)
    local v_u_348, v_u_349 = v_u_34(...)
    return p347:_finally(debug.traceback(nil, 2), function()
        local v350 = v_u_349
        local v351 = v_u_348
        return unpack(v350, 1, v351)
    end)
end
function v_u_44.prototype.done(p352, p353)
    local v354
    if p353 == nil or type(p353) == "function" then
        v354 = true
    elseif type(p353) == "table" then
        local v355 = getmetatable(p353)
        if v355 then
            local v356 = rawget(v355, "__call")
            v354 = type(v356) == "function"
        else
            v354 = false
        end
    else
        v354 = false
    end
    local v357 = string.format
    assert(v354, v357("Please pass a handler function to %s!", "Promise:done"))
    return p352:_finally(debug.traceback(nil, 2), p353, true)
end
function v_u_44.prototype.doneCall(p358, p_u_359, ...)
    local v360
    if type(p_u_359) == "function" then
        v360 = true
    elseif type(p_u_359) == "table" then
        local v361 = getmetatable(p_u_359)
        if v361 then
            local v362 = rawget(v361, "__call")
            v360 = type(v362) == "function"
        else
            v360 = false
        end
    else
        v360 = false
    end
    local v363 = string.format
    assert(v360, v363("Please pass a handler function to %s!", "Promise:doneCall"))
    local v_u_364, v_u_365 = v_u_34(...)
    return p358:_finally(debug.traceback(nil, 2), function()
        local v366 = v_u_365
        local v367 = v_u_364
        return p_u_359(unpack(v366, 1, v367))
    end, true)
end
function v_u_44.prototype.doneReturn(p368, ...)
    local v_u_369, v_u_370 = v_u_34(...)
    return p368:_finally(debug.traceback(nil, 2), function()
        local v371 = v_u_370
        local v372 = v_u_369
        return unpack(v371, 1, v372)
    end, true)
end
function v_u_44.prototype.awaitStatus(p373)
    p373._unhandledRejection = false
    if p373._status == v_u_44.Status.Started then
        local v_u_374 = coroutine.running()
        p373:finally(function()
            task.spawn(v_u_374)
        end)
        coroutine.yield()
    end
    if p373._status == v_u_44.Status.Resolved then
        local v375 = p373._status
        local v376 = p373._values
        local v377 = p373._valuesLength
        return v375, unpack(v376, 1, v377)
    end
    if p373._status ~= v_u_44.Status.Rejected then
        return p373._status
    end
    local v378 = p373._status
    local v379 = p373._values
    local v380 = p373._valuesLength
    return v378, unpack(v379, 1, v380)
end
local function v_u_382(p381, ...)
    return p381 == v_u_44.Status.Resolved, ...
end
function v_u_44.prototype.await(p383)
    return v_u_382(p383:awaitStatus())
end
local function v_u_385(p384, ...)
    if p384 ~= v_u_44.Status.Resolved then
        error(... == nil and "Expected Promise rejected with no value." or ..., 3)
    end
    return ...
end
function v_u_44.prototype.expect(p386)
    return v_u_385(p386:awaitStatus())
end
v_u_44.prototype.awaitValue = v_u_44.prototype.expect
function v_u_44.prototype._unwrap(p387)
    if p387._status == v_u_44.Status.Started then
        error("Promise has not resolved or rejected.", 2)
    end
    local v388 = p387._status == v_u_44.Status.Resolved
    local v389 = p387._values
    local v390 = p387._valuesLength
    return v388, unpack(v389, 1, v390)
end
local function v399(p_u_391, ...)
    if p_u_391._status == v_u_44.Status.Started then
        if v_u_44.is((...)) then
            if select("#", ...) > 1 then
                local v392 = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p_u_391._source)
                warn(v392)
            end
            local v_u_393 = ...
            local v395 = v_u_393:andThen(function(...)
                p_u_391:_resolve(...)
            end, function(...)
                local v394 = v_u_393._values[1]
                if v_u_393._error then
                    v394 = v_u_8.new({
                        ["error"] = v_u_393._error,
                        ["kind"] = v_u_8.Kind.ExecutionError,
                        ["context"] = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
                    })
                end
                if v_u_8.isKind(v394, v_u_8.Kind.ExecutionError) then
                    return p_u_391:_reject(v394:extend({
                        ["error"] = "This Promise was chained to a Promise that errored.",
                        ["trace"] = "",
                        ["context"] = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p_u_391._source)
                    }))
                end
                p_u_391:_reject(...)
            end)
            if v395._status == v_u_44.Status.Cancelled then
                p_u_391:cancel()
            elseif v395._status == v_u_44.Status.Started then
                p_u_391._parent = v395
                v395._consumers[p_u_391] = true
            end
        else
            p_u_391._status = v_u_44.Status.Resolved
            local v396, v397 = v_u_34(...)
            p_u_391._valuesLength = v396
            p_u_391._values = v397
            for _, v398 in ipairs(p_u_391._queuedResolve) do
                coroutine.wrap(v398)(...)
            end
            p_u_391:_finalize()
            return
        end
    else
        if v_u_44.is((...)) then
            (...):_consumerCancelled(p_u_391)
        end
        return
    end
end
v_u_44.prototype._resolve = v399
function v_u_44.prototype._reject(p_u_400, ...)
    if p_u_400._status == v_u_44.Status.Started then
        p_u_400._status = v_u_44.Status.Rejected
        local v401, v402 = v_u_34(...)
        p_u_400._valuesLength = v401
        p_u_400._values = v402
        local v403 = p_u_400._queuedReject
        if next(v403) == nil then
            local v_u_404 = tostring((...))
            coroutine.wrap(function()
                v_u_44._timeEvent:Wait()
                if p_u_400._unhandledRejection then
                    local v405 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v_u_404, p_u_400._source)
                    for _, v406 in ipairs(v_u_44._unhandledRejectionCallbacks) do
                        local v407 = task.spawn
                        local v408 = p_u_400
                        local v409 = p_u_400._values
                        local v410 = p_u_400._valuesLength
                        v407(v406, v408, unpack(v409, 1, v410))
                    end
                    if not v_u_44.TEST then
                        warn(v405)
                    end
                else
                    return
                end
            end)()
        else
            for _, v411 in ipairs(p_u_400._queuedReject) do
                coroutine.wrap(v411)(...)
            end
        end
        p_u_400:_finalize()
    end
end
function v_u_44.prototype._finalize(p412)
    for _, v413 in ipairs(p412._queuedFinally) do
        coroutine.wrap(v413)(p412._status)
    end
    p412._queuedFinally = nil
    p412._queuedReject = nil
    p412._queuedResolve = nil
    if not v_u_44.TEST then
        p412._parent = nil
        p412._consumers = nil
    end
    task.defer(coroutine.close, p412._thread)
end
local function v418(p414, p415)
    local v416 = debug.traceback(nil, 2)
    if p414._status == v_u_44.Status.Resolved then
        return p414:_andThen(v416, function(...)
            return ...
        end)
    end
    local v417 = v_u_44.reject
    if p415 == nil then
        p415 = v_u_8.new({
            ["kind"] = v_u_8.Kind.NotResolvedInTime,
            ["error"] = "This Promise was not resolved in time for :now()",
            ["context"] = ":now() was called at:\n\n" .. v416
        }) or p415
    end
    return v417(p415)
end
v_u_44.prototype.now = v418
function v_u_44.retry(p_u_419, p_u_420, ...)
    local v421
    if type(p_u_419) == "function" then
        v421 = true
    elseif type(p_u_419) == "table" then
        local v422 = getmetatable(p_u_419)
        if v422 then
            local v423 = rawget(v422, "__call")
            v421 = type(v423) == "function"
        else
            v421 = false
        end
    else
        v421 = false
    end
    assert(v421, "Parameter #1 to Promise.retry must be a function")
    local v424 = type(p_u_420) == "number"
    assert(v424, "Parameter #2 to Promise.retry must be a number")
    local v_u_425 = { ... }
    local v_u_426 = select("#", ...)
    return v_u_44.resolve(p_u_419(...)):catch(function(...)
        if p_u_420 <= 0 then
            return v_u_44.reject(...)
        end
        local v427 = v_u_425
        local v428 = v_u_426
        return v_u_44.retry(p_u_419, p_u_420 - 1, unpack(v427, 1, v428))
    end)
end
function v_u_44.retryWithDelay(p_u_429, p_u_430, p_u_431, ...)
    local v432
    if type(p_u_429) == "function" then
        v432 = true
    elseif type(p_u_429) == "table" then
        local v433 = getmetatable(p_u_429)
        if v433 then
            local v434 = rawget(v433, "__call")
            v432 = type(v434) == "function"
        else
            v432 = false
        end
    else
        v432 = false
    end
    assert(v432, "Parameter #1 to Promise.retry must be a function")
    local v435 = type(p_u_430) == "number"
    assert(v435, "Parameter #2 (times) to Promise.retry must be a number")
    local v436 = type(p_u_431) == "number"
    assert(v436, "Parameter #3 (seconds) to Promise.retry must be a number")
    local v_u_437 = { ... }
    local v_u_438 = select("#", ...)
    return v_u_44.resolve(p_u_429(...)):catch(function(...)
        if p_u_430 <= 0 then
            return v_u_44.reject(...)
        end
        v_u_44.delay(p_u_431):await()
        local v439 = v_u_437
        local v440 = v_u_438
        return v_u_44.retryWithDelay(p_u_429, p_u_430 - 1, p_u_431, unpack(v439, 1, v440))
    end)
end
function v_u_44.fromEvent(p_u_441, p442)
    local v_u_443 = p442 or function()
        return true
    end
    return v_u_44._new(debug.traceback(nil, 2), function(p_u_444, _, p445)
        local v_u_446 = nil
        local v_u_447 = false
        local function v448()
            v_u_446:Disconnect()
            v_u_446 = nil
        end
        v_u_446 = p_u_441:Connect(function(...)
            local v449 = v_u_443(...)
            if v449 == true then
                p_u_444(...)
                if v_u_446 then
                    v_u_446:Disconnect()
                    v_u_446 = nil
                else
                    v_u_447 = true
                end
            else
                if type(v449) ~= "boolean" then
                    error("Promise.fromEvent predicate should always return a boolean")
                end
                return
            end
        end)
        if v_u_447 and v_u_446 then
            return v448()
        end
        p445(v448)
    end)
end
function v_u_44.onUnhandledRejection(p_u_450)
    local v451 = v_u_44._unhandledRejectionCallbacks
    table.insert(v451, p_u_450)
    return function()
        local v452 = table.find(v_u_44._unhandledRejectionCallbacks, p_u_450)
        if v452 then
            table.remove(v_u_44._unhandledRejectionCallbacks, v452)
        end
    end
end
return v_u_44