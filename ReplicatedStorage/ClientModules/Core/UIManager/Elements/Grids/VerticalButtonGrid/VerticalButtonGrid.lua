--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Grids.VerticalButtonGrid (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("package:Sift")
local v_u_4 = v1("VerticalGrid")
local v5 = v2("VerticalButtonGrid", v_u_4)
local v_u_6 = Instance.new("Frame")
v_u_6.BackgroundTransparency = 1
local v7 = Instance.new("UIGridLayout")
v7.HorizontalAlignment = Enum.HorizontalAlignment.Center
v7.VerticalAlignment = Enum.VerticalAlignment.Center
v7.Parent = v_u_6
function v5.get_button(p8, p9, p10)
    local v11 = p9 - 1
    local v12 = p8.button_instances and p8.button_instances[v11]
    if v12 then
        v12 = p8.button_instances[v11][p10]
    end
    return v12
end
function v5.render_row(p13, p14, p15)
    local v16 = v_u_6:Clone()
    v16.Name = "Row" .. p14
    v16.Size = UDim2.new(1, 0, 0, p13.options.row_height)
    v16.LayoutOrder = p14
    v16.UIGridLayout.CellPadding = UDim2.new(0, p13.options.padding, 0, 0)
    v16.UIGridLayout.CellSize = UDim2.new(1 / p13.options.cells_per_row, -p13.options.padding, 1, 0)
    v16.UIGridLayout.FillDirectionMaxCells = p13.options.cells_per_row
    p13.button_instances[p14] = {}
    for v17, v18 in p15 do
        local v19 = v18.layout_order
        assert(v19, "Missing layout_order property")
        local v20 = v18.text
        assert(v20, "Missing text property")
        local v21 = p13.button_template:Clone()
        v21.LayoutOrder = v18.layout_order
        v21.Face.TextLabel.Text = v18.text
        if v18.icon and v21.Face:FindFirstChild("Icon") then
            v21.Face.Icon.Visible = v18.icon ~= nil
            v21.Face.Icon.Image = v18.icon
            local v22 = v21.Face.TextLabel.Position
            v21.Face.TextLabel.Position = UDim2.new(v22.X.Scale, -5, v22.Y.Scale, v22.Y.Offset)
            local v23 = v21.Face.TextLabel
            local v24
            if v18.icon then
                v24 = Enum.TextXAlignment.Left
            else
                v24 = Enum.TextXAlignment.Center
            end
            v23.TextXAlignment = v24
            local v25 = v21.Face.TextLabel.Size
            v21.Face.TextLabel.Size = UDim2.new(0.725, -5, v25.Y.Scale, v25.Y.Offset)
            v21.Face.TextLabel.AnchorPoint = Vector2.new(1, 0)
        end
        local v26 = p13.UIManager.wrap(v21, "DepthButton"):start(v18.button_props)
        if v18.button_state then
            v26:set_state(v18.button_state)
        end
        v21.Parent = v16
        p13.button_instances[p14][v17] = v21
    end
    return v16
end
function v5.connect_rows(_, p27, p28)
    local v29 = p27:GetChildren()
    local v31 = v_u_3.List.filter(v29, function(p30)
        return p30:FindFirstChildWhichIsA("ImageButton")
    end)
    local v32 = p28:GetChildren()
    local v34 = v_u_3.List.filter(v32, function(p33)
        return p33:FindFirstChildWhichIsA("ImageButton")
    end)
    local v35 = #v31
    local v36 = #v34
    local v37 = math.max(v35, v36)
    table.sort(v31, function(p38, p39)
        return p38.LayoutOrder < p39.LayoutOrder
    end)
    table.sort(v34, function(p40, p41)
        return p40.LayoutOrder < p41.LayoutOrder
    end)
    for v42 = 1, v37 do
        if v31[v42] then
            v31[v42].Button.NextSelectionDown = v34[math.min(v42, v36)].Button
        end
        if v34[v42] then
            v34[v42].Button.NextSelectionUp = v31[math.min(v42, v35)].Button
        end
    end
end
function v5.start(p43, p44, p45)
    p43.button_instances = {}
    v_u_4.start(p43, p43.instance, p43.instance.Content, {
        ["row_height"] = p45.row_height or 50,
        ["cells_per_row"] = p45.cells_per_row or 1,
        ["padding"] = p45.padding or 10
    })
    p43.button_template = p44
    p43.button_template.Parent = nil
    return p43
end
return v5