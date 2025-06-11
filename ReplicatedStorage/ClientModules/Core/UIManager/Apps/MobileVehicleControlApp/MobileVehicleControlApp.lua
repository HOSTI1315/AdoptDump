--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MobileVehicleControlApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Signal")
local v_u_3 = {
    ["Vertical"] = {
        ["up"] = true,
        ["down"] = true,
        ["jump"] = false
    },
    ["Jump"] = {
        ["up"] = false,
        ["down"] = false,
        ["jump"] = true
    }
}
local v4 = v1("Class")("MobileVehicleControlApp", v1("UIBaseApp"))
function v4._get_container_size_and_position(p5)
    local v6 = p5.instance.AbsoluteSize
    local v7 = v6.X
    local v8 = v6.Y
    local v9 = math.min(v7, v8) <= 500
    local v10 = v9 and 70 or 120
    local v11 = UDim2.new(0, v10, 0, v10)
    if v9 then
        return v11, UDim2.new(1, -(v10 * 1.5 - 10), 1, -v10 - 20)
    else
        return v11, UDim2.new(1, -(v10 * 1.5 - 10), 1, -v10 * 1.75)
    end
end
function v4._create_arrow(p_u_12, p13, p14)
    local v_u_15 = Instance.new("Frame")
    v_u_15.BackgroundTransparency = 1
    v_u_15.Size = UDim2.new(p13, 0, p13, 0)
    v_u_15.Parent = p_u_12.container
    local v_u_16 = Instance.new("ImageButton")
    v_u_16.Name = "Button"
    v_u_16.Image = "rbxassetid://6836685273"
    v_u_16.ImageRectSize = Vector2.new(144, 144)
    v_u_16.ImageRectOffset = Vector2.new(1, 146)
    v_u_16.Rotation = p14
    v_u_16.BackgroundTransparency = 1
    v_u_16.Size = UDim2.new(1, 0, 1, 0)
    v_u_16.Parent = v_u_15
    local v_u_17 = nil
    v_u_16.InputBegan:Connect(function(p18)
        v_u_17 = p18
        p_u_12.input_status[v_u_15] = true
        p_u_12.input_status_changed:Fire(v_u_15.Name, true)
        v_u_16.ImageRectOffset = Vector2.new(146, 146)
    end)
    v_u_16.InputEnded:Connect(function(p19)
        if p19 == v_u_17 and p_u_12.input_status[v_u_15] then
            v_u_17 = nil
            p_u_12.input_status[v_u_15] = false
            p_u_12.input_status_changed:Fire(v_u_15.Name, false)
            v_u_16.ImageRectOffset = Vector2.new(1, 146)
        end
    end)
    return v_u_15
end
function v4.get_jump_input(p20)
    return p20.input_status[p20.buttons.jump] and 1 or 0
end
function v4.get_vertical_input(p21)
    return (p21.input_status[p21.buttons.up] and 1 or 0) - (p21.input_status[p21.buttons.down] and 1 or 0)
end
function v4.get_input_status_changed_signal(p22)
    return p22.input_status_changed
end
function v4.set_configuration(p23, p24)
    local v25 = v_u_3[p24]
    local v26 = "Invalid configuration name " .. p24
    assert(v25, v26)
    for v27, v28 in v25 do
        p23.buttons[v27].Visible = v28
    end
end
function v4.show(p29)
    p29.instance.Enabled = true
end
function v4.hide(p30)
    p30.instance.Enabled = false
end
function v4.refresh(p31, p32)
    p31:set_visibility(p32[p31.ClassName])
end
function v4.start(p33)
    p33.input_status = {}
    p33.input_status_changed = v_u_2.new()
    local v34, v35 = p33:_get_container_size_and_position()
    p33.container = p33.instance.Container
    p33.container.Size = v34
    p33.container.Position = v35
    p33.buttons = {}
    p33.buttons.jump = p33:_create_arrow(1, 0)
    p33.buttons.jump.Name = "Jump"
    p33.buttons.up = p33:_create_arrow(0.85, 0)
    p33.buttons.up.Name = "Up"
    p33.buttons.down = p33:_create_arrow(0.85, 180)
    p33.buttons.down.Name = "Down"
    p33:set_configuration("Jump")
end
return v4