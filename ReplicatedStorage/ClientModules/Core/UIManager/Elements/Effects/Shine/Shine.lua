--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Effects.Shine (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
v1("UIDB")
v1("PlatformM")
v1("UIHelpers")
local v3 = v2("DepthButton", v1("UIBaseElement"))
local v_u_4 = game:GetService("TweenService")
function v3.start(p5, p6)
    local v7 = p6 or {}
    local v8 = v7.shine_speed or 0.5
    local v_u_9 = v7.shine_cooldown or 3
    local v10 = UDim2.new(0.5, 0, 1, 0)
    local v_u_11 = UDim2.new(-0.5, 0, 0, 0)
    local v_u_12 = p5.instance
    local _ = v7.options
    local v13 = Instance.new("Frame")
    v13.BackgroundTransparency = 1
    v13.Size = UDim2.new(1, 0, 1, 0)
    v13.ZIndex = 99999
    v13.ClipsDescendants = true
    v13.Parent = v_u_12
    local v_u_14 = Instance.new("ImageLabel")
    v_u_14.Image = "rbxassetid://2733347417"
    v_u_14.BackgroundTransparency = 1
    v_u_14.ImageTransparency = 0.5
    v_u_14.Size = v10
    v_u_14.Position = v_u_11
    v_u_14.Parent = v13
    local v15 = v_u_14:Clone()
    v15.Size = UDim2.new(1, 0, 1, 0)
    v15.Parent = v_u_14
    local v_u_16 = v_u_4:Create(v_u_14, TweenInfo.new(v8, Enum.EasingStyle.Linear), {
        ["Position"] = UDim2.new(1.5, 0, 0, 0)
    })
    delay(v7.start_delay or v_u_9, function()
        while v_u_12.Parent do
            v_u_14.Position = v_u_11
            v_u_16:Play()
            v_u_16.Completed:wait()
            wait(v_u_9)
        end
    end)
    return p5
end
return v3