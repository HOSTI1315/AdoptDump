--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Stats.UserExitStates (ModuleScript)

local v1 = require(script.Parent.Parent.Class)
local v2 = require(script.Parent.Parent.Parent.t)
local v_u_3 = {
    "MouseLeftViewport",
    "RobloxMenu",
    "Unfocused",
    "MissingRenderstep",
    "Idle",
    "ServerShutdown",
    "Kicked"
}
local v4 = v1("UserExitStates")
function v4.__init(p5)
    p5.states = {}
    for _, v6 in ipairs(v_u_3) do
        p5.states[v6] = false
    end
end
local v_u_7 = v2.valueOf(v_u_3)
function v4.setState(p8, p9, p10)
    if v_u_7(p9) then
        if p10 then
            p8.states[p9] = true
        else
            p8.states[p9] = false
        end
    else
        warn("[PerformanceLogger] Discarding call to UserExitStates:set because it was not an exit state (" .. tostring(p9) .. ")\n" .. debug.traceback())
        return
    end
end
function v4.isSuspectedCrash(p11)
    for _, v12 in pairs(p11.states) do
        if v12 then
            return false
        end
    end
    return true
end
function v4.describe(p13, p14, p15)
    p14[p15 .. ".isSuspectedCrash"] = p13:isSuspectedCrash() and 1 or 0
    for v16, v17 in pairs(p13.states) do
        p14[p15 .. ".state." .. v16] = v17 and true or false
    end
end
return v4