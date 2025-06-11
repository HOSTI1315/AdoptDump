--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.DevelopmentShortcutsApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("ServerType")
local v_u_4 = v1("package:Promise")
local v_u_5 = nil
local v_u_6 = game:GetService("Players")
local v_u_7 = game:GetService("ReplicatedStorage")
local function v_u_10(p8, p9, ...)
    p8:Connect(p9)
    v_u_4.try(p9, ...)
end
local v11, v_u_12 = v2("DevelopmentShortcutsApp", v1("UIBaseApp"))
function v11.__init(p13, ...)
    v_u_12.__init(p13, ...)
    local v14 = Instance.new("ScreenGui")
    v14.Name = "DevelopmentShortcutsApp"
    v14.Enabled = true
    v14.DisplayOrder = 100
    local v15 = Instance.new("Frame")
    v15.Size = UDim2.fromScale(1, 1)
    v15.BackgroundTransparency = 1
    v15.Visible = false
    v15.Parent = v14
    p13.instance = v14
    v14.Parent = v_u_6.LocalPlayer.PlayerGui
end
function v11.show(p16)
    p16.instance.Frame.Visible = true
end
function v11.hide(p17)
    p17.instance.Frame.Visible = false
end
function v11.create_category_grid(_, p18, p19)
    local v_u_20 = Instance.new("Frame")
    v_u_20.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v_u_20.BackgroundTransparency = 0.5
    v_u_20.Name = p18
    local v21 = Instance.new("TextLabel")
    v21.Size = UDim2.new(1, -20, 0, 20)
    v21.Position = UDim2.new(0.5, 0, 0, 10)
    v21.AnchorPoint = Vector2.new(0.5, 0)
    v21.BackgroundTransparency = 1
    v21.TextScaled = true
    v21.TextColor3 = Color3.fromRGB(255, 255, 255)
    v21.Text = p18
    v21.Name = "TitleLabel"
    v21.Parent = v_u_20
    local v22 = Instance.new("Frame")
    v22.Size = UDim2.new(1, -20, 1, -50)
    v22.Position = UDim2.new(0.5, 0, 0, 40)
    v22.AnchorPoint = Vector2.new(0.5, 0)
    v22.BackgroundTransparency = 1
    v22.Name = "Grid"
    v22.Parent = v_u_20
    local v_u_23 = Instance.new("UIGridLayout")
    v_u_23.CellPadding = UDim2.fromOffset(5, 5)
    v_u_23.CellSize = p19 or UDim2.fromOffset(100, 100)
    v_u_23.SortOrder = Enum.SortOrder.Name
    v_u_23.Parent = v22
    v_u_10(v_u_23:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        v_u_20.Size = UDim2.new(1, 0, 0, v_u_23.AbsoluteContentSize.y + 50)
    end)
    return v_u_20
end
function v11.generate_tools_list_scroller(p24)
    local v_u_25 = Instance.new("ScrollingFrame")
    v_u_25.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v_u_25.BackgroundTransparency = 0.5
    v_u_25.BorderColor3 = Color3.fromRGB(255, 255, 255)
    v_u_25.Size = UDim2.new(1, -40, 1, -40)
    v_u_25.Position = UDim2.fromScale(0.5, 0.5)
    v_u_25.AnchorPoint = Vector2.new(0.5, 0.5)
    v_u_25.Name = "ToolsListScroller"
    v_u_25.Parent = p24.instance.Frame
    p24.tools_list_scroller = v_u_25
    local v_u_26 = Instance.new("UIListLayout")
    v_u_26.Padding = UDim.new(0, 5)
    v_u_26.SortOrder = Enum.SortOrder.Name
    v_u_26.Parent = v_u_25
    v_u_10(v_u_26:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        v_u_25.CanvasSize = UDim2.new(0, 0, 0, v_u_26.AbsoluteContentSize.y)
    end)
end
function v11.generate_ailment_tools(p27)
    local v28 = v_u_5.Registry:GetType("ailment").Autocomplete("")
    local v29 = p27:create_category_grid("Ailments", UDim2.new(0, 100, 0, 80))
    for _, v_u_30 in ipairs(v28) do
        local v31 = Instance.new("Frame")
        v31.BackgroundTransparency = 1
        v31.Name = v_u_30
        local v32 = Instance.new("TextButton")
        v32.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v32.Size = UDim2.fromScale(1, 0.5)
        v32.Text = "Add " .. v_u_30
        v32.TextWrapped = true
        v32.Name = "Add"
        v32.MouseButton1Click:Connect(function()
            v_u_5.Dispatcher:Run("ailment", v_u_6.LocalPlayer.Name, "add", v_u_30)
        end)
        v32.Parent = v31
        local v33 = Instance.new("TextButton")
        v33.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v33.Size = UDim2.fromScale(1, 0.5)
        v33.Position = UDim2.fromScale(0, 0.5)
        v33.Text = "Clear " .. v_u_30
        v33.TextWrapped = true
        v33.Name = "Clear"
        v33.MouseButton1Click:Connect(function()
            v_u_5.Dispatcher:Run("ailment", v_u_6.LocalPlayer.Name, "clear", v_u_30)
        end)
        v33.Parent = v31
        v31.Parent = v29.Grid
    end
    v29.Parent = p27.tools_list_scroller
end
function v11.start(p_u_34)
    v_u_4.try(function()
        v_u_5 = require(v_u_7:WaitForChild("CmdrClient"))
        if not v_u_3.use_production_behavior() then
            v_u_5:Run("bind", Enum.KeyCode.F4.Name, "devshortcuts")
        end
        p_u_34:generate_tools_list_scroller()
        p_u_34:generate_ailment_tools()
    end)
end
return v11