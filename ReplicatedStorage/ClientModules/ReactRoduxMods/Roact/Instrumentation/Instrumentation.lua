--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.Instrumentation (ModuleScript)

local v1 = {}
local v_u_2 = {}
local function v_u_9(p3)
    if not (p3 and (p3._element and p3._element.component)) then
        local v4 = warn
        local v5 = p3._key
        v4("Component name not valid for " .. tostring(v5))
        return nil
    end
    local v6 = p3._element.component
    local v7 = tostring(v6)
    local v8 = v_u_2[v7]
    if not v8 then
        v8 = {
            ["updateReqCount"] = 0,
            ["didUpdateCount"] = 0,
            ["shouldUpdateTime"] = 0,
            ["renderCount"] = 0,
            ["renderTime"] = 0
        }
        v_u_2[v7] = v8
    end
    return v8
end
function v1.logShouldUpdate(p10, p11, p12)
    local v13 = v_u_9(p10)
    if v13 then
        v13.updateReqCount = v13.updateReqCount + 1
        v13.didUpdateCount = v13.didUpdateCount + (p11 and 1 or 0)
        v13.shouldUpdateTime = v13.shouldUpdateTime + p12 * 1000
    end
end
function v1.logRenderTime(p14, p15)
    local v16 = v_u_9(p14)
    if v16 then
        v16.renderCount = v16.renderCount + 1
        v16.renderTime = v16.renderTime + p15 * 1000
    end
end
function v1.clearCollectedStats()
    v_u_2 = {}
end
function v1.getCollectedStats()
    return v_u_2
end
return v1