--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Buttons.DepthButton (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("DepthButtonColorDB")
local v5 = v2("DepthButton", v1("UIBaseElement"))
local v_u_6 = game:GetService("TweenService")
function v5._is_active(p7)
    local v8 = not p7.disabled
    if v8 then
        v8 = p7.enabled
    end
    return v8
end
function v5.set_color_by_entry_name(p9, p10, p11)
    local v12 = v_u_4[p10]
    assert(v12, ("No color entry by name of %s exists in the DepthButtonColorDB."):format(p10))
    return p9:set_color_from_entry(v12, p11)
end
function v5.set_color_from_entry(p13, p14, p15)
    local v16 = p15 and true or false
    local v17 = p13.instance.Face.Colors:FindFirstChild("Base")
    local v18 = p13.instance.Face.Colors:FindFirstChild("Highlight")
    local v19 = p13.instance.Shadow.Colors:FindFirstChild("Left")
    local v20 = p13.instance.Shadow.Colors:FindFirstChild("Middle")
    local v21 = p13.instance.Shadow.Colors:FindFirstChild("Right")
    v17.ImageColor3 = p14.base
    v18.ImageColor3 = p14.highlight
    v20.ImageColor3 = p14.shadow_middle
    v18.Visible = v16
    if v19 then
        v19.ImageColor3 = p14.shadow_left
        v19.Visible = v16
    end
    if v21 then
        v21.ImageColor3 = p14.shadow_right
        v21.Visible = v16
    end
end
function v5.set_face_shadow_color(p22, p23, p24)
    p22:set_color_from_entry({
        ["base"] = p23,
        ["highlight"] = p23,
        ["shadow_middle"] = p24,
        ["shadow_left"] = p24,
        ["shadow_right"] = p24
    }, false)
end
function v5.set_basic_color(p25, p26)
    local v27, v28, v29 = Color3.toHSV(p26)
    local v30 = Color3.fromHSV
    local v31 = v29 - 0.22
    p25:set_face_shadow_color(p26, (v30(v27, v28, (math.clamp(v31, 0, 1)))))
end
function v5.set_state(p32, p33)
    if p33 ~= p32.state then
        p32.instance.Shadow.Visible = true
        p32.instance.Face.Position = UDim2.new(0, 0, 0, 0)
        p32.disabled = false
        if p33 == "normal" then
            p32:set_color_from_entry(v_u_4.green, true)
        elseif p33 == "selected" then
            p32:set_color_from_entry(v_u_4.orange, true)
        elseif p33 == "inactive" then
            p32:set_color_from_entry(v_u_4.black, true)
        elseif p33 == "cancel" then
            p32:set_color_from_entry(v_u_4.red, true)
        elseif p33 == "unpressable" then
            p32:set_color_from_entry(v_u_4.black, true)
            p32.instance.Shadow.Visible = false
            p32.instance.Face.Position = UDim2.new(0, 0, 0.1, 0)
            p32.disabled = true
        elseif p33 == "disabled" then
            p32:set_color_from_entry(v_u_4.black, true)
            p32.disabled = true
        elseif p33 == "normal_blue" then
            p32:set_color_from_entry(v_u_4.blue, true)
        else
            error(("Tried to set_state of DepthButton with nonexistent state %s."):format((tostring(p33))))
        end
        p32.state = p33
    end
end
function v5.get_state(p34)
    return p34.state
end
function v5.set_button_pressed(p_u_35, p_u_36)
    if p_u_35:_is_active() then
        if p_u_35.instance ~= nil and p_u_35.instance.Parent ~= nil then
            local v_u_37
            if p_u_35.instance.Face.Size.Y.Offset == 0 or p_u_35.instance.Face.Size.Y.Scale ~= 1 then
                v_u_37 = {
                    ["up"] = {
                        ["speed"] = 0.2,
                        ["props"] = {
                            ["Position"] = UDim2.new(0, 0, 0, 0)
                        }
                    },
                    ["down"] = {
                        ["speed"] = 0.05,
                        ["props"] = {
                            ["Position"] = UDim2.new(0, 0, 1 - p_u_35.instance.Face.Size.Y.Scale, 0)
                        }
                    }
                }
            else
                v_u_37 = {
                    ["up"] = {
                        ["speed"] = 0.2,
                        ["props"] = {
                            ["Position"] = UDim2.new(0, 0, 0, 0)
                        }
                    },
                    ["down"] = {
                        ["speed"] = 0.05,
                        ["props"] = {
                            ["Position"] = UDim2.new(0, 0, 0, -p_u_35.instance.Face.Size.Y.Offset)
                        }
                    }
                }
            end
            coroutine.wrap(function()
                if p_u_35.button_going_down and p_u_36 == "up" then
                    p_u_35.go_up_automatically = true
                else
                    if p_u_36 == "down" then
                        p_u_35.button_going_down = true
                    end
                    local v38 = v_u_37[p_u_36]
                    local v39 = v_u_6:Create(p_u_35.instance.Face, TweenInfo.new(v38.speed), v38.props)
                    v39:Play()
                    p_u_35.last_tween = v39
                    wait(v38.speed)
                    if p_u_36 == "down" then
                        p_u_35.button_going_down = false
                        if p_u_35.go_up_automatically and v39 == p_u_35.last_tween then
                            p_u_35.go_up_automatically = false
                            p_u_35:set_button_pressed("up")
                        end
                    end
                end
            end)()
        end
    else
        return
    end
end
function v5.hide(p40)
    p40.instance.Visible = false
end
function v5.show(p41)
    p41.instance.Visible = true
end
function v5.set_enabled(p42, p43)
    p42.enabled = p43
    p42.click_box.Active = p43
end
function v5.start(p_u_44, p45)
    local v46 = p45 or {}
    local v47 = p_u_44.instance
    local v48 = v46.options or {}
    local v_u_49 = v46.is_scroll_button
    local v_u_50 = v46.mouse_button1_down
    local v_u_51 = v46.mouse_button1_click
    local v52 = v46.state
    local v53 = v46.shine or false
    local v_u_54 = v48.click_box or v47
    local v_u_55 = v46.hold_down or false
    p_u_44.enabled = true
    p_u_44.click_box = v_u_54
    local v_u_56
    if v_u_3.get_platform() == v_u_3.platform.desktop then
        v_u_56 = false
    else
        local v57 = p_u_44.instance:FindFirstAncestorOfClass("SurfaceGui")
        if v57 == nil then
            v_u_56 = false
        else
            v_u_56 = not v57.AlwaysOnTop
        end
    end
    if v52 then
        p_u_44:set_state(v52)
    end
    if v53 then
        p_u_44.UIManager.wrap(p_u_44.instance.Face, "Shine"):start()
    end
    local function v_u_68()
        local v_u_58 = 0
        local v_u_59 = -1
        local function v60()
            v_u_58 = v_u_58 + 1
            v_u_59 = v_u_58
            p_u_44:set_button_pressed("down")
            if v_u_50 and p_u_44:_is_active() then
                v_u_50()
            end
        end
        if v_u_56 then
            v_u_54.InputBegan:Connect(function(p61)
                if p61.UserInputType == Enum.UserInputType.Touch or p61.UserInputType == Enum.UserInputType.MouseButton1 then
                    v_u_58 = v_u_58 + 1
                    v_u_59 = v_u_58
                    p_u_44:set_button_pressed("down")
                    if v_u_50 and p_u_44:_is_active() then
                        v_u_50()
                    end
                end
            end)
        else
            v_u_54.MouseButton1Down:Connect(v60)
        end
        v_u_54.MouseButton1Click:Connect(function()
            if v_u_59 == v_u_58 and (v_u_51 and p_u_44:_is_active()) then
                v_u_58 = v_u_58 + 1
                v_u_51()
            end
        end)
        v_u_54.MouseButton1Up:Connect(function()
            if not v_u_55 then
                p_u_44:set_button_pressed("up")
            end
        end)
        v_u_54.MouseEnter:Connect(function()
            if p_u_44.enabled then
                if not p_u_44.highlight then
                    p_u_44.highlight = Instance.new("ImageLabel")
                    p_u_44.highlight.Name = "Highlight"
                    p_u_44.highlight.Image = "rbxassetid://2685787252"
                    p_u_44.highlight.ImageTransparency = 0.85
                    p_u_44.highlight.ImageColor3 = Color3.new(1, 1, 1)
                    p_u_44.highlight.ScaleType = Enum.ScaleType.Slice
                    p_u_44.highlight.SliceCenter = Rect.new(10, 10, 105, 17)
                    p_u_44.highlight.Size = UDim2.new(1, 0, 1, 0)
                    p_u_44.highlight.ZIndex = -1
                    p_u_44.highlight.BackgroundTransparency = 1
                    p_u_44.highlight.Parent = p_u_44.instance.Face
                end
            else
                return
            end
        end)
        local v62 = p_u_44.instance:FindFirstAncestorWhichIsA("ScreenGui")
        local v_u_63 = v62 and p_u_44.UIManager.apps[v62.Name]
        if v_u_63 then
            v_u_63 = v62.Name
        end
        if v_u_63 then
            local v_u_64 = p_u_44.UIManager.is_visible(v_u_63)
            local v_u_67 = p_u_44.UIManager.app_visibilities_changed:Connect(function(p65, p66)
                if p65 == v_u_63 and v_u_64 ~= p66 then
                    if not p66 then
                        p_u_44:set_button_pressed("up")
                    end
                    v_u_64 = p66
                end
            end)
            p_u_44.instance.Destroying:Connect(function()
                v_u_67:Disconnect()
            end)
        end
    end
    v_u_3.run({
        ["desktop"] = function()
            v_u_68()
        end,
        ["phone"] = function()
            if v_u_49 then
                local v_u_69 = false
                v_u_54.Activated:Connect(function()
                    p_u_44:set_button_pressed("down")
                    if v_u_50 and p_u_44:_is_active() then
                        v_u_50()
                    end
                    if v_u_51 and p_u_44:_is_active() then
                        v_u_51()
                    end
                    v_u_69 = true
                end)
                v_u_54.MouseButton1Up:Connect(function()
                    if not v_u_55 and v_u_69 then
                        p_u_44:set_button_pressed("up")
                    end
                    v_u_69 = false
                end)
            else
                v_u_68()
            end
        end,
        ["console"] = "desktop",
        ["tablet"] = "phone"
    })
    v_u_54.InputEnded:Connect(function()
        if not v_u_55 then
            p_u_44:set_button_pressed("up")
        end
        if p_u_44.highlight then
            p_u_44.highlight:Destroy()
            p_u_44.highlight = nil
        end
    end)
    return p_u_44
end
return v5