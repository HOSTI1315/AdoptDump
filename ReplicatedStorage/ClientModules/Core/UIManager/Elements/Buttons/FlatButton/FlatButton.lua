--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Buttons.FlatButton (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("UIDB")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("UIHelpers")
local v6 = v2("FlatButton", v1("UIBaseElement"))
local v_u_7 = {
    ["default"] = {
        ["button_down"] = v3.button_down,
        ["button_up"] = v3.button_up,
        ["shadow_size"] = 3
    },
    ["expand_button"] = {
        ["button_down"] = v3.expand_button_down,
        ["button_up"] = v3.expand_button_up,
        ["shadow_size"] = 5
    },
    ["deep_shadow_button"] = {
        ["button_down"] = v3.nav_button_down,
        ["button_up"] = v3.nav_button_up,
        ["shadow_size"] = 5
    },
    ["square_button"] = {
        ["button_down"] = v3.button_down_square,
        ["button_up"] = v3.button_up_square,
        ["shadow_size"] = 3
    }
}
function hook_generic_hover(p_u_8, p_u_9)
    if v_u_4.get_platform() ~= v_u_4.platform.tablet and v_u_4.get_platform() ~= v_u_4.platform.phone then
        local v_u_10 = p_u_8.ImageColor3
        local v_u_11, v_u_12, v_u_13 = Color3.toHSV(v_u_10)
        local v_u_14 = Color3.fromHSV(v_u_11, v_u_12 + p_u_9 / 360, v_u_13)
        p_u_8.MouseEnter:connect(function()
            p_u_8.ImageColor3 = v_u_14
        end)
        p_u_8.MouseLeave:connect(function()
            p_u_8.ImageColor3 = v_u_10
        end)
        p_u_8:GetPropertyChangedSignal("ImageColor3"):connect(function()
            if p_u_8.ImageColor3 ~= v_u_10 and p_u_8.ImageColor3 ~= v_u_14 then
                v_u_10 = p_u_8.ImageColor3
                local v15, v16, v17 = Color3.toHSV(v_u_10)
                v_u_11 = v15
                v_u_12 = v16
                v_u_13 = v17
                v_u_14 = Color3.fromHSV(v_u_11, v_u_12 + p_u_9 / 360, v_u_13)
            end
        end)
    end
end
function v6.start(p18, p19)
    local v20 = p19 or {}
    local v_u_21 = p18.instance
    local v22 = v20.preset_name or "default"
    local v23 = v20.options
    local v_u_24 = v20.mouse_button1_down
    local v_u_25 = v20.mouse_button1_click
    local v_u_26 = v_u_7[v22]
    local v_u_27 = v23 or {}
    local v28 = v_u_27.hover_hue_shift or -60
    local v_u_29 = v_u_21.Position
    local v_u_30 = v_u_21.Position + UDim2.new(0, 0, 0, v_u_26.shadow_size)
    local v_u_31 = v_u_21:FindFirstChild("TextLabel")
    local v32 = v_u_27.click_box or v_u_21
    hook_generic_hover(v_u_21, v28)
    local v_u_33 = v_u_31 and (v_u_21.TextLabel.TextSize or 0) or 0
    local v_u_34 = v_u_33 - 1
    local v_u_35 = false
    local function v36()
        if not v_u_35 then
            v_u_35 = true
            if v_u_27.hold_down_for then
                wait(v_u_27.hold_down_for)
            end
            v_u_21.Position = v_u_29
            v_u_21.Image = "rbxassetid://" .. v_u_26.button_up
            if v_u_31 then
                v_u_21.TextLabel.TextSize = v_u_33
            end
            v_u_35 = false
        end
    end
    local function v37()
        v_u_21.Position = v_u_30
        v_u_21.Image = "rbxassetid://" .. v_u_26.button_down
        if v_u_31 then
            v_u_21.TextLabel.TextSize = v_u_34
        end
    end
    v32.MouseButton1Down:connect(function()
        v_u_21.Position = v_u_30
        v_u_21.Image = "rbxassetid://" .. v_u_26.button_down
        if v_u_31 then
            v_u_21.TextLabel.TextSize = v_u_34
        end
        if v_u_24 then
            v_u_24()
        end
    end)
    v32.MouseButton1Click:connect(function()
        if v_u_25 then
            v_u_25()
        end
    end)
    if not v_u_27.no_up then
        v32.MouseButton1Up:connect(function()
            if not v_u_35 then
                v_u_35 = true
                if v_u_27.hold_down_for then
                    wait(v_u_27.hold_down_for)
                end
                v_u_21.Position = v_u_29
                v_u_21.Image = "rbxassetid://" .. v_u_26.button_up
                if v_u_31 then
                    v_u_21.TextLabel.TextSize = v_u_33
                end
                v_u_35 = false
            end
        end)
        v32.MouseLeave:connect(function()
            if not v_u_35 then
                v_u_35 = true
                if v_u_27.hold_down_for then
                    wait(v_u_27.hold_down_for)
                end
                v_u_21.Position = v_u_29
                v_u_21.Image = "rbxassetid://" .. v_u_26.button_up
                if v_u_31 then
                    v_u_21.TextLabel.TextSize = v_u_33
                end
                v_u_35 = false
            end
        end)
        v_u_5.call_func_on_made_invisible(v_u_21, function()
            wait()
            if not v_u_35 then
                v_u_35 = true
                if v_u_27.hold_down_for then
                    wait(v_u_27.hold_down_for)
                end
                v_u_21.Position = v_u_29
                v_u_21.Image = "rbxassetid://" .. v_u_26.button_up
                if v_u_31 then
                    v_u_21.TextLabel.TextSize = v_u_33
                end
                v_u_35 = false
            end
        end)
    end
    p18.button_down = v37
    p18.button_up = v36
end
return v6