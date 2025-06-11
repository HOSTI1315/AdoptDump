--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.SharedLayoutsApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("XboxSupport")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("Signal")
local v5 = v1("Class")
local v_u_6 = v1("package:Sift")
local v_u_7 = require(script.SharedLayout)
local v_u_8 = game:GetService("GuiService")
local v9 = v5("SharedLayoutsApp", v1("UIBaseApp"))
function v9._create_topbar(p_u_10)
    local v_u_11 = UDim.new(0, 6)
    local v_u_12 = UDim.new(0, 10)
    local v_u_13 = UDim.new(0, 10)
    local v14 = {
        ["phone"] = function()
            v_u_11 = UDim.new(0, 0)
            v_u_12 = UDim.new(0, 0)
            v_u_13 = UDim.new(0, 0)
        end
    }
    v_u_3.run(v14)
    local v15 = v_u_7.quick({
        ["fill_direction"] = Enum.FillDirection.Horizontal,
        ["horizontal_alignment"] = Enum.HorizontalAlignment.Right,
        ["vertical_alignment"] = Enum.VerticalAlignment.Top,
        ["list_padding"] = v_u_11,
        ["reverse_sort"] = true,
        ["padding_right"] = v_u_12,
        ["padding_top"] = v_u_13
    })
    local v_u_16 = v15:get_container()
    v_u_16.Name = "topbar"
    v_u_16.AnchorPoint = Vector2.new(1, 0)
    v_u_16.Position = UDim2.fromScale(1, 0)
    local function v_u_21()
        local v17 = v_u_8.TopbarInset.Min.X
        local v18 = p_u_10.instance.AbsoluteSize
        if p_u_10.UIManager.apps.HouseEditorWrapperApp:is_topbar_visible() then
            local v19 = p_u_10.UIManager.apps.HouseEditorWrapperApp:get_topbar_width()
            local v20 = (v18.X + v19) / 2
            v17 = math.max(v17, v20)
        end
        v_u_16.Size = UDim2.new(0, v18.X - v17, 1, 0)
    end
    p_u_10.ui_manager_initialized:Connect(function()
        v_u_21()
        v_u_8:GetPropertyChangedSignal("TopbarInset"):Connect(function()
            v_u_21()
        end)
        p_u_10.UIManager.apps.HouseEditorWrapperApp.topbar_width_changed:Connect(function()
            v_u_21()
        end)
    end)
    v_u_16.Parent = p_u_10.instance
    return v15
end
function v9.select_next_icon(p22, p23)
    local v24 = v_u_8.SelectedObject
    local v25 = v_u_6.Dictionary.values(p22.topbar.registered)
    local v27 = v_u_6.List.filter(v25, function(p26)
        return p26.frame.Selectable
    end)
    local v30 = v_u_6.List.sort(v27, function(p28, p29)
        return p28.frame.LayoutOrder > p29.frame.LayoutOrder
    end)
    local v31 = 1
    if v24 then
        for v32, v33 in v30 do
            if v24 == v33.instance or v24:IsDescendantOf(v33.instance) then
                v31 = v32
                break
            end
        end
    end
    local v34 = v30[v31 + (p23 or 0)]
    if not v34 then
        return nil
    end
    if v34 then
        v34 = v34.frame
    end
    return v34
end
function v9.get_start_order(_)
    return -1
end
function v9.register_to_topbar(p_u_35, p36, p37)
    local v38 = p_u_35.topbar:register(p36, p37)
    if v38.frame:IsA("ImageButton") then
        v38.maid:GiveTask(v_u_2.set_next_selection(v38.frame, Enum.KeyCode.DPadDown, function()
            return p_u_35.UIManager.apps.NavigatorApp.instance.Frame.Buttons.ShopFrame.Shop
        end))
    end
end
function v9.show(_) end
function v9.hide(_) end
function v9.start(p_u_39)
    p_u_39.instance.Enabled = true
    p_u_39.ui_manager_initialized = v_u_4.new()
    task.spawn(function()
        p_u_39.UIManager.wait_for_initialization()
        p_u_39.ui_manager_initialized:Fire()
    end)
    p_u_39.topbar = p_u_39:_create_topbar()
    p_u_39.watch = v_u_2.quick_watch({
        ["selection_parent"] = p_u_39.instance,
        ["default_selection"] = function()
            return p_u_39:select_next_icon()
        end,
        ["app_name"] = p_u_39.ClassName
    })
end
return v9