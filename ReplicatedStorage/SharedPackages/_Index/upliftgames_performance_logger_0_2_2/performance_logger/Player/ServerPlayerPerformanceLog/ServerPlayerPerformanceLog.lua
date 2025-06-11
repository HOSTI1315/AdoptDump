--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Player.ServerPlayerPerformanceLog (ModuleScript)

local v1 = require(script.Parent.Parent.Class)
local v_u_2 = require(script.Parent.Parent.Util)
local v_u_3 = require(script.Parent.Parent.Parent.Promise)
local v_u_4 = require(script.Parent.Parent.Stats)
local v_u_5 = require(script.Parent.Parent.Remotes)
local function v_u_6()
    return DateTime.now().UnixTimestampMillis / 1000
end
local v7 = v1("ServerPlayerPerformanceLog")
function v7.__init(p8, p9, p10)
    assert(p10, "Missing options")
    local v11 = p10.playerStateDefaults
    assert(v11, "Missing options.playerStateDefaults")
    local v12 = p10.staticTimingNames
    assert(v12, "Missing options.staticTimingNames")
    p8.player = p9
    p8.deviceInfo = v_u_4.DeviceInfo.new()
    p8.memory = v_u_4.MemoryStats.new()
    p8.miscStats = v_u_4.MiscSharedStats.new()
    p8.exitStates = v_u_4.UserExitStates.new()
    p8.events = v_u_4.Events.new()
    p8.playerState = v_u_4.StateDictionary.new(p10.playerStateDefaults)
    p8.staticTimings = v_u_4.StaticTimings.new(p10.staticTimingNames)
    p8.pingMs = v_u_4.AverageStat.new()
    p8.sessionStartTime = -1
    p8.sessionStartTimestamp = v_u_4.NumberStat.new()
    p8.sessionLength = v_u_4.NumberStat.new()
    p8.getTimeNow = p10.getTimeNow or v_u_6
end
function v7.startSession(p13)
    p13.sessionStartTime = os.clock()
    local v14 = p13.sessionStartTimestamp
    local v15 = p13.getTimeNow() * 1000
    v14:set((math.floor(v15)))
end
function v7.endSession(p16)
    p16.sessionLength:set(os.clock() - p16.sessionStartTime)
end
function v7.spawnPingTest(p_u_17)
    v_u_2.try("spawnPingTest", function()
        return v_u_3.try(function()
            local v18 = os.clock()
            v_u_5.ping:InvokeClient(p_u_17.player)
            local v19 = os.clock() - v18
            p_u_17.pingMs:add(v19 * 1000)
        end):catch(function(p20)
            if not tostring(p20):find("disconnected during remote call") then
                return v_u_3.reject(p20)
            end
        end)
    end)
end
function v7.toLoggable(p21)
    local v22 = {}
    p21.exitStates:describe(v22, "ExitStates")
    p21.events:describe(v22, "FinalEvents")
    p21.deviceInfo:describe(v22, "DeviceInfo")
    p21.staticTimings:describe(v22, "StaticTimings")
    p21.memory:describe(v22, "Memory")
    p21.miscStats:describe(v22, "MiscStats")
    p21.pingMs:describe(v22, "PingMs")
    p21.sessionStartTimestamp:describe(v22, "SessionStartTimestamp")
    p21.sessionLength:describe(v22, "SessionLength")
    p21.playerState:describe(v22, "PlayerState")
    return v22
end
return v7