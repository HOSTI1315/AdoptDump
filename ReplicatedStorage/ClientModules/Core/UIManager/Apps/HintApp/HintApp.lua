--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HintApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PlatformM")
local v_u_3 = v1("RouterClient")
local v4 = v1("Class")
local v5 = v1("CriticalSection")
local v6 = v4("HintApp", v1("UIBaseApp"))
local v_u_7 = v5.new()
local v_u_8 = nil
function v6.hint_helper(p9, p10)
    local v11 = p10.overridable
    if not v11 or v_u_8 == p10 then
        local v12 = p10.color or Color3.new(1, 1, 1)
        local v13 = p10.length or 3
        local v14
        if p10.large_hint then
            v14 = p9.instance.LargeTextLabel
        else
            v14 = p9.instance.TextLabel
        end
        local v15 = p9.tween_positions[v14]
        v14.Text = p10.text
        v14.TextColor3 = v12
        p9.instance.Enabled = true
        v14.Visible = true
        v14.RichText = p10.is_richtext or false
        v14.TextTransparency = 1
        v14.TextStrokeTransparency = 1
        v14.TextStrokeColor3 = v14.TextStrokeColor3
        v14.Position = v15.tween_start_position
        local v16 = game:GetService("TweenService"):Create(v14, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Position"] = v15.tween_end_position
        })
        local v17 = game:GetService("TweenService"):Create(v14, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
            ["TextTransparency"] = 0,
            ["TextStrokeTransparency"] = 0.5,
            ["TextStrokeColor3"] = Color3.new()
        })
        v17:Play()
        v16:Play()
        v17.Completed:wait()
        local v18 = tick()
        repeat
            wait(0.1)
        until v13 <= tick() - v18 or v11 and v_u_8 ~= p10
        local v19 = game:GetService("TweenService"):Create(v14, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            ["Position"] = v15.tween_start_position
        })
        local v20 = game:GetService("TweenService"):Create(v14, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
            ["TextTransparency"] = 1,
            ["TextStrokeTransparency"] = 1,
            ["TextStrokeColor3"] = Color3.new(1, 1, 1)
        })
        v20:Play()
        v19:Play()
        v20.Completed:wait()
        p9.instance.Enabled = false
        v14.Visible = false
        wait(0.1)
    end
end
function v6.hint(p_u_21, p22)
    local v_u_23 = p22 or {}
    v_u_8 = v_u_23
    local v24 = v_u_23.yields
    local function v25()
        v_u_7:wait()
        p_u_21:hint_helper(v_u_23)
        v_u_7:signal()
    end
    if v24 == nil and true or v24 then
        v_u_7:wait()
        p_u_21:hint_helper(v_u_23)
        v_u_7:signal()
    else
        coroutine.wrap(v25)()
    end
end
function v6.is_displaying_hint(_)
    return v_u_7.running
end
function v6.connect_to_msg_bridge(p_u_26)
    if not p_u_26.msg_bridge_connected then
        p_u_26.msg_bridge_connected = true
        coroutine.wrap(function()
            local v27 = v_u_3.get("MsgAPI/DownloadInitialQueue"):InvokeServer("hint")
            for _, v28 in pairs(v27) do
                v28.yields = false
                p_u_26:hint(v28)
            end
        end)()
        v_u_3.get_event("MsgAPI/HintSent").OnClientEvent:connect(function(p29)
            p_u_26:hint(p29)
        end)
    end
end
function v6.show(p30)
    p30.instance.Enabled = true
end
function v6.hide(p31)
    p31.instance.Enabled = false
end
function v6.start(p32)
    if v_u_2.get_platform() ~= v_u_2.platform.phone then
        p32.instance.TextLabel.TextSize = 35
        p32.instance.LargeTextLabel.TextSize = 58
    end
    local v33 = {
        [p32.instance.TextLabel] = {
            ["tween_end_position"] = p32.instance.TextLabel.Position,
            ["tween_start_position"] = p32.instance.TextLabel.Position + UDim2.new(0, 0, 0, p32.instance.TextLabel.TextSize)
        },
        [p32.instance.LargeTextLabel] = {
            ["tween_end_position"] = p32.instance.LargeTextLabel.Position,
            ["tween_start_position"] = p32.instance.LargeTextLabel.Position + UDim2.new(0, 0, 0, p32.instance.LargeTextLabel.TextSize)
        }
    }
    p32.tween_positions = v33
end
return v6