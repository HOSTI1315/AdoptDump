--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Player.ServerPlayerPerformanceSingleton (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Remotes)
local v_u_2 = require(script.Parent.Parent.Util)
local v_u_3 = require(script.Parent.Parent.Parent.Promise)
local v_u_4 = require(script.Parent.ServerPlayerPerformanceLog)
local v_u_5 = {}
local function v_u_6()
    warn("[PerformanceLogger] No sessionEndedCallback implemented. Call ServerPlayerPerformanceSingleton.setSessionEndedCallback to set the sessionEndedCallback.")
end
local v_u_7 = nil
local v_u_8 = false
local v_u_9 = {}
function v_u_5.setSessionEndedCallback(p10)
    local v11 = type(p10) == "function"
    assert(v11, "Expected function for parameter 1 to ServerPlayerPerformanceSingleton.setSessionEndedCallback")
    v_u_6 = p10
end
function v_u_5._logEvent(p12, p13)
    local v14 = v_u_9[p12]
    local v15 = "Performance logger for " .. p12.Name .. " has not been created"
    assert(v14, v15).events:addEvent(p13, os.clock())
end
function v_u_5._logPlayerState(p16, p17, p18)
    local v19 = v_u_9[p16]
    local v20 = "Performance logger for " .. p16.Name .. " has not been created"
    assert(v19, v20).playerState:set(p17, p18)
end
function v_u_5._logStaticTiming(p21, p22, p23)
    local v24 = v_u_9[p21]
    local v25 = "Performance logger for " .. p21.Name .. " has not been created"
    assert(v24, v25).staticTimings:setTiming(p22, p23)
end
function v_u_5._markAsKicked(p26)
    local v27 = v_u_9[p26]
    local v28 = "Performance logger for " .. p26.Name .. " has not been created"
    assert(v27, v28).exitStates.setState("Kicked", true)
end
v_u_5.logEvent = v_u_2.wrapInTry("logEvent", v_u_5._logEvent)
v_u_5.logPlayerState = v_u_2.wrapInTry("logPlayerState", v_u_5._logPlayerState)
v_u_5.logStaticTiming = v_u_2.wrapInTry("logStaticTiming", v_u_5._logStaticTiming)
v_u_5.markAsKicked = v_u_2.wrapInTry("markAsKicked", v_u_5._markAsKicked)
function v_u_5._connectRemotes()
    local function v_u_31(p29, p30)
        p29.deviceInfo:deserializeReplace(p30)
    end
    local v_u_32 = "setDeviceInfo"
    v_u_1.setDeviceInfo.OnServerEvent:Connect(function(p33, ...)
        if v_u_9[p33] then
            v_u_31(v_u_9[p33], ...)
        else
            warn("[PerformanceLogger] " .. v_u_32 .. " fired before " .. p33.Name .. "\'s log was ready; discarding.")
        end
    end)
    local function v_u_36(p34, p35)
        p34.memory:deserializeReplace(p35)
    end
    local v_u_37 = "setMemory"
    v_u_1.setMemory.OnServerEvent:Connect(function(p38, ...)
        if v_u_9[p38] then
            v_u_36(v_u_9[p38], ...)
        else
            warn("[PerformanceLogger] " .. v_u_37 .. " fired before " .. p38.Name .. "\'s log was ready; discarding.")
        end
    end)
    local function v_u_41(p39, p40)
        p39.miscStats:deserializeReplace(p40)
    end
    local v_u_42 = "setMisc"
    v_u_1.setMisc.OnServerEvent:Connect(function(p43, ...)
        if v_u_9[p43] then
            v_u_41(v_u_9[p43], ...)
        else
            warn("[PerformanceLogger] " .. v_u_42 .. " fired before " .. p43.Name .. "\'s log was ready; discarding.")
        end
    end)
    local function v_u_47(p44, p45, p46)
        p44.exitStates:setState(p45, p46)
    end
    local v_u_48 = "logUserExitState"
    v_u_1.logUserExitState.OnServerEvent:Connect(function(p49, ...)
        if v_u_9[p49] then
            v_u_47(v_u_9[p49], ...)
        else
            warn("[PerformanceLogger] " .. v_u_48 .. " fired before " .. p49.Name .. "\'s log was ready; discarding.")
        end
    end)
    local function v_u_52(p50, p51)
        p50.events:addEvent(p51)
    end
    local v_u_53 = "logEvent"
    v_u_1.logEvent.OnServerEvent:Connect(function(p54, ...)
        if v_u_9[p54] then
            v_u_52(v_u_9[p54], ...)
        else
            warn("[PerformanceLogger] " .. v_u_53 .. " fired before " .. p54.Name .. "\'s log was ready; discarding.")
        end
    end)
    local function v_u_58(p55, p56, p57)
        p55.playerState:set(p56, p57)
    end
    local v_u_59 = "logPlayerState"
    v_u_1.logPlayerState.OnServerEvent:Connect(function(p60, ...)
        if v_u_9[p60] then
            v_u_58(v_u_9[p60], ...)
        else
            warn("[PerformanceLogger] " .. v_u_59 .. " fired before " .. p60.Name .. "\'s log was ready; discarding.")
        end
    end)
    local function v_u_64(p61, p62, p63)
        p61.staticTimings:setTiming(p62, p63)
    end
    local v_u_65 = "logStaticTiming"
    v_u_1.logStaticTiming.OnServerEvent:Connect(function(p66, ...)
        if v_u_9[p66] then
            v_u_64(v_u_9[p66], ...)
        else
            warn("[PerformanceLogger] " .. v_u_65 .. " fired before " .. p66.Name .. "\'s log was ready; discarding.")
        end
    end)
end
function v_u_5.startPlayerSession(p67)
    local v68 = v_u_7
    assert(v68, "ServerPlayerPerformanceSingleton.start needs to be called before ServerPlayerPerformanceSingleton.startPlayerSession")
    if v_u_9[p67] then
        warn("[PerformanceLogger] Session for " .. p67.Name .. " already started.\n" .. debug.traceback())
    else
        local v69 = v_u_4.new(p67, {
            ["playerStateDefaults"] = v_u_7.playerStateDefaults,
            ["staticTimingNames"] = v_u_7.staticTimingNames,
            ["getTimeNow"] = v_u_7.getTimeNow
        })
        v_u_9[p67] = v69
        v69:startSession()
    end
end
function v_u_5.endPlayerSession(p70)
    if v_u_9[p70] then
        local v71 = v_u_9[p70]
        v71:endSession()
        local v72 = v71:toLoggable()
        if v_u_9[p70] then
            v_u_9[p70] = nil
        end
        return v72
    end
    warn("[PerformanceLogger] Session for " .. p70.Name .. " does not exist. Did you end it already?\n" .. debug.traceback())
end
function v_u_5.connectPlayerEvents()
    v_u_8 = true
    local v_u_73 = Instance.new("BindableEvent")
    v_u_73.Event:Connect(function(p74)
        v_u_5.startPlayerSession(p74, v_u_7)
    end)
    game.Players.PlayerAdded:Connect(function(p75)
        v_u_73:Fire(p75)
    end)
    for _, v76 in ipairs(game.Players:GetPlayers()) do
        v_u_73:Fire(v76)
    end
    game.Players.PlayerRemoving:Connect(function(p_u_77)
        v_u_3.delay(5):andThen(function()
            if v_u_9[p_u_77] then
                local v78 = v_u_5.endPlayerSession(p_u_77)
                v_u_2.try("sessionEndedCallback", v_u_6, p_u_77, v78, false):await()
            end
        end):catch(warn)
    end)
end
function v_u_5._connectBindToClose()
    game:BindToClose(function()
        for v79, v80 in pairs(v_u_9) do
            if v79.Parent then
                v80.exitStates:setState("ServerShutdown", true)
            end
        end
        if v_u_8 then
            local v81 = {}
            for v_u_82, _ in pairs(v_u_9) do
                local v84 = v_u_3.try(function()
                    local v83 = v_u_5.endPlayerSession(v_u_82)
                    v_u_2.try("sessionEndedCallback", v_u_6, v_u_82, v83, true):await()
                end)
                local v85 = warn
                table.insert(v81, v84:catch(v85))
            end
            v_u_3.allSettled(v81):await()
        end
    end)
end
function v_u_5.start(p86)
    assert(p86)
    local v87 = p86.playerStateDefaults
    assert(v87)
    local v88 = p86.staticTimingNames
    assert(v88)
    v_u_7 = p86
    v_u_5._connectRemotes()
    v_u_2.try("_connectBindToClose", v_u_5._connectBindToClose):await()
    v_u_3.try(function()
        while true do
            v_u_3.delay(10):andThen(function()
                for v89, v90 in pairs(v_u_9) do
                    if v89:IsDescendantOf(game) and v90.deviceInfo.stats.initialized then
                        v90:spawnPingTest()
                    end
                end
            end):catch(warn):await()
        end
    end):catch(warn)
end
return v_u_5