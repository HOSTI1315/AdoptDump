--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.DoorTestApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PlatformM")
local v3, v_u_4 = v1("Class")("TestDoorApp", v1("UIBaseApp"))
local v_u_5 = {
    ["empty"] = Vector2.new(0, 0),
    ["checked"] = Vector2.new(20, 0),
    ["unchecked"] = Vector2.new(0, 20),
    ["failed"] = Vector2.new(20, 20)
}
function v3.__init(p_u_6, ...)
    v_u_4.__init(p_u_6, ...)
    p_u_6._checklist_items = {}
    p_u_6._line_count = 0
    p_u_6._line_base = p_u_6.instance.Line
    p_u_6._line_base.Parent = nil
    p_u_6._checklist = p_u_6.instance.CheckList.ScrollingFrame
    p_u_6._door_label = p_u_6.instance.DoorBar.Label
    p_u_6._interior_label = p_u_6.instance.InteriorBar.Label
    p_u_6._is_paused = false
    p_u_6._pause_text_connection = p_u_6.instance.CheckList.PauseButton.Activated:Connect(function()
        if p_u_6._is_paused then
            p_u_6.instance.CheckList.PauseButton.Text = "Pause Test"
            p_u_6._is_paused = false
        else
            p_u_6.instance.CheckList.PauseButton.Text = "Resume Test"
            p_u_6._is_paused = true
        end
    end)
    v_u_2.run({
        ["phone"] = function()
            p_u_6.instance.UIScale.Scale = 0.5
        end,
        ["tablet"] = "phone"
    })
end
function v3.register_pause_button_callback(p7, p_u_8)
    return p7.instance.CheckList.PauseButton.Activated:Connect(function()
        p_u_8()
    end)
end
function v3.register_stop_button_callback(p9, p_u_10)
    return p9.instance.CheckList.StopButton.Activated:Connect(function()
        p_u_10()
    end)
end
function v3.add_checklist_line(p11, p12)
    if not p11._checklist_items[p12] then
        local v13 = p11._line_base:Clone()
        p11._checklist_items[p12] = v13
        p11._line_count = p11._line_count + 1
        v13.Checkbox.ImageRectOffset = v_u_5.empty
        v13.Label.Text = p12
        v13.LayoutOrder = p11._line_count
        p11._checklist.CanvasSize = UDim2.new(0, 0, 0, v13.Size.Y.Offset * p11._line_count)
        v13.Parent = p11._checklist
    end
end
function v3.update_checklist_line(p14, p15, p16)
    local v17 = p14._checklist_items[p15]
    if not v17 then
        error((("interior %* does not have a line yet"):format(p15)))
    end
    v17.Checkbox.ImageRectOffset = v_u_5[p16]
end
function v3.clear_checklist(p18)
    for _, v19 in p18._checklist_items do
        v19:Destroy()
    end
    table.clear(p18._checklist_items)
    p18._line_count = 0
    p18._is_paused = false
end
function v3.set_interior_label(p20, p21)
    p20._interior_label.Text = ("Interior: %*"):format(p21)
end
function v3.set_door_label(p22, p23)
    p22._door_label.Text = ("Door: %*"):format(p23)
end
function v3.show(p24)
    p24._checklist.Parent.Visible = true
    p24._door_label.Parent.Visible = true
    p24._interior_label.Parent.Visible = true
end
function v3.hide(p25)
    p25._checklist.Parent.Visible = false
    p25._door_label.Parent.Visible = false
    p25._interior_label.Parent.Visible = false
end
function v3.start(p26)
    p26._checklist.Parent.Visible = false
    p26._door_label.Parent.Visible = false
    p26._interior_label.Parent.Visible = false
end
return v3