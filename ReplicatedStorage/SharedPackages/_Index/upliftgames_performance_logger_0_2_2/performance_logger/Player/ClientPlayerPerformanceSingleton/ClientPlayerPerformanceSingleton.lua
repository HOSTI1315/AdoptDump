--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Player.ClientPlayerPerformanceSingleton (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Remotes)
local v2 = require(script.Parent.Parent.Util)
local v_u_3 = require(script.Parent.ClientPlayerPerformanceLog)
local v4 = {}
local v_u_5 = nil
function v4._logEvent(...)
    local v6 = v_u_5
    assert(v6, "ClientPlayerPerformanceSingleton.start() has not been called yet"):logEvent(...)
end
function v4._logPlayerState(...)
    local v7 = v_u_5
    assert(v7, "ClientPlayerPerformanceSingleton.start() has not been called yet"):logPlayerState(...)
end
function v4._logStaticTiming(...)
    local v8 = v_u_5
    assert(v8, "ClientPlayerPerformanceSingleton.start() has not been called yet"):logStaticTiming(...)
end
v4.logEvent = v2.wrapInTry("logEvent", v4._logEvent)
v4.logPlayerState = v2.wrapInTry("logPlayerState", v4._logPlayerState)
v4.logStaticTiming = v2.wrapInTry("logStaticTiming", v4._logStaticTiming)
function v4.start()
    local v9 = {
        ["remotes"] = v_u_1
    }
    v_u_5 = v_u_3.new(v9)
    v_u_5:start()
end
return v4