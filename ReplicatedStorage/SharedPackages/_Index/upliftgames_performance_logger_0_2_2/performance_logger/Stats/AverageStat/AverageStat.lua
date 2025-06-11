--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Stats.AverageStat (ModuleScript)

local v1 = require(script.Parent.Parent.Class)
local v2 = require(script.Parent.Parent.Parent.t)
local v_u_3 = v2.numberConstrainedExclusive((-1 / 0), (1 / 0))
local v4 = v1("AverageStat")
function v4.__init(p5)
    p5.min = nil
    p5.max = nil
    p5.sum = 0
    p5.count = 0
end
function v4.add(p6, p7)
    if v_u_3(p7) then
        p6.sum = p6.sum + p7
        p6.count = p6.count + 1
        if p6.count == 1 then
            p6.min = p7
            p6.max = p7
        else
            local v8 = p6.min
            p6.min = math.min(v8, p7)
            local v9 = p6.max
            p6.max = math.max(v9, p7)
        end
    else
        warn("[PerformanceLogger] Discarding call to AverageStat:add because it was not a real number (" .. tostring(p7) .. ")\n" .. debug.traceback())
        return
    end
end
function v4.serialize(p10)
    return {
        ["min"] = p10.min,
        ["max"] = p10.max,
        ["sum"] = p10.sum,
        ["count"] = p10.count
    }
end
v4.isSerializedData = v2.every(v2.strictInterface({
    ["min"] = v2.optional(v_u_3),
    ["max"] = v2.optional(v_u_3),
    ["sum"] = v_u_3,
    ["count"] = v2.every(v_u_3, v2.numberMin(0))
}), function(p11)
    if p11.count == 0 then
        local v12
        if p11.min == nil and p11.max == nil then
            v12 = p11.sum == 0
        else
            v12 = false
        end
        return v12, "Half-initialized AverageStat"
    else
        local v13
        if p11.min == nil then
            v13 = false
        else
            v13 = p11.max ~= nil
        end
        return v13, "Half-initialized AverageStat"
    end
end)
function v4.deserializeAdd(p14, p15)
    local v16 = p14.isSerializedData
    assert(v16(p15))
    if p14.count == 0 then
        p14.min = p15.min
        p14.max = p15.max
    else
        local v17 = p14.min
        local v18 = p15.min
        p14.min = math.min(v17, v18)
        local v19 = p14.max
        local v20 = p15.max
        p14.max = math.max(v19, v20)
    end
    p14.sum = p14.sum + p15.sum
    p14.count = p14.count + p15.count
end
function v4.deserializeReplace(p21, p22)
    local v23 = p21.isSerializedData
    assert(v23(p22))
    p21.min = p22.min
    p21.max = p22.max
    p21.sum = p22.sum
    p21.count = p22.count
end
function v4.describe(p24, p25, p26)
    if p24.count ~= 0 then
        p25[p26 .. ".avg"] = p24.sum / p24.count
        p25[p26 .. ".min"] = p24.min
        p25[p26 .. ".max"] = p24.max
    end
end
return v4