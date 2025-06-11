--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.PatchNotesTable (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("new:Markdown")
local v_u_5 = v1("PlatformM")
local v_u_6 = v1("new:RichTextHelper")
local v7 = v2("PatchNotesTable", v1("UIBaseElement"))
function v7.start(p_u_8, p9, p10)
    p_u_8.maid = v_u_3.new()
    p_u_8.scrolling_frame = p_u_8.instance.ScrollingFrame
    p_u_8.scrolling_frame.Frame.UIListLayout.HorizontalFlex = "None"
    local v11 = p_u_8.scrolling_frame.Frame.Column
    v11.Parent = nil
    local v12 = {}
    for v13, v14 in p9.data.rows do
        for v15, v16 in v14 do
            v12[v15] = v12[v15] or {}
            v12[v15][v13] = v16
        end
    end
    for v17, v18 in v12 do
        local v19 = v11:Clone()
        v19.LayoutOrder = v17
        local v20
        if p9.data.has_header then
            v19.Heading.Text = v_u_6.convert_line(v18[1], v_u_4, p10)
            v19.Heading.TextXAlignment = p9.data.alignments[v17] or Enum.TextXAlignment.Left
            v20 = 2
        else
            v19.Heading.Visible = false
            v20 = 1
        end
        local v21 = v19.Entry
        v21.Parent = nil
        for v22 = v20, #v18 do
            local v23 = v21:Clone()
            v23.LayoutOrder = v22
            v23.Text = v_u_6.convert_line(v18[v22], v_u_4, p10)
            v23.Parent = v19
            v23.BackgroundTransparency = v22 % 2 == 0 and 1 or 0.9
            v23.TextXAlignment = p9.data.alignments[v17] or Enum.TextXAlignment.Left
        end
        v19.Parent = p_u_8.scrolling_frame.Frame
    end
    v_u_5.run({
        ["desktop"] = function()
            p_u_8:_connect_drag_behavior()
        end
    })
    task.defer(function()
        if p_u_8.scrolling_frame.Frame.UIListLayout.AbsoluteContentSize.X < p_u_8.scrolling_frame.AbsoluteSize.X then
            p_u_8.scrolling_frame.Frame.UIListLayout.HorizontalFlex = "Fill"
            p_u_8.scrolling_frame.Frame.UIPadding.PaddingBottom = UDim.new(0, 3)
            p_u_8.instance.ScrollbarBackground.Visible = false
        end
    end)
end
function v7._connect_drag_behavior(p_u_24)
    p_u_24.dragging = false
    p_u_24.last_position = nil
    p_u_24.maid:GiveTask(p_u_24.scrolling_frame.InputBegan:Connect(function(p25)
        if p25.UserInputType == Enum.UserInputType.MouseButton1 then
            p_u_24.dragging = true
            p_u_24.last_position = p25.Position.X
        end
    end))
    p_u_24.maid:GiveTask(p_u_24.scrolling_frame.InputChanged:Connect(function(p26)
        if p_u_24.dragging and p26.UserInputType == Enum.UserInputType.MouseMovement then
            local v27 = p26.Position.X - p_u_24.last_position
            local v28 = p_u_24.scrolling_frame
            v28.CanvasPosition = v28.CanvasPosition - Vector2.new(v27, 0)
            p_u_24.last_position = p26.Position.X
        end
    end))
    p_u_24.maid:GiveTask(p_u_24.scrolling_frame.InputEnded:Connect(function(p29)
        if p29.UserInputType == Enum.UserInputType.MouseButton1 then
            p_u_24.dragging = false
            p_u_24.last_position = nil
        end
    end))
end
function v7.destroy(p30)
    p30.maid:DoCleaning()
end
return v7