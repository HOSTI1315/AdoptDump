--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.InteractionsApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PlatformM")
local v_u_3 = v1("XboxSupport")
local v4 = v1("Class")
local v_u_5 = v1("InteractionsEngine")
local v_u_6 = v1("ColorThemeManager")
local v_u_7 = v1("Set")
local v_u_8 = v1("ScriptUtil")
local v_u_9 = v1("TableUtil")
local v_u_10 = v1("Signal")
local v_u_11 = v1("new:TextUtil")
local v_u_12 = v1("ClickTapInWorldExclusionList")
local v_u_13 = v1("Debug").create_log()
local v_u_14 = game:GetService("ContextActionService")
local v15 = game:GetService("LocalizationService")
local v16 = v4("InteractionsApp", v1("UIBaseApp"))
local v_u_17 = {
    Enum.KeyCode.One,
    Enum.KeyCode.Two,
    Enum.KeyCode.Three,
    Enum.KeyCode.Four,
    Enum.KeyCode.Five,
    Enum.KeyCode.Six,
    Enum.KeyCode.Seven,
    Enum.KeyCode.Eight,
    Enum.KeyCode.Nine
}
local v_u_18 = v_u_2.get_platform()
local v_u_19 = v_u_18 == v_u_2.platform.phone and true or v_u_18 == v_u_2.platform.tablet
local v_u_20 = game.Players.LocalPlayer:GetMouse()
local v_u_21 = v15:GetTranslatorForPlayer(game.Players.LocalPlayer)
local v_u_22 = v_u_10.new()
function v16.show(p23)
    p23.instance.Enabled = true
end
function v16.hide(p24)
    p24.instance.Enabled = false
end
function is_point_in_rect(p25, p26)
    return p26.X >= p25.Min.X and (p26.X <= p25.Max.X and (p26.Y >= p25.Min.Y and p26.Y <= p25.Max.Y))
end
local function v_u_32(p27, p28)
    local v29, v30 = workspace.CurrentCamera:WorldToViewportPoint(p27.Adornee.Position + p27.StudsOffsetWorldSpace)
    if not v30 then
        return false
    end
    local v31 = p27.TapButton.AbsolutePosition + Vector2.new(v29.X, v29.Y) - p27.AbsoluteSize * 0.5
    return is_point_in_rect(Rect.new(v31, v31 + p27.TapButton.AbsoluteSize), Vector2.new(p28 and p28.X or v_u_20.X, p28 and p28.Y or v_u_20.Y))
end
local function v_u_36(p33, p34, p35)
    if p33 == "Turn Off" then
        p35.Front.ImageColor3 = v_u_6.lookup("saturated")
        p35.Icon.ImageColor3 = v_u_6.lookup("saturated")
        p35.Back.ImageColor3 = Color3.new(1, 1, 1)
        p35.Front.Image = "rbxassetid://2842565810"
        p35.Back.Image = "rbxassetid://2787906846"
    else
        p35.Front.ImageColor3 = Color3.new(1, 1, 1)
        p35.Icon.ImageColor3 = Color3.new(1, 1, 1)
        p35.Back.ImageColor3 = v_u_6.lookup("saturated")
        p35.Front.Image = "rbxassetid://2842565646"
        p35.Back.Image = "rbxassetid://2787885224"
    end
    p35.Front.ImageTransparency = p34 and 0.05 or 0
    p35.Back.ImageTransparency = p34 and 0.2 or 0
end
local function v_u_45(p37)
    local v38 = p37.text
    local v39
    if typeof(v38) == "function" then
        v39 = v38()
    else
        v39 = v38
    end
    if v39 == nil then
        v39 = nil
    elseif typeof(v38) == "table" then
        local v40 = v39.display_mode == "buy_with_icon"
        assert(v40, "Invalid display mode for text table")
    end
    if v39 then
        if typeof(v39) ~= "table" or v39.display_mode ~= "buy_with_icon" then
            p37.gui.instance.Message.buy_with_icon.Visible = false
            p37.gui.instance.Message.default.Visible = true
            local v41 = p37.gui.instance.Message.default
            v41.TextLabel.Text = v39
            v41.TextLabel.TextTransparency = 0
            v41.TextLabel.TextStrokeTransparency = 0
            v41.TextLabel.Visible = true
            return v39
        end
        p37.gui.instance.Message.buy_with_icon.Visible = true
        p37.gui.instance.Message.default.Visible = false
        local v42 = p37.gui.instance.Message.buy_with_icon
        v42.ItemLabel.Text = v39.item_row_text
        local v43 = v42.CostRow.CostLabel
        local v44 = v39.item_cost
        v43.Text = tostring(v44)
        v42.CostRow.IconImage.Image = v39.icon
        return v39
    end
    p37.gui.instance.Message.default.Visible = false
    p37.gui.instance.Message.buy_with_icon.Visible = false
end
function v16.get_interaction_signal(_)
    return v_u_22
end
function v16.get_hovered_interaction(p46, p47)
    local v48 = {}
    for v49, _ in pairs(p46.interactions) do
        if v_u_32(v49.gui.instance, p47) then
            table.insert(v48, v49)
        end
    end
    local v50 = workspace.CurrentCamera.CFrame.Position
    local v51 = (1 / 0)
    local v52 = nil
    if #v48 > 0 then
        for _, v53 in pairs(v48) do
            local v54 = (v50 - v53.part.Position).magnitude
            if v54 < v51 then
                v52 = v53
                v51 = v54
            end
        end
    end
    return v52
end
function v16.closest_step(p55)
    local v56 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if v56 then
        v56 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    end
    if v56 then
        local v57 = v_u_5:get_closest_interaction()
        for v58, _ in pairs(p55.interactions) do
            if not v58.mouse_down then
                if v58 == v57 then
                    if v_u_19 or v_u_2.is_using_gamepad() then
                        v_u_45(v58)
                        v58.gui:set_always_on_top_zindex(1)
                    end
                    local v59 = v58.gui.instance.TapButton.Icon
                    local v_u_60 = v_u_18 == v_u_2.platform.desktop and "rbxassetid://2842612143" or "rbxassetid://2842570500"
                    if p55.gamepad_icon_closest and p55.gamepad_icon_closest.instance ~= v59 then
                        p55.gamepad_icon_closest:destroy()
                        p55.gamepad_icon_closest = nil
                    end
                    if not p55.gamepad_icon_closest then
                        p55.gamepad_icon_closest = p55.UIManager.wrap(v58.gui.instance.TapButton.Icon, "GamepadIcon"):start({
                            ["key"] = Enum.KeyCode.ButtonX,
                            ["on_update"] = function(p61, p62)
                                if not p62 then
                                    p61.instance.Image = v_u_60
                                end
                            end
                        })
                    end
                else
                    if v_u_19 or v_u_2.is_using_gamepad() then
                        v58.gui.instance.Message.default.Visible = false
                        v58.gui.instance.Message.buy_with_icon.Visible = false
                        v58.gui:set_always_on_top_zindex(0)
                    end
                    v58.gui.instance.TapButton.Icon.Image = "rbxassetid://2842570500"
                end
                if v58.icon_replacement then
                    local v63 = v58.icon_replacement()
                    if v63 then
                        v58.gui.instance.TapButton.Icon.Image = v63
                    end
                end
            end
        end
    end
end
function v16.refresh_hover_states(p64)
    local v65 = (-1 / 0)
    local v66 = nil
    for v67, _ in pairs(p64.hovering) do
        v_u_13("Refreshing hover state for interaction", v67.id)
        if v65 < v67.gui.zindex then
            v65 = v67.gui.zindex
            v66 = v67
        end
    end
    for v68, _ in pairs(p64.interactions) do
        if v68 == v66 then
            local v69 = v68.text
            local v70
            if typeof(v69) == "function" then
                v70 = v69()
            else
                v70 = v69
            end
            if v70 == nil then
                v70 = nil
            elseif typeof(v69) == "table" then
                local v71 = v70.display_mode == "buy_with_icon"
                assert(v71, "Invalid display mode for text table")
            end
            v_u_36(v70, false, v68.gui.instance.TapButton)
            v_u_45(v68)
            v68.gui:set_always_on_top_zindex(1)
        else
            local v72 = v68.text
            local v73
            if typeof(v72) == "function" then
                v73 = v72()
            else
                v73 = v72
            end
            if v73 == nil then
                v73 = nil
            elseif typeof(v72) == "table" then
                local v74 = v73.display_mode == "buy_with_icon"
                assert(v74, "Invalid display mode for text table")
            end
            v_u_36(v73, true, v68.gui.instance.TapButton)
            v68.gui.instance.Message.default.Visible = false
            v68.gui.instance.Message.buy_with_icon.Visible = false
            v68.gui:set_always_on_top_zindex(0)
        end
    end
end
function get_choice_positioning(p75)
    if p75 == 1 then
        return {
            {
                ["position"] = UDim2.new(0.5, 0, 0.5, 0),
                ["anchor_point"] = Vector2.new(0.5, 0.5)
            }
        }
    end
    if p75 == 2 then
        return {
            {
                ["position"] = UDim2.new(0.5, 0, 0.5, -20),
                ["anchor_point"] = Vector2.new(0.5, 1)
            },
            {
                ["position"] = UDim2.new(0.5, 0, 0.5, 20),
                ["anchor_point"] = Vector2.new(0.5, 0)
            }
        }
    end
    if p75 == 3 then
        return {
            {
                ["position"] = UDim2.new(0.5, 0, 0.5, -20),
                ["anchor_point"] = Vector2.new(0.5, 1)
            },
            {
                ["position"] = UDim2.new(0.5, -17, 0.5, 14),
                ["anchor_point"] = Vector2.new(1, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, 17, 0.5, 14),
                ["anchor_point"] = Vector2.new(0, 0.5)
            }
        }
    end
    if p75 == 4 then
        return {
            {
                ["position"] = UDim2.new(0.5, 0, 0.5, -30),
                ["anchor_point"] = Vector2.new(0.5, 1)
            },
            {
                ["position"] = UDim2.new(0.5, 0, 0.5, 30),
                ["anchor_point"] = Vector2.new(0.5, 0)
            },
            {
                ["position"] = UDim2.new(0.5, -30, 0.5, 0),
                ["anchor_point"] = Vector2.new(1, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, 30, 0.5, 0),
                ["anchor_point"] = Vector2.new(0, 0.5)
            }
        }
    end
    if p75 == 5 then
        return {
            {
                ["position"] = UDim2.new(0.5, 0, 0.5, -40),
                ["anchor_point"] = Vector2.new(0.5, 1)
            },
            {
                ["position"] = UDim2.new(0.5, -40, 0.5, -6),
                ["anchor_point"] = Vector2.new(1, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, 40, 0.5, -6),
                ["anchor_point"] = Vector2.new(0, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, -17, 0.5, 47),
                ["anchor_point"] = Vector2.new(1, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, 17, 0.5, 47),
                ["anchor_point"] = Vector2.new(0, 0.5)
            }
        }
    end
    if p75 == 6 then
        return {
            {
                ["position"] = UDim2.new(0.5, 0, 0.5, -50),
                ["anchor_point"] = Vector2.new(0.5, 1)
            },
            {
                ["position"] = UDim2.new(0.5, -44, 0.5, -23),
                ["anchor_point"] = Vector2.new(1, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, 44, 0.5, -23),
                ["anchor_point"] = Vector2.new(0, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, -44, 0.5, 23),
                ["anchor_point"] = Vector2.new(1, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, 44, 0.5, 23),
                ["anchor_point"] = Vector2.new(0, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, 0, 0.5, 50),
                ["anchor_point"] = Vector2.new(0.5, 0)
            }
        }
    end
    if p75 == 7 then
        return {
            {
                ["position"] = UDim2.new(0.5, 0, 0.5, -50),
                ["anchor_point"] = Vector2.new(0.5, 1)
            },
            {
                ["position"] = UDim2.new(0.5, -44, 0.5, -23),
                ["anchor_point"] = Vector2.new(1, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, 44, 0.5, -23),
                ["anchor_point"] = Vector2.new(0, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, -44, 0.5, 23),
                ["anchor_point"] = Vector2.new(1, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, 44, 0.5, 23),
                ["anchor_point"] = Vector2.new(0, 0.5)
            },
            {
                ["position"] = UDim2.new(0.5, -5, 0.5, 50),
                ["anchor_point"] = Vector2.new(1, 0)
            },
            {
                ["position"] = UDim2.new(0.5, 5, 0.5, 50),
                ["anchor_point"] = Vector2.new(0, 0)
            }
        }
    end
    error(("No choice positioning data available for num_choices = %d"):format(p75))
end
function v16.call_on_selected_helper(p_u_76, p77, p78, p79, p80)
    v_u_22:Fire(p77)
    local v81 = p79 or {}
    local v82 = game.Players.LocalPlayer.Character
    if v82 then
        v82 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    end
    local v83
    if v82 then
        v83 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    else
        v83 = v82
    end
    if not v83 then
        return
    end
    local v84
    if typeof(p78) == "function" then
        v84 = p78
        for v85 = 1, 10 do
            p78 = p77:run(p78)
            if typeof(p78) == "table" then
                break
            end
            if typeof(p78) ~= "function" then
                return
            end
            local v86 = v85 ~= 10
            assert(v86, "Infinite recursion detected")
        end
    else
        v84 = p78
        p78 = nil
    end
    local v87 = p78 or v84
    if #v81 > 0 then
        local v88, v89, v90 = Color3.toHSV(v_u_6.lookup("saturated"))
        local v91 = {
            ["text"] = "Back",
            ["color"] = Color3.fromHSV(v88, v89 * 1.2, v90 * 0.88)
        }
        v87 = v_u_9.combine({ v91 }, v87)
    end
    if #v87 == 0 then
        return "no_choices"
    elseif not p_u_76.interact_db then
        p_u_76.interact_db = true
        p_u_76.instance.BasicSelects.Visible = false
        p_u_76.choice_start_time = tick()
        local v92 = get_choice_positioning(#v87)
        local v93 = Instance.new("Frame")
        v93.BackgroundTransparency = 1
        v93.Size = UDim2.new(1, 0, 1, 0)
        p_u_76.choice_continue = v_u_8.create_continue()
        p_u_76.choosing_interaction = p77
        p77:set_visibility_distance((v83 - p77.part.Position).magnitude + 20)
        local v94 = {}
        for v95, v_u_96 in pairs(v87) do
            local v97 = v_u_96.text
            local v98 = typeof(v97) == "string" and v_u_96.text or v_u_96.text()
            local v99 = v_u_21:Translate(workspace, v98)
            if v_u_18 == v_u_2.platform.desktop and not v_u_2.is_using_gamepad() then
                v99 = v99 .. " (" .. v95 .. ")"
            end
            local v_u_100 = p_u_76.choice_template:clone()
            v_u_100.Frame.TextContainer.TextLabel.Text = v99
            v_u_100.Frame.TextContainer.TextLabel.AutoLocalize = false
            local v_u_101 = v_u_96.image
            if v_u_101 then
                v_u_100.Frame.TextContainer.ImageLabel.Image = v_u_101
            else
                v_u_100.Frame.TextContainer.ImageLabel.Visible = false
            end
            v_u_100.Position = v92[v95].position
            v_u_100.AnchorPoint = v92[v95].anchor_point
            v_u_11.on_text_bounds({
                ["Instance"] = p_u_76.choice_template.Frame.TextContainer.TextLabel,
                ["Text"] = v99,
                ["ContainerWidth"] = p_u_76.instance.AbsoluteSize.X
            }, function(p102)
                local v103 = v_u_101 and 35 or 0
                v_u_100.Size = UDim2.new(0, p102.X + 30 + v103, v_u_100.Size.Y.Scale, v_u_100.Size.Y.Offset)
            end)
            v_u_100.Parent = v93
            if v_u_19 then
                v_u_100.Frame.Front.MouseButton1Down:connect(function()
                    local v104 = v_u_100
                    v104.ZIndex = 999
                    v104.UIScale.Scale = 1.1
                end)
                v_u_100.Frame.Front.MouseButton1Up:connect(function()
                    local v105 = v_u_100
                    v105.ZIndex = 1
                    v105.UIScale.Scale = 1
                end)
            else
                v_u_100.Frame.Front.MouseEnter:connect(function()
                    local v106 = v_u_100
                    v106.ZIndex = 999
                    v106.UIScale.Scale = 1.1
                end)
                v_u_100.Frame.Front.MouseLeave:connect(function()
                    local v107 = v_u_100
                    v107.ZIndex = 1
                    v107.UIScale.Scale = 1
                end)
            end
            v_u_100.Frame.Front[v_u_2.mouse_down_or_click()]:connect(function()
                p_u_76.choice_continue.continue(v_u_96)
            end)
            v_u_100.Frame.Front.ImageColor3 = Color3.new(1, 1, 1)
            v_u_100.Frame.Back.ImageColor3 = v_u_96.color or v_u_6.lookup("saturated")
            table.insert(v94, v_u_100)
        end
        if v_u_18 == v_u_2.platform.desktop then
            for v108, v_u_109 in pairs(v87) do
                v_u_14:BindAction("choice_key_" .. v108, function(_, p110)
                    if p110 == Enum.UserInputState.Begin then
                        p_u_76.choice_continue.continue(v_u_109)
                    end
                end, false, v_u_17[v108])
            end
        end
        if p77.part:GetRootPart() ~= v82:GetRootPart() then
            p80 = p80 or p77.part.Position
        end
        local v111 = p_u_76.UIManager.wrap(v93, "LuaBillboardGui"):start({
            ["container"] = p_u_76.instance.ChoiceSelects,
            ["studs_offset_world_space"] = p77.custom_menu_wheel_offset or p77.offset,
            ["studs_offset_relative_to_adornee_rotation"] = p77.offset_relative_to_part_rotation,
            ["adornee"] = p77.part,
            ["locked_position"] = p80
        })
        local v112 = nil
        for _, v113 in pairs(v94) do
            local v114 = v113.Position
            local v115 = v113.AnchorPoint
            local v116 = v113.Size
            v113.Position = UDim2.new(0.5, 0, 0.5, 0)
            v113.Size = UDim2.new(0, 36, 0, 36)
            v113.AnchorPoint = v115
            v112 = game:GetService("TweenService"):Create(v113, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["Position"] = v114,
                ["AnchorPoint"] = v115,
                ["Size"] = v116
            })
            v112:Play()
        end
        v112.Completed:wait()
        if p_u_76.signal_open then
            p_u_76.signal_open:Fire(v94[1].Frame.Front)
        end
        local v117 = p_u_76.choice_continue.yield()
        if p_u_76.signal_close then
            p_u_76.signal_close:Fire()
        end
        if v_u_18 == v_u_2.platform.desktop then
            for v118, _ in pairs(v87) do
                v_u_14:UnbindAction("choice_key_" .. v118)
            end
        end
        v111:destroy()
        p_u_76.instance.BasicSelects.Visible = true
        p_u_76.interact_db = false
        p_u_76.choice_continue = nil
        p_u_76.choosing_interaction = nil
        p77:clear_visibility_distance()
        p77:step()
        if v117 ~= nil then
            if v117.text ~= "Back" then
                table.insert(v81, v84)
                return p_u_76:call_on_selected_helper(p77, v117.on_selected, v81, p80)
            end
            local v119 = v81[#v81]
            table.remove(v81, #v81)
            return p_u_76:call_on_selected_helper(p77, v119, v81, p80)
        end
    end
end
function v16.call_on_selected(p120, p121, p122)
    local v123 = p120:call_on_selected_helper(p121, p122 or p121.on_selected, {})
    if p121.on_finished then
        p121.on_finished(p121)
    end
    return v123
end
function v16.cancel_choice(p124)
    if not p124.choice_continue then
        return false
    end
    if tick() - p124.choice_start_time >= 0.2 then
        p124.choice_continue.continue()
        return true
    end
end
function v16.refresh(p125, p126)
    local v127 = p125.UIManager.is_closed({
        "TradeHistoryApp",
        "TradeApp",
        "TradePreviewApp",
        "FocusPetApp",
        "MockFocusPetApp"
    })
    if not p126[p125.ClassName] then
        v127 = false
    end
    p125:set_visibility(v127)
end
function v16.start(p_u_128)
    p_u_128.instance.ClipToDeviceSafeArea = false
    p_u_128.basic_template = p_u_128.instance.BasicSelects.Template
    p_u_128.basic_template.Parent = nil
    p_u_128.choice_template = p_u_128.instance.ChoiceTemplate
    p_u_128.choice_template.Parent = nil
    p_u_128.interactions = v_u_7.new()
    coroutine.wrap(function()
        local v129 = v_u_18 == v_u_2.platform.phone and 0.2 or 0.05
        while true do
            p_u_128:closest_step()
            wait(v129)
        end
    end)()
    p_u_128.hovering = v_u_7.new()
    v_u_5:register_gui_callbacks({
        ["add_initial_gui"] = function(p_u_130, p131)
            local v_u_132 = p_u_128.basic_template:clone()
            local v133 = nil
            if p_u_130.anti_occlusion_mode_model then
                local v134 = p_u_130.offset or p_u_130.offset_relative_to_part_rotation
                assert(v134, "No offset supplied for anti-occlusion mode")
                local v135 = Instance.new("Highlight")
                v135.FillTransparency = 1
                v135.Parent = p_u_130.anti_occlusion_mode_model
                p_u_130.small_object_highlight = v135
                v133 = function(p136)
                    local v137 = workspace.CurrentCamera:WorldToViewportPoint(p_u_130.part.Position)
                    if v137.Z <= 0.1 then
                        v_u_132.ConnectorRotator.Visible = false
                        return
                    else
                        local v138 = Vector2.new(v137.X, v137.Y)
                        local v139 = Vector2.new(p136.X.Offset, p136.Y.Offset)
                        if v138.X ~= v139.X or v138.Y ~= v139.Y then
                            local v140 = v138 - v139
                            local v141 = v140.Magnitude
                            local v142 = v140 / v141
                            local v143 = v142.Y
                            local v144 = v142.X
                            local v145 = math.atan2(v143, v144)
                            local v146 = math.deg(v145) - 90
                            v_u_132.ConnectorRotator.Visible = true
                            v_u_132.ConnectorRotator.ConnectorLine.Size = UDim2.new(0, v_u_132.ConnectorRotator.ConnectorLine.Size.X.Offset, 0, v141 - 23)
                            v_u_132.ConnectorRotator.ConnectorLine.Position = UDim2.new(0, 0, 0, 23)
                            v_u_132.ConnectorRotator.Rotation = v146
                        end
                    end
                end
            else
                v_u_132.ConnectorRotator:Destroy()
            end
            p_u_130.gui = p_u_128.UIManager.wrap(v_u_132, "LuaBillboardGui"):start({
                ["screen_gui"] = p_u_128.instance,
                ["container"] = p_u_128.instance.BasicSelects,
                ["studs_offset_world_space"] = p_u_130.offset,
                ["studs_offset_relative_to_adornee_rotation"] = p_u_130.offset_relative_to_part_rotation,
                ["adornee"] = p_u_130.part,
                ["hidden"] = p131,
                ["on_render_stepped"] = v133
            })
            p_u_128.interactions:add(p_u_130)
            if v_u_19 or v_u_2.is_using_gamepad() then
                v_u_132.TapButton.MouseButton1Down:connect(function()
                    local v147 = p_u_130
                    local v148 = v147.text
                    local v149
                    if typeof(v148) == "function" then
                        v149 = v148()
                    else
                        v149 = v148
                    end
                    if v149 == nil then
                        v149 = nil
                    elseif typeof(v148) == "table" then
                        local v150 = v149.display_mode == "buy_with_icon"
                        assert(v150, "Invalid display mode for text table")
                    end
                    v_u_36(v149, false, v147.gui.instance.TapButton)
                    v_u_45(p_u_130)
                    p_u_130.gui:set_always_on_top_zindex(2)
                    p_u_130.mouse_down = true
                end)
                v_u_132.TapButton.MouseButton1Up:connect(function()
                    local v151 = p_u_130
                    local v152 = v151.text
                    local v153
                    if typeof(v152) == "function" then
                        v153 = v152()
                    else
                        v153 = v152
                    end
                    if v153 == nil then
                        v153 = nil
                    elseif typeof(v152) == "table" then
                        local v154 = v153.display_mode == "buy_with_icon"
                        assert(v154, "Invalid display mode for text table")
                    end
                    v_u_36(v153, true, v151.gui.instance.TapButton)
                    local v155 = p_u_130
                    v155.gui.instance.Message.default.Visible = false
                    v155.gui.instance.Message.buy_with_icon.Visible = false
                    p_u_130.gui:set_always_on_top_zindex(0)
                    p_u_130.mouse_down = false
                    p_u_128:closest_step()
                end)
            else
                v_u_132.TapButton.MouseEnter:connect(function()
                    p_u_128.hovering:add(p_u_130)
                    p_u_128:refresh_hover_states()
                end)
                v_u_132.TapButton.MouseLeave:connect(function()
                    p_u_128.hovering:remove(p_u_130)
                    p_u_128:refresh_hover_states()
                end)
            end
            v_u_132.TapButton[v_u_2.mouse_down_or_click()]:connect(function()
                p_u_128:call_on_selected(p_u_130)
            end)
            if p_u_130.on_interaction_shown then
                p_u_130.on_interaction_shown(v_u_132)
            end
            local v156 = p_u_130.text
            local v157
            if typeof(v156) == "function" then
                v157 = v156()
            else
                v157 = v156
            end
            if v157 == nil then
                v157 = nil
            elseif typeof(v156) == "table" then
                local v158 = v157.display_mode == "buy_with_icon"
                assert(v158, "Invalid display mode for text table")
            end
            v_u_36(v157, true, p_u_130.gui.instance.TapButton)
            p_u_130.gui.instance.Message.default.Visible = false
            p_u_130.gui.instance.Message.buy_with_icon.Visible = false
            p_u_128:closest_step()
        end,
        ["delete_gui"] = function(p159)
            if p159.gui then
                p159.gui:destroy()
                p159.gui = nil
                p_u_128.interactions:remove(p159)
                p_u_128.hovering:remove(p159)
                if p159.small_object_highlight then
                    p159.small_object_highlight:Destroy()
                    p159.small_object_highlight = nil
                end
                if p_u_128.choosing_interaction == p159 then
                    p_u_128.choice_continue.continue()
                end
            end
        end,
        ["set_hidden"] = function(p160, p161)
            if p160.gui then
                p160.gui:set_hidden(p161)
            end
        end
    })
    v_u_12.register(5, function()
        return p_u_128:cancel_choice() and "sink" or "pass"
    end)
    v_u_14:BindAction("e_select", function(_, p162, _)
        if p162 == Enum.UserInputState.Begin then
            if p_u_128:cancel_choice() then
                return
            else
                local v163 = v_u_5:get_closest_interaction()
                if v163 ~= nil then
                    p_u_128:call_on_selected(v163)
                end
            end
        else
            return
        end
    end, false, Enum.KeyCode.E, Enum.KeyCode.ButtonX)
    p_u_128.signal_open = v_u_10.new()
    p_u_128.signal_close = v_u_10.new()
    v_u_3.watch({
        ["selection_parent"] = p_u_128.instance.ChoiceSelects,
        ["signal_open"] = p_u_128.signal_open,
        ["signal_close"] = p_u_128.signal_close,
        ["setup_button_actions"] = function()
            game:GetService("ContextActionService"):BindAction(p_u_128.ClassName .. "Close", function(_, p164)
                if p164 == Enum.UserInputState.Begin then
                    p_u_128:cancel_choice()
                end
            end, false, Enum.KeyCode.ButtonB)
        end,
        ["teardown_button_actions"] = function()
            game:GetService("ContextActionService"):UnbindAction(p_u_128.ClassName .. "Close")
        end
    })
end
return v16