--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Stats.StateDictionary (ModuleScript)

local v1 = require(script.Parent.Parent.Class)
local v_u_2 = require(script.Parent.Parent.Parent.t)
local v_u_3 = v_u_2.numberConstrainedExclusive((-1 / 0), (1 / 0))
local v4 = v1("StateDictionary")
function v4.__init(p5, p6)
    p5.stats = {}
    local v7 = {}
    for v8, v9 in pairs(p6) do
        p5.stats[v8] = v9
        if typeof(v9) == "boolean" then
            v7[v8] = v_u_2.boolean
        elseif typeof(v9) == "number" then
            v7[v8] = v_u_3
        elseif typeof(v9) == "string" then
            v7[v8] = v_u_2.every(v_u_2.string, function(p10)
                return #p10 < 1000
            end)
        end
    end
    p5.keyToTypeCheckerMap = v7
    p5.isSerializedData = v_u_2.strictInterface(v7)
end
function v4.set(p11, p12, p13)
    if typeof(p12) == "string" and #p12 <= 100 then
        if p11.keyToTypeCheckerMap[p12] then
            local v14 = p11.keyToTypeCheckerMap[p12]
            assert(v14(p13))
            p11.stats[p12] = p13
        else
            warn("[PerformanceLogger] Non-existent key passed to StateDictionary:set; discarding (" .. tostring(p12) .. ")\n" .. debug.traceback())
        end
    else
        warn("[PerformanceLogger] Bad key passed to StateDictionary:set; discarding (" .. tostring(p12) .. ")\n" .. debug.traceback())
        return
    end
end
function v4.describe(p15, p16, p17, _)
    for v18, v19 in pairs(p15.stats) do
        p16[p17 .. "." .. v18] = v19
    end
end
return v4