--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Stats.NumberStat (ModuleScript)

local v1 = require(script.Parent.Parent.Class)
local v2 = require(script.Parent.Parent.Parent.t)
local v_u_3 = v2.numberConstrainedExclusive((-1 / 0), (1 / 0))
local v4 = v1("NumberStat")
function v4.__init(p5)
    p5.value = nil
end
function v4.add(p6, p7)
    if v_u_3(p7) then
        p6.value = (p6.value or 0) + p7
    else
        warn("[PerformanceLogger] Discarding call to NumberStat:add because it was not a real number (" .. tostring(p7) .. ")\n" .. debug.traceback())
    end
end
function v4.set(p8, p9)
    if v_u_3(p9) then
        p8.value = p9
    else
        warn("[PerformanceLogger] Discarding call to NumberStat:set because it was not a real number (" .. tostring(p9) .. ")\n" .. debug.traceback())
    end
end
function v4.serialize(p10)
    return p10.value
end
v4.isSerializedData = v2.optional(v_u_3)
function v4.deserializeAdd(p11, p12)
    local v13 = p11.isSerializedData
    assert(v13(p12))
    if p12 then
        p11.value = (p11.value or 0) + p12
    end
end
function v4.deserializeReplace(p14, p15)
    local v16 = p14.isSerializedData
    assert(v16(p15))
    p14.value = p15
end
function v4.describe(p17, p18, p19)
    if p17.value then
        p18[p19] = p17.value
    end
end
return v4