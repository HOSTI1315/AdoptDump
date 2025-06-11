--// ReplicatedStorage.SharedModules.Game.FurnitureSelectorHelpers.FurnitureMultiSelect (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("CameraInputDisabler")
local v_u_3 = v_u_1("ControlsDisabler")
local v_u_4 = v_u_1("FurnitureBounds")
local v_u_5 = v_u_1("FurnitureXRay")
local v_u_6 = v_u_1("PlatformM")
local v_u_7 = v_u_1("Maid")
local v_u_8 = v_u_1("package:Promise")
local v_u_9 = game:GetService("Players")
local v_u_10 = game:GetService("RunService")
local v_u_11 = game:GetService("UserInputService")
local v_u_12 = {
    [Enum.UserInputType.MouseButton1] = true,
    [Enum.UserInputType.Touch] = true
}
local v_u_13 = {}
local v_u_14 = v_u_8.resolve()
local function v_u_28(p15, p16, p17, p18, p19, p20)
    local v21 = Instance.new("Frame")
    v21.Position = UDim2.fromOffset(p15, p16)
    v21.Size = UDim2.fromOffset(p17.X * p19, p17.Y * p19)
    v21.BackgroundTransparency = 1
    v21.BorderSizePixel = 0
    local v22 = Instance.new("Frame")
    v22.BorderSizePixel = 0
    v22.BackgroundColor3 = p20
    v22.Size = UDim2.fromOffset(p18, p18)
    v22.Parent = v21
    local v23 = v22:Clone()
    v23.AnchorPoint = p17
    v23.Position = UDim2.fromScale(p17.X, p17.Y)
    v23.Parent = v21
    local v24 = (p19 - p18) / (p18 * 2)
    for v25 = 2, math.ceil(v24) do
        local v26 = (v25 - 1) * (p18 * 2)
        local v27 = v22:Clone()
        v27.Position = UDim2.fromOffset(p17.X * v26, p17.Y * v26)
        v27.Parent = v21
    end
    return v21
end
local function v_u_39(p29, p30, p31, p32)
    local v33 = Instance.new("Frame")
    v33.Size = UDim2.new(1, 0, 1, 0)
    v33.BackgroundTransparency = 1
    v33.Parent = p29
    local v34 = Instance.new("Frame")
    v34.Size = UDim2.fromOffset(p32.Width, p32.Height)
    v34.Position = UDim2.fromOffset(p32.Min.X, p32.Min.Y)
    v34.BackgroundTransparency = 0.7
    v34.BorderSizePixel = 0
    v34.BackgroundColor3 = p31
    v34.Parent = v33
    local v35 = v_u_28(p32.Min.X - p30, p32.Min.Y - p30, Vector2.new(1, 0), p30, p32.Width + p30 * 2, p31)
    local v36 = v_u_28(p32.Min.X - p30, p32.Max.Y, Vector2.new(1, 0), p30, p32.Width + p30 * 2, p31)
    local v37 = v_u_28(p32.Max.X, p32.Min.Y - p30, Vector2.new(0, 1), p30, p32.Height + p30 * 2, p31)
    local v38 = v_u_28(p32.Min.X - p30, p32.Min.Y - p30, Vector2.new(0, 1), p30, p32.Height + p30 * 2, p31)
    v35.Parent = v33
    v36.Parent = v33
    v37.Parent = v33
    v38.Parent = v33
    return v33
end
local function v_u_40()
    return v_u_6.run({
        ["tablet"] = "phone",
        ["phone"] = function()
            return true
        end,
        ["default"] = function()
            return false
        end
    })
end
local function v_u_54(p_u_41)
    local v_u_42 = Instance.new("ScreenGui")
    v_u_42.IgnoreGuiInset = true
    v_u_42.Name = "FurnitureMultiSelector"
    v_u_42.DisplayOrder = -1
    v_u_42.Parent = v_u_9.LocalPlayer.PlayerGui
    local v_u_43 = Instance.new("ImageButton")
    v_u_43.Name = "CameraInputSinker"
    v_u_43.Visible = false
    v_u_43.Size = UDim2.new(1, 0, 1, 0)
    v_u_43.Image = ""
    v_u_43.BackgroundTransparency = 1
    v_u_43.Parent = v_u_42
    local v_u_44 = v_u_7.new()
    local v_u_53 = v_u_8.fromEvent(v_u_11.InputBegan, function(p45)
        return v_u_12[p45.UserInputType] and true or false
    end):andThen(function(_, p46)
        if p46 then
            return v_u_8.reject("First input was sunk!")
        else
            return v_u_11:GetMouseLocation()
        end
    end):andThen(function(p_u_47)
        v_u_2.set_camera_input_enabled_mobile("multi_select", false)
        v_u_43.Visible = true
        local v_u_48 = v_u_7.new()
        v_u_44:GiveTask(v_u_48)
        v_u_44:GiveTask(v_u_10.RenderStepped:Connect(function()
            v_u_48:DoCleaning()
            v_u_48:GiveTask((v_u_39(v_u_42, 4, p_u_41, Rect.new(p_u_47, v_u_11:GetMouseLocation()))))
        end))
        return v_u_8.fromEvent(v_u_11.InputEnded, function(p49, _)
            return v_u_12[p49.UserInputType] and true or false
        end):andThen(function()
            return v_u_11:GetMouseLocation()
        end):andThen(function(p50)
            return p_u_47, p50
        end)
    end):andThen(function(p51, p52)
        return Rect.new(p51, p52)
    end)
    if v_u_40() then
        v_u_3.disable_controls("FurnitureMultiSelect")
    end
    v_u_8.try(function()
        v_u_53:await()
        v_u_43.Visible = false
        v_u_3.enable_controls("FurnitureMultiSelect")
        v_u_2.set_camera_input_enabled_mobile("multi_select", true)
        v_u_44:DoCleaning()
        v_u_42:Destroy()
    end)
    return v_u_53
end
local function v_u_67(p55)
    local v56 = workspace.CurrentCamera.CFrame.Position
    local v57 = RaycastParams.new()
    v57.FilterType = Enum.RaycastFilterType.Include
    v57.FilterDescendantsInstances = { workspace.HouseInteriors.blueprint }
    local v58 = {}
    for _, v59 in workspace.HouseInteriors.furniture:GetChildren() do
        local v60 = v59:GetChildren()[1]
        if v60 then
            local v61, _ = v_u_4.get_furniture_multi_select_cframe_size(v60.PlacementBlock.CFrame, false, { v60 })
            if v_u_5.is_enabled() then
                ::l5::
                local v62, v63 = workspace.CurrentCamera:WorldToViewportPoint(v61.Position)
                if v63 and v62.Z >= 0 then
                    local v64 = Vector2.new(v62.X, v62.Y)
                    local v65
                    if v64.X >= p55.Min.X and (v64.Y >= p55.Min.Y and v64.X <= p55.Max.X) then
                        v65 = v64.Y <= p55.Max.Y
                    else
                        v65 = false
                    end
                    if v65 then
                        table.insert(v58, v60)
                    end
                end
            else
                local v66 = workspace:Raycast(v56, v61.Position - v56, v57)
                if not (v66 and v66.Instance) then
                    goto l5
                end
            end
        end
    end
    return v58
end
function v_u_13.is_enabled()
    return v_u_14:getStatus() == v_u_8.Status.Started
end
function v_u_13.cancel()
    v_u_14:cancel()
end
function v_u_13.begin(p68)
    local v69 = v_u_6.run({
        ["tablet"] = "phone",
        ["phone"] = function()
            return "Touch"
        end,
        ["default"] = function()
            return "Click"
        end
    })
    v_u_1("UIManager").apps.HintApp:hint({
        ["text"] = ("%s and drag to create a selection box."):format(v69),
        ["overridable"] = true,
        ["yields"] = false,
        ["length"] = 5
    })
    v_u_13.cancel()
    v_u_14 = v_u_54(p68):andThen(function(p70)
        if p70.Width * p70.Height > 10 then
            return v_u_67(p70)
        end
        v_u_1("UIManager").apps.HintApp:hint({
            ["text"] = "The selection was too small.",
            ["overridable"] = true,
            ["yields"] = false,
            ["length"] = 5
        })
        return v_u_8.reject("Rect was too small")
    end):catch(warn)
    return v_u_14
end
return v_u_13