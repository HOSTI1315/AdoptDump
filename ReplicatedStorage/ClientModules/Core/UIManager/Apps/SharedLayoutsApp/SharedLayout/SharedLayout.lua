--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.SharedLayoutsApp.SharedLayout (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("package:UIAbsoluteVisibility")
local v_u_3 = v1("Maid")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = {}
v_u_5.__index = v_u_5
v_u_5.ClassName = "SharedLayout"
function v_u_5.new(p6, p7, p8)
    local v9 = v_u_5
    local v10 = setmetatable({}, v9)
    v10.maid = v_u_3.new()
    v10.container = p6
    v10.list_layout = p7
    v10.sort_multiplier = 1
    v10.padding = p8
    v10.registered = {}
    return v10
end
function v_u_5.quick(p11)
    local v12 = Instance.new("Frame")
    v12.BackgroundTransparency = 1
    v12.Selectable = false
    v12.Active = false
    local v13 = Instance.new("UIListLayout")
    v13.FillDirection = p11.fill_direction
    v13.HorizontalAlignment = p11.horizontal_alignment
    v13.VerticalAlignment = p11.vertical_alignment
    v13.SortOrder = Enum.SortOrder.LayoutOrder
    v13.Padding = p11.list_padding or UDim.new(0, 0)
    v13.Parent = v12
    local v14 = Instance.new("UIPadding")
    v14.PaddingTop = p11.padding_top or UDim.new(0, 0)
    v14.PaddingLeft = p11.padding_left or UDim.new(0, 0)
    v14.PaddingRight = p11.padding_right or UDim.new(0, 0)
    v14.PaddingBottom = p11.padding_bottom or UDim.new(0, 0)
    v14.Parent = v12
    local v15 = v_u_5.new(v12, v13, v14)
    if p11.reverse_sort then
        v15.sort_multiplier = -1
    end
    v15.maid:GiveTask(v13)
    v15.maid:GiveTask(v14)
    return v15
end
function v_u_5._refresh_frame_size(_, p16)
    local v17 = p16.instance.AbsoluteSize
    p16.frame.Size = UDim2.new(p16.padding_left.Scale + p16.padding_right.Scale, p16.padding_left.Offset + p16.padding_right.Offset + v17.X, p16.padding_top.Scale + p16.padding_bottom.Scale, p16.padding_top.Offset + p16.padding_bottom.Offset + v17.Y)
end
function v_u_5._refresh_instance_position(p18, p19)
    local v20 = p18.container.AbsoluteSize
    local v21 = p19.instance.AbsoluteSize
    local v22 = Vector2.new(0, -v_u_4.TopbarInset.Height)
    local v23 = p19.frame.AbsolutePosition - v22
    local v24 = v21 * p19.instance.AnchorPoint
    local v25 = Vector2.new(p19.padding_left.Offset + v20.X * p19.padding_left.Scale, p19.padding_top.Offset + v20.Y * p19.padding_top.Scale)
    p19.instance.Position = UDim2.fromOffset(v23.X + v25.X + v24.X, v23.Y + v25.Y + v24.Y)
end
function v_u_5._refresh_is_clipping(p26, p27)
    local v28 = p26.container.AbsolutePosition
    local v29 = Rect.new(v28, v28 + p26.container.AbsoluteSize)
    local v30 = p27.instance.AbsolutePosition
    local v31 = Rect.new(v30, v30 + p27.instance.AbsoluteSize)
    p27.is_clipping = (v29.Min.X > v31.Min.X or (v29.Min.Y > v31.Min.Y or v29.Max.X < v31.Max.X)) and true or v29.Max.Y < v31.Max.Y
end
function v_u_5.register(p_u_32, p_u_33, p_u_34)
    local v_u_35
    if p_u_34.on_press then
        v_u_35 = Instance.new("ImageButton")
        v_u_35.Image = ""
        v_u_35.Selectable = true
    else
        v_u_35 = Instance.new("Frame")
        v_u_35.Selectable = false
    end
    v_u_35.Name = p_u_33.Name
    v_u_35.LayoutOrder = p_u_32.sort_multiplier * p_u_33.LayoutOrder
    v_u_35.BackgroundTransparency = 1
    v_u_35.Active = false
    v_u_35.Parent = p_u_32.container
    local v_u_36 = {
        ["instance"] = p_u_33,
        ["frame"] = v_u_35,
        ["is_clipping"] = false,
        ["padding_bottom"] = p_u_34.padding_bottom or UDim.new(0, 0),
        ["padding_left"] = p_u_34.padding_left or UDim.new(0, 0),
        ["padding_right"] = p_u_34.padding_right or UDim.new(0, 0),
        ["padding_top"] = p_u_34.padding_top or UDim.new(0, 0),
        ["maid"] = v_u_3.new()
    }
    v_u_2.track(p_u_33)
    v_u_36.frame.Visible = v_u_2.getAbsoluteVisibility(p_u_33)
    p_u_32:_refresh_instance_position(v_u_36)
    p_u_32:_refresh_is_clipping(v_u_36)
    if p_u_34.on_refresh then
        p_u_34.on_refresh()
    end
    v_u_36.maid:GiveTask(v_u_2.getAbsoluteVisibilityChangedSignal(p_u_33):Connect(function()
        v_u_36.frame.Visible = v_u_2.getAbsoluteVisibility(p_u_33)
        p_u_32:_refresh_instance_position(v_u_36)
        p_u_32:_refresh_is_clipping(v_u_36)
        if p_u_34.on_refresh then
            p_u_34.on_refresh()
        end
    end))
    if p_u_34.on_press then
        v_u_36.maid:GiveTask(v_u_35.MouseButton1Click:Connect(function()
            p_u_34.on_press()
        end))
        if p_u_34.selection_instance then
            v_u_2.track(p_u_34.selection_instance)
            v_u_36.maid:GiveTask(v_u_2.getAbsoluteVisibilityChangedSignal(p_u_34.selection_instance):Connect(function()
                v_u_36.frame.Selectable = v_u_2.getAbsoluteVisibility(p_u_34.selection_instance)
            end))
        end
    end
    v_u_36.maid:GiveTask(p_u_33:GetPropertyChangedSignal("Name"):Connect(function()
        v_u_35.Name = p_u_33.Name
    end))
    v_u_36.maid:GiveTask(p_u_33:GetPropertyChangedSignal("LayoutOrder"):Connect(function()
        v_u_35.LayoutOrder = p_u_32.sort_multiplier * p_u_33.LayoutOrder
    end))
    v_u_36.maid:GiveTask(p_u_33:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        p_u_32:_refresh_frame_size(v_u_36)
        p_u_32:_refresh_instance_position(v_u_36)
        p_u_32:_refresh_is_clipping(v_u_36)
        if p_u_34.on_refresh then
            p_u_34.on_refresh()
        end
    end))
    v_u_36.maid:GiveTask(v_u_35:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
        p_u_32:_refresh_instance_position(v_u_36)
        p_u_32:_refresh_is_clipping(v_u_36)
        if p_u_34.on_refresh then
            p_u_34.on_refresh()
        end
    end))
    v_u_36.maid:GiveTask(p_u_32.container:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        p_u_32:_refresh_is_clipping(v_u_36)
        if p_u_34.on_refresh then
            p_u_34.on_refresh()
        end
    end))
    v_u_36.maid:GiveTask(p_u_32.container:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
        p_u_32:_refresh_is_clipping(v_u_36)
        if p_u_34.on_refresh then
            p_u_34.on_refresh()
        end
    end))
    v_u_36.maid:GiveTask(function()
        v_u_2.untrack(p_u_33)
        v_u_36.frame:Destroy()
        p_u_32.registered[p_u_33] = nil
    end)
    v_u_36.maid:GiveTask(p_u_33.Destroying:Connect(function()
        p_u_32:deregister(p_u_33)
    end))
    p_u_32:_refresh_frame_size(v_u_36)
    p_u_32:_refresh_instance_position(v_u_36)
    p_u_32:_refresh_is_clipping(v_u_36)
    if p_u_34.on_refresh then
        p_u_34.on_refresh()
    end
    p_u_32.registered[p_u_33] = v_u_36
    return v_u_36
end
function v_u_5.deregister(p37, p38)
    local v39 = p37.registered[p38]
    if v39 then
        v39.maid:DoCleaning()
    end
end
function v_u_5.is_registered(p40, p41)
    return p40.registered[p41] ~= nil
end
function v_u_5.get_content_size(p42)
    return p42.list_layout.AbsoluteContentSize
end
function v_u_5.get_container(p43)
    return p43.container
end
function v_u_5.is_clipping(p44, p45)
    local v46 = p44.registered[p45]
    if v46 then
        return v46.is_clipping
    else
        return false
    end
end
function v_u_5.force_refresh(p47, p48)
    local v49 = p47.registered[p48]
    if v49 then
        p47:_refresh_instance_position(v49)
        p47:_refresh_is_clipping(v49)
    end
end
return v_u_5