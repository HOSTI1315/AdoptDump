--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Stats.StaticTimings (ModuleScript)

local v1 = require(script.Parent.Parent.Class)
local v_u_2 = require(script.Parent.NumberStat)
local v3 = v1("StaticTimings")
function v3.__init(p4, p5)
    p4.stats = {}
    for _, v6 in ipairs(p5) do
        p4.stats[v6] = v_u_2.new()
    end
end
function v3.setTiming(p7, p8, p9)
    if p7.stats[p8] then
        p7.stats[p8]:set(p9)
    else
        warn("[PerformanceLogger] Bad timing name passed to StaticTimings:setTiming; discarding (" .. tostring(p8) .. ")\n" .. debug.traceback())
    end
end
function v3.describe(p10, p11, p12)
    for v13, v14 in pairs(p10.stats) do
        v14:describe(p11, p12 .. "." .. v13)
    end
end
return v3