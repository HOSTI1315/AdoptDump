--// ReplicatedStorage.SharedPackages._Index.upliftgames_performance-logger@0.2.2.performance-logger.Player.ClientPlayerPerformanceLog (ModuleScript)

local v1 = require(script.Parent.Parent.Class)
local v_u_2 = require(script.Parent.Parent.Stats)
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("RunService")
local v_u_6 = {
    ["Keyboard"] = true,
    ["MouseButton1"] = true,
    ["Touch"] = true,
    ["Gamepad1"] = true,
    ["TextInput"] = true
}
local v7 = v1("ClientPlayerPerformanceLog")
function v7.__init(p8, p9)
    assert(p9)
    local v10 = p9.remotes
    assert(v10)
    p8._remotes = p9.remotes
    p8.deviceInfo = v_u_2.DeviceInfo.new()
    p8.memory = v_u_2.MemoryStats.new()
    p8.miscStats = v_u_2.MiscSharedStats.new()
    p8._lastMemoryAndMiscUploadAt = 0
end
function v7.logDeviceInfo(p11)
    p11.deviceInfo:updateStats()
    p11._remotes.setDeviceInfo:FireServer(p11.deviceInfo:serialize())
end
function v7.collectMemoryAndMisc(p12)
    p12.memory:addLocalMemory()
    p12.miscStats:addLocalStatsFromStatsService()
end
function v7.uploadMemoryAndMisc(p13)
    if os.clock() - p13._lastMemoryAndMiscUploadAt >= 30 then
        p13._lastMemoryAndMiscUploadAt = os.clock()
        p13._remotes.setMemory:FireServer(p13.memory:serialize())
        p13._remotes.setMisc:FireServer(p13.miscStats:serialize())
    end
end
function v7.logStaticTiming(p14, p15, p16)
    p14._remotes.logStaticTiming:FireServer(p15, p16)
end
function v7.logEvent(p17, p18)
    p17._remotes.logEvent:FireServer(p18)
    p17:uploadMemoryAndMisc()
end
function v7.logPlayerState(p19, p20, p21)
    p19._remotes.logPlayerState:FireServer(p20, p21)
    p19:uploadMemoryAndMisc()
end
function v7.logExitState(p22, p23, p24)
    p22._remotes.logUserExitState:FireServer(p23, p24)
    p22:uploadMemoryAndMisc()
end
function v7.startLoggingDeviceInfo(p_u_25)
    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        if workspace.CurrentCamera.ViewportSize.x > 1 and workspace.CurrentCamera.ViewportSize.y > 1 then
            p_u_25:logDeviceInfo()
        end
    end)
    p_u_25:logDeviceInfo()
end
function v7.startLoggingMemoryAndMisc(p_u_26)
    p_u_26:collectMemoryAndMisc()
    p_u_26:uploadMemoryAndMisc()
    v_u_5.RenderStepped:Connect(function(p27)
        p_u_26.miscStats:addFrameTime(p27 * 1000)
    end)
    local v_u_28 = os.clock() + 5
    local v_u_29 = os.clock() + 120
    v_u_5.Heartbeat:Connect(function()
        local v30 = os.clock()
        if v_u_28 <= v30 then
            v_u_28 = v30 + 5
            p_u_26:collectMemoryAndMisc()
        end
        if v_u_29 <= v30 then
            v_u_29 = v30 + 120
            p_u_26:uploadMemoryAndMisc()
        end
    end)
end
function v7.startLoggingPing(p31)
    function p31._remotes.ping.OnClientInvoke() end
end
function v7.startLoggingExitStates(p_u_32)
    v_u_4.MenuOpened:Connect(function()
        p_u_32:logExitState("RobloxMenu", true)
    end)
    v_u_4.MenuClosed:Connect(function()
        p_u_32:logExitState("RobloxMenu", false)
    end)
    v_u_3.WindowFocusReleased:Connect(function()
        p_u_32:logExitState("Unfocused", true)
        p_u_32.miscStats:setFocused(false)
    end)
    v_u_3.WindowFocused:Connect(function()
        p_u_32:logExitState("Unfocused", false)
        p_u_32.miscStats:setFocused(true)
    end)
    local v_u_33 = false
    v_u_3.InputEnded:Connect(function(p34, _)
        if p34.UserInputType == Enum.UserInputType.MouseMovement then
            v_u_33 = true
            p_u_32:logExitState("MouseLeftViewport", true)
        end
    end)
    v_u_3.InputBegan:Connect(function(p35, _)
        if v_u_33 and p35.UserInputType == Enum.UserInputType.MouseMovement then
            v_u_33 = false
            p_u_32:logExitState("MouseLeftViewport", false)
        end
    end)
    local v_u_36 = 0
    local v_u_37 = false
    local v_u_38 = false
    v_u_5.Heartbeat:Connect(function(_)
        if v_u_38 and not v_u_37 then
            if v_u_36 > os.clock() then
                return
            end
            v_u_36 = os.clock() + 1
            v_u_37 = true
            p_u_32:logExitState("MissingRenderstep", true)
            p_u_32.miscStats:setFocused(false)
        elseif not v_u_38 then
            p_u_32.miscStats:setFocused(true)
        end
        v_u_38 = true
    end)
    v_u_5.RenderStepped:Connect(function(_)
        v_u_38 = false
        if v_u_37 then
            v_u_37 = false
            p_u_32:logExitState("MissingRenderstep", false)
        end
    end)
    local v_u_39 = false
    local v_u_40 = os.clock()
    local function v42(p41)
        if v_u_6[p41.UserInputType.Name] then
            v_u_40 = os.clock()
            if v_u_39 then
                v_u_39 = false
                p_u_32:logExitState("Idle", false)
            end
        end
    end
    v_u_3.InputBegan:Connect(v42)
    v_u_3.InputChanged:Connect(v42)
    v_u_3.InputEnded:Connect(v42)
    v_u_5.Heartbeat:Connect(function()
        if os.clock() - v_u_40 > 200 and not v_u_39 then
            v_u_39 = true
            p_u_32:logExitState("Idle", true)
        end
    end)
end
function v7.start(p43)
    p43:startLoggingPing()
    p43:startLoggingDeviceInfo()
    p43:startLoggingMemoryAndMisc()
    p43:startLoggingExitStates()
end
return v7