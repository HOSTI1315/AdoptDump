--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.DevWatchModeApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("ClientData")
local v_u_4 = game:GetService("Players")
local v5, v_u_6 = v2("DevWatchModeApp", v1("UIBaseApp"))
function v5.__init(p7, ...)
    v_u_6.__init(p7, ...)
    local v8 = Instance.new("ScreenGui")
    v8.Name = "DevWatchModeApp"
    v8.Enabled = true
    v8.DisplayOrder = 100
    v8.Parent = v_u_4.LocalPlayer.PlayerGui
    local v9 = Instance.new("Frame")
    v9.Size = UDim2.fromScale(1, 1)
    v9.BackgroundTransparency = 1
    v9.Visible = true
    v9.Parent = v8
    local v10 = Instance.new("TextLabel")
    v10.BackgroundTransparency = 0.6
    v10.TextTransparency = 0.1
    v10.BackgroundColor3 = Color3.fromRGB(0, 151, 255)
    v10.TextColor3 = Color3.fromRGB(255, 255, 255)
    v10.Text = "Watch Mode"
    v10.Font = "SourceSansBold"
    v10.TextSize = 24
    v10.Size = UDim2.fromOffset(124, 32)
    v10.AnchorPoint = Vector2.new(0, 1)
    v10.Position = UDim2.new(0, 120, 0, 0)
    v10.Visible = false
    v10.Parent = v9
    local v11 = Instance.new("UICorner")
    v11.CornerRadius = UDim.new(0, 4)
    v11.Parent = v10
    p7.instance = v8
    p7.frame = v9
    p7.watch_mode_label = v10
end
function v5.show(p12)
    p12.frame.Visible = true
end
function v5.hide(p13)
    p13.frame.Visible = false
end
function v5.update(p14)
    p14.watch_mode_label.Visible = v_u_3.get("dev_watchmode") and true or false
end
function v5.start(p_u_15)
    v_u_3.register_callback("dev_watchmode", function()
        p_u_15:update()
    end)
end
return v5