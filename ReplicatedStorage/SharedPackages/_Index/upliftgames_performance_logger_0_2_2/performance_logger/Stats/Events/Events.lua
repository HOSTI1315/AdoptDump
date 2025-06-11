--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Stats.Events (ModuleScript)

local v1 = require(script.Parent.Parent.Class)("Events")
function v1.__init(p2, p3)
    p2.events = {}
    p2.eventCutoff = p3 and (p3.eventCutoff or 20) or 20
    p2.maxReportedEvents = p3 and (p3.maxReportedEvents or 20) or 20
    p2.maxStoredEvents = p3 and p3.maxStoredEvents or 100
end
function v1.addEvent(p4, p5, p6)
    if typeof(p5) == "string" and #p5 <= 100 then
        local v7 = p6 or os.clock()
        while p4.events[1] and p4.events[1].time < v7 - p4.eventCutoff do
            table.remove(p4.events, 1)
        end
        while #p4.events >= p4.maxStoredEvents do
            table.remove(p4.events, 1)
        end
        local v8 = p4.events
        table.insert(v8, {
            ["name"] = p5,
            ["time"] = v7
        })
    else
        warn("[PerformanceLogger] Bad event name passed to Events:add; discarding (" .. tostring(p5) .. ")\n" .. debug.traceback())
    end
end
function v1.describe(p9, p10, p11, p12)
    local v13 = p12 or os.clock()
    while p9.events[1] and p9.events[1].time < v13 - p9.eventCutoff do
        table.remove(p9.events, 1)
    end
    local v14 = {}
    for _, v15 in ipairs(p9.events) do
        v14[v15.name] = (v14[v15.name] or 0) + 1
    end
    local v16 = {}
    local v17 = 0
    for v18, v19 in pairs(v14) do
        table.insert(v16, {
            ["name"] = v18,
            ["value"] = v19
        })
        v17 = v17 + v19
    end
    if #v16 > p9.maxReportedEvents then
        table.sort(v16, function(p20, p21)
            return p20.value > p21.value
        end)
    end
    local v22 = 0
    for v23, v24 in ipairs(v16) do
        p10[p11 .. ".Event." .. v24.name] = v24.value
        v22 = v22 + v24.value
        if v23 == p9.maxReportedEvents then
            break
        end
    end
    if #v16 > p9.maxReportedEvents then
        p10[p11 .. ".skippedEventsCount"] = #v16 - p9.maxReportedEvents
        p10[p11 .. ".skippedEventsSum"] = v17 - v22
    end
end
return v1