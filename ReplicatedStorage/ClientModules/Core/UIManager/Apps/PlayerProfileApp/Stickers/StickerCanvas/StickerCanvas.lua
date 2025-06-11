--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerProfileApp.Stickers.StickerCanvas (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Maid")
local v3 = v1("Class")
local v_u_4 = v1("Number")
local v_u_5 = v1("Signal")
local v_u_6 = v1("PlatformM")
local v_u_7 = v1("XboxSupport")
local v_u_8 = v1("InventoryDB")
local v_u_9 = v1("TweenPromise")
local v_u_10 = v1("SharedConstants")
local v_u_11 = v1("package:Sift")
local v_u_12 = game:GetService("GuiService")
local v_u_13 = game:GetService("RunService")
local v_u_14 = game:GetService("UserInputService")
local v_u_15 = game:GetService("ContextActionService")
local v_u_16 = v_u_6.get_platform() == "phone" and true or v_u_6.get_platform() == "tablet"
local v_u_17 = {
    [Enum.KeyCode.DPadLeft] = Vector3.new(-1, 0, 0),
    [Enum.KeyCode.DPadRight] = Vector3.new(1, 0, 0),
    [Enum.KeyCode.DPadUp] = Vector3.new(0, 1, 0),
    [Enum.KeyCode.DPadDown] = Vector3.new(0, -1, 0)
}
local v18 = v3("StickerCanvas", v1("UIBaseElement"))
local function v_u_29(p_u_19, p20)
    local v_u_21 = p_u_19.Rotation % 360
    local v22 = 45 - v_u_21 % 90
    local v23 = math.rad(v22)
    local v24 = math.abs(v23)
    local v25 = math.cos(v24) * 2 / 1.4142135623730951
    if p20 then
        p_u_19.Controls.Size = UDim2.fromScale(v25, v25)
        p_u_19.Controls.Rotation = -v_u_21
    else
        local v26 = -v_u_21
        local v27 = p_u_19.Controls.Rotation - v26
        if math.abs(v27) > 180 then
            local v28 = p_u_19.Controls
            v28.Rotation = v28.Rotation - math.sign(v27) * 360
        end
        v_u_9.new(p_u_19.Controls, TweenInfo.new(0.3), {
            ["Size"] = UDim2.fromScale(v25, v25),
            ["Rotation"] = -v_u_21
        }):andThen(function()
            p_u_19.Controls.Rotation = -v_u_21
        end)
    end
end
function v18._scale(p_u_30, p_u_31, p32)
    p_u_30.scale_maid:DoCleaning()
    if p32 then
        p_u_30.scaling = true
        p_u_31.Controls.Delete.Visible = false
        p_u_31.Controls.Rotate.Visible = false
        local v_u_33 = p_u_31.AbsolutePosition + p_u_31.AbsoluteSize * p_u_31.AnchorPoint + Vector2.new(0, v_u_12:GetGuiInset().Y)
        local v34 = v_u_14:GetMouseLocation() - v_u_33
        local v_u_35 = v34.Magnitude
        local v_u_36 = v34.Unit
        local v37 = p_u_30.stickers[p_u_31].scale or p_u_31.Size.X.Offset / 80
        local v_u_38 = math.abs(v37)
        local v_u_39 = true
        local v_u_40 = v_u_38
        p_u_30.scale_maid:GiveTask(v_u_13.RenderStepped:Connect(function()
            local v41 = v_u_14:GetMouseLocation() - v_u_33
            local v42 = v_u_38 * (v41.Magnitude / v_u_35)
            v_u_40 = math.clamp(v42, 0.45, 1.75)
            local v43 = v_u_40 * 80
            p_u_31.Size = UDim2.fromOffset(v43, v43)
            if v_u_39 ~= (v_u_36:Dot(v41.Unit) >= 0) then
                v_u_39 = not v_u_39
                p_u_31:SetAttribute("Flipped", not p_u_31:GetAttribute("Flipped"))
            end
        end))
        p_u_30.scale_maid:GiveTask(function()
            if p_u_31:GetAttribute("Flipped") then
                v_u_40 = v_u_40 * -1
            end
            if v_u_40 == 1 then
                p_u_30.stickers[p_u_31].scale = nil
            else
                local v44 = p_u_30.stickers[p_u_31]
                local v45 = v_u_40 * 100
                v44.scale = math.round(v45) / 100
            end
        end)
        p_u_30.scale_maid:GiveTask(function()
            p_u_30.scaling = false
            p_u_31.Controls.Delete.Visible = true
            p_u_31.Controls.Rotate.Visible = true
            v_u_29(p_u_31)
        end)
    end
end
function v18._rotate(p_u_46, p_u_47, p48)
    p_u_46.rotate_maid:DoCleaning()
    if p48 then
        p_u_46.rotating = true
        p_u_47.Controls.Delete.Visible = false
        p_u_47.Controls.Scale.Visible = false
        local v_u_49 = p_u_47.AbsolutePosition + p_u_47.AbsoluteSize * p_u_47.AnchorPoint + Vector2.new(0, v_u_12:GetGuiInset().Y)
        local v_u_50 = p_u_46.stickers[p_u_47].rotation or p_u_47.Rotation
        local v51 = (v_u_14:GetMouseLocation() - v_u_49).Unit
        local v52 = v51.Y
        local v53 = v51.X
        local v54 = math.atan2(v52, v53) + 1.5707963267948966
        local v_u_55 = math.deg(v54)
        p_u_46.rotate_maid:GiveTask(v_u_13.RenderStepped:Connect(function()
            local v56 = (v_u_14:GetMouseLocation() - v_u_49).Unit
            local v57 = v56.Y
            local v58 = v56.X
            local v59 = math.atan2(v57, v58) + 1.5707963267948966
            local v60 = p_u_47
            local v61 = v_u_50 + (math.deg(v59) - v_u_55)
            v60.Rotation = math.round(v61) % 360
        end))
        p_u_46.rotate_maid:GiveTask(function()
            local v62 = p_u_47.Rotation * 1000
            local v63 = math.round(v62) / 1000
            if v63 == 0 then
                v63 = nil
            end
            p_u_46.stickers[p_u_47].rotation = v63
        end)
        p_u_46.rotate_maid:GiveTask(function()
            p_u_46.rotating = false
            p_u_47.Controls.Delete.Visible = true
            p_u_47.Controls.Scale.Visible = true
            v_u_29(p_u_47)
        end)
    end
end
function v18._move(p_u_64, p_u_65, p66)
    p_u_64.move_maid:DoCleaning()
    if p66 then
        p_u_64.moving = true
        p_u_65.Controls.Rotate.Visible = false
        p_u_65.Controls.Scale.Visible = false
        local v_u_67 = p_u_65.Position
        local v_u_68 = v_u_14:GetMouseLocation()
        p_u_64.move_maid:GiveTask(v_u_13.RenderStepped:Connect(function()
            if not p_u_64.is_touch_scaling then
                local v69 = v_u_14:GetMouseLocation() - v_u_68
                local v70 = UDim2.fromScale
                local v71 = v_u_67.X.Scale + v69.X / p_u_64.canvas.AbsoluteSize.X
                local v72 = math.clamp(v71, 0, 1)
                local v73 = v_u_67.Y.Scale + v69.Y / p_u_64.canvas.AbsoluteSize.Y
                p_u_65.Position = v70(v72, (math.clamp(v73, 0, 1)))
            end
        end))
        p_u_64.move_maid:GiveTask(function()
            local v74 = 1000 * p_u_65.Position.X.Scale
            local v75 = math.round(v74) / 1000
            local v76 = 1000 * p_u_65.Position.Y.Scale
            local v77 = { v75, math.round(v76) / 1000 }
            p_u_64.stickers[p_u_65].position = v77
        end)
        p_u_64.move_maid:GiveTask(function()
            p_u_64.moving = false
            p_u_65.Controls.Rotate.Visible = true
            p_u_65.Controls.Scale.Visible = true
            v_u_29(p_u_65)
        end)
    end
end
function v18._enable_controller_actions(p_u_78, p_u_79)
    local v80 = v_u_2.new()
    local v_u_81 = v_u_7.narrow_selection_parent(p_u_79)
    v_u_7.get_watch_from_parent(p_u_79.Controls.Move):select_object(p_u_79.Controls.Move)
    v80:GiveTask(function()
        v_u_15:UnbindAction("Sticker")
        v_u_81()
    end)
    v_u_15:BindAction("StickerDelete", function(_, p82)
        if p82 == Enum.UserInputState.Begin then
            p_u_78:remove(p_u_79)
        end
    end, false, Enum.KeyCode.ButtonX)
    v_u_15:BindAction("StickerFlip", function(_, p83)
        if p83 == Enum.UserInputState.Begin then
            p_u_79:SetAttribute("Flipped", not p_u_79:GetAttribute("Flipped"))
        end
    end, false, Enum.KeyCode.ButtonL3)
    v80:GiveTask(function()
        v_u_15:UnbindAction("StickerDelete")
        v_u_15:UnbindAction("StickerFlip")
    end)
    local v_u_84 = Vector3.new(0, 0, 0)
    v80:GiveTask(v_u_14.InputChanged:Connect(function(p85, p86)
        if p86 and p85.KeyCode == Enum.KeyCode.Thumbstick1 then
            if p85.Position.Magnitude > 0.3 then
                v_u_84 = p85.Position
                return
            end
            v_u_84 = nil
        end
    end))
    local v_u_87 = nil
    local function v94(p88, p89)
        if p89 and v_u_17[p88.KeyCode] ~= nil then
            local v90 = 0
            local v91 = Vector3.new(0, 0, 0)
            for v92, v93 in v_u_17 do
                if v_u_14:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, v92) then
                    v90 = v90 + 1
                    v91 = v91 + v93
                end
            end
            if v90 == 0 then
                v_u_87 = nil
                return
            elseif v90 == 1 then
                v_u_87 = v91
            else
                v_u_87 = v91.Unit
            end
        else
            return
        end
    end
    v80:GiveTask(v_u_14.InputBegan:Connect(v94))
    v80:GiveTask(v_u_14.InputEnded:Connect(v94))
    local v_u_95 = p_u_79.Size.Y.Offset
    v80:GiveTask(v_u_13.Stepped:Connect(function(_, p96)
        if v_u_12.SelectedObject == p_u_79.Controls.Move then
            p_u_78.moving = v_u_84 ~= nil
            local v97 = p_u_78
            local v98
            if v_u_87 == nil then
                v98 = false
            else
                v98 = v_u_87.X ~= 0
            end
            v97.rotating = v98
            local v99 = p_u_78
            local v100
            if v_u_87 == nil then
                v100 = false
            else
                v100 = v_u_87.Y ~= 0
            end
            v99.scaling = v100
            if p_u_78.moving then
                local v101 = v_u_84 * (30 * p96 / 80)
                local v102 = p_u_79
                local v103 = UDim2.fromScale
                local v104 = p_u_79.Position.X.Scale + v101.X
                local v105 = math.clamp(v104, 0, 1)
                local v106 = p_u_79.Position.Y.Scale - v101.Y
                v102.Position = v103(v105, (math.clamp(v106, 0, 1)))
            end
            if p_u_78.rotating then
                local v107 = p_u_79
                local v108 = p_u_79.Rotation
                local v109 = v_u_87.X
                v107.Rotation = (v108 + math.sign(v109) * 1.2 * 60 * p96) % 360
            end
            if p_u_78.scaling then
                local v110 = v_u_87.Y
                local v111 = (v_u_95 + math.sign(v110) * 50 * p96) / 80
                local v112 = math.clamp(v111, 0.45, 1.75) * 80
                p_u_79.Size = UDim2.fromOffset(v112, v112)
                v_u_95 = v112
            end
        end
    end))
    v80:GiveTask(function()
        if p_u_78.stickers[p_u_79] then
            p_u_78.stickers[p_u_79].position = { v_u_4.round(p_u_79.Position.X.Scale, 2), v_u_4.round(p_u_79.Position.Y.Scale, 2) }
            p_u_78.stickers[p_u_79].rotation = v_u_4.round(p_u_79.Rotation % 360, 2)
            local v113 = v_u_4.round(p_u_79.Size.Y.Offset / 80, 2)
            p_u_78.stickers[p_u_79].scale = v113 * (p_u_79:GetAttribute("Flipped") and -1 or 1)
            v_u_29(p_u_79)
            v_u_7.get_watch_from_parent(p_u_79.Controls.Move):select_object(p_u_79.Controls.Move)
            p_u_78.moving = false
            p_u_78.rotating = false
            p_u_78.scaling = false
        end
    end)
    return v80
end
function v18._enable_two_finger_actions(p_u_114, p_u_115)
    local v116 = v_u_2.new()
    local v_u_117 = nil
    local v118 = p_u_114.stickers[p_u_115].scale or p_u_115.Size.X.Offset / 80
    local v_u_119 = math.abs(v118)
    v116:GiveTask(v_u_14.TouchPinch:Connect(function(_, p120, _, p121, _)
        if p121 == Enum.UserInputState.Begin then
            p_u_114.is_touch_scaling = true
            p_u_114.scaling = true
            v_u_119 = v_u_117 or v_u_119
        elseif p121 == Enum.UserInputState.End then
            p_u_114.is_touch_scaling = false
            p_u_114.scaling = false
            return
        end
        local v122 = p120 * v_u_119
        v_u_117 = math.clamp(v122, 0.45, 1.75)
        local v123 = 80 * v_u_117
        p_u_115.Size = UDim2.fromOffset(v123, v123)
    end))
    local v_u_124 = p_u_115.Rotation
    v116:GiveTask(v_u_14.TouchRotate:Connect(function(_, p125, _, p126, _)
        if p126 == Enum.UserInputState.Begin then
            p_u_114.rotating = true
            v_u_124 = p_u_115.Rotation
        elseif p126 == Enum.UserInputState.End then
            p_u_114.rotating = false
            return
        end
        p_u_115.Rotation = (v_u_124 + math.deg(p125)) % 360
    end))
    v116:GiveTask(function()
        p_u_114.is_touch_scaling = false
        if p_u_114.stickers[p_u_115] then
            if v_u_117 then
                if p_u_115:GetAttribute("Flipped") then
                    v_u_117 = v_u_117 * -1
                end
                local v127 = p_u_114.stickers[p_u_115]
                local v128 = 1000 * v_u_117
                v127.scale = math.round(v128) / 1000
            end
            local v129 = p_u_114.stickers[p_u_115]
            local v130 = p_u_115.Rotation * 1000
            v129.rotation = math.round(v130) / 1000
            v_u_29(p_u_115)
            p_u_114.moving = false
            p_u_114.rotating = false
            p_u_114.scaling = false
        end
    end)
    return v116
end
function v18._setup_edit_buttons(p_u_131, p_u_132)
    local v133 = p_u_131.UIManager.wrap(p_u_132.Controls.Move, "UIDragger"):start()
    v133.drag_started:Connect(function()
        local v134 = p_u_131.enabled and not p_u_131.is_touch_scaling and not (p_u_131.rotating or p_u_131.scaling)
        if v134 then
            v134 = not p_u_131.moving
        end
        if v134 then
            if p_u_132 ~= p_u_131.active_sticker then
                p_u_131:activate_sticker(p_u_132)
            end
            p_u_131:_move(p_u_132, true)
        end
    end)
    v133.drag_ended:Connect(function()
        if p_u_131.enabled and p_u_132 == p_u_131.active_sticker then
            p_u_131:_move(p_u_132, false)
        end
    end)
    p_u_131.move_draggers[p_u_132] = v133
    p_u_132.Controls.Move.MouseButton1Click:Connect(function()
        if v_u_6.is_using_gamepad() then
            if p_u_132 == p_u_131.active_sticker then
                p_u_131:activate_sticker(nil)
            else
                p_u_131:activate_sticker(p_u_132)
            end
        else
            return
        end
    end)
    local v135 = p_u_131.UIManager.wrap(p_u_132.Controls.Rotate, "UIDragger"):start()
    v135.drag_started:Connect(function()
        local v136 = p_u_131.enabled and not p_u_131.is_touch_scaling and not (p_u_131.rotating or p_u_131.scaling)
        if v136 then
            v136 = not p_u_131.moving
        end
        if v136 then
            p_u_131:_rotate(p_u_132, true)
        end
    end)
    v135.drag_ended:Connect(function()
        p_u_131:_rotate(p_u_132, false)
    end)
    local v137 = p_u_131.UIManager.wrap(p_u_132.Controls.Scale, "UIDragger"):start()
    v137.drag_started:Connect(function()
        local v138 = p_u_131.enabled and not p_u_131.is_touch_scaling and not (p_u_131.rotating or p_u_131.scaling)
        if v138 then
            v138 = not p_u_131.moving
        end
        if v138 then
            p_u_131:_scale(p_u_132, true)
        end
    end)
    v137.drag_ended:Connect(function()
        p_u_131:_scale(p_u_132, false)
    end)
    p_u_131.UIManager.wrap(p_u_132.Controls.Delete, "IconButton"):start({
        ["mouse_button1_click"] = function()
            local v139 = p_u_131.enabled and not p_u_131.is_touch_scaling and not (p_u_131.rotating or p_u_131.scaling)
            if v139 then
                v139 = not p_u_131.moving
            end
            if v139 then
                p_u_131:remove(p_u_132)
            end
        end
    })
end
function v18.apply(p_u_140)
    local v141 = p_u_140.active_sticker
    if v141 then
        p_u_140.active_sticker_maid:DoCleaning()
        local v142 = p_u_140.stickers[v141]
        if v142 then
            local v145 = v_u_11.List.sort(v_u_11.Dictionary.keys(p_u_140.stickers), function(p143, p144)
                return p143.ZIndex < p144.ZIndex
            end)
            p_u_140.sticker_pages[p_u_140.page] = v_u_11.List.map(v145, function(p146)
                return p_u_140.stickers[p146]
            end)
            v142.last_edit = DateTime.now().UnixTimestamp
            p_u_140.applied_signal:Fire(v142, p_u_140.page)
        end
    else
        return
    end
end
function v18.activate_sticker(p_u_147, p_u_148)
    if p_u_147.is_touch_scaling or not p_u_147.enabled then
        return
    elseif p_u_148 == p_u_147.active_sticker then
        return
    else
        p_u_147:apply()
        if p_u_148 ~= nil then
            local v149 = p_u_147.stickers[p_u_148]
            assert(v149, "Invalid sticker, cannot be activated")
            v_u_29(p_u_148, true)
            p_u_148.Controls.Delete.Visible = true
            p_u_148.Controls.Rotate.Visible = not v_u_6.is_using_gamepad()
            p_u_148.Controls.Scale.Visible = not v_u_6.is_using_gamepad()
            p_u_148.Controls.Border.Visible = true
            p_u_148.ZIndex = p_u_147.highest_layer
            p_u_147.highest_layer = p_u_147.highest_layer + 1
            p_u_147.canvas.ZIndex = 4
            p_u_147.active_sticker = p_u_148
            p_u_148.Parent = p_u_147.canvas
            p_u_147.active_signal:Fire(p_u_148)
            if v_u_16 then
                p_u_147.active_sticker_maid:GiveTask(p_u_147:_enable_two_finger_actions(p_u_148))
            end
            if v_u_6.is_using_gamepad() then
                p_u_147.active_sticker_maid:GiveTask(p_u_147:_enable_controller_actions(p_u_148))
            end
            p_u_147.active_sticker_maid:GiveTask(p_u_147.rotate_maid)
            p_u_147.active_sticker_maid:GiveTask(p_u_147.move_maid)
            p_u_147.active_sticker_maid:GiveTask(p_u_147.scale_maid)
            p_u_147.active_sticker_maid:GiveTask(function()
                p_u_147.active_sticker = nil
                p_u_147.active_signal:Fire(nil)
                p_u_147.canvas.ZIndex = 2
                if p_u_148 and p_u_148.Parent then
                    p_u_148.Parent = p_u_147.applied_canvas
                    p_u_148.Controls.Delete.Visible = false
                    p_u_148.Controls.Rotate.Visible = false
                    p_u_148.Controls.Scale.Visible = false
                    p_u_148.Controls.Border.Visible = false
                end
            end)
        end
    end
end
function v18.add(p150, p151, p152, p153, p154)
    local v_u_155 = v_u_8.stickers[p152]
    if v_u_155 then
        if v_u_11.Dictionary.count(p150.stickers) < v_u_10.player_profiles.sticker_page_limit then
            local v156 = p154 or {}
            local v_u_157 = p150.sticker_template:Clone()
            v_u_157.Name = p152
            p150.UIManager.wrap(v_u_157.Sticker, "ItemImage"):start({
                ["entry"] = v_u_155,
                ["use_instance"] = p150
            })
            v_u_157:GetAttributeChangedSignal("Flipped"):Connect(function()
                local v158 = v_u_157:GetAttribute("Flipped")
                v_u_157.Sticker:SetAttribute("Flipped", v158)
                if v_u_155.animated and v_u_155.flipbook_properties.sprite_sheets then
                    return
                elseif v158 then
                    v_u_157.Sticker.ImageRectOffset = Vector2.new(150, 0)
                    v_u_157.Sticker.ImageRectSize = Vector2.new(-150, 150)
                else
                    v_u_157.Sticker.ImageRectOffset = Vector2.new(0, 0)
                    v_u_157.Sticker.ImageRectSize = Vector2.new(0, 0)
                end
            end)
            local v159 = {
                ["kind"] = p152,
                ["unique"] = p151
            }
            if p153 then
                if p153.position then
                    local v160 = p153.position
                    local v161 = p153.position[1]
                    v160[1] = math.clamp(v161, 0, 1)
                    local v162 = p153.position
                    local v163 = p153.position[2]
                    v162[2] = math.clamp(v163, 0, 1)
                    v_u_157.Position = UDim2.fromScale(p153.position[1], p153.position[2])
                    v159.position = p153.position
                end
                if p153.scale then
                    local v164 = p153.scale
                    if v164 < 0 then
                        v_u_157:SetAttribute("Flipped", true)
                    end
                    local v165 = 80 * v164
                    v_u_157.Size = UDim2.fromOffset(v165, v165)
                    v159.scale = v164
                end
                if p153.rotation then
                    v_u_157.Rotation = p153.rotation % 360
                    v159.rotation = p153.rotation
                end
            end
            p150.stickers[v_u_157] = v159
            p150:_setup_edit_buttons(v_u_157)
            v_u_157.Controls.Move.Visible = p150.enabled and true or false
            if not v156.skip_activation then
                v_u_157.Parent = p150.canvas
                p150:activate_sticker(v_u_157)
                return v_u_157, v159
            end
            v_u_157.ZIndex = p150.highest_layer
            p150.highest_layer = p150.highest_layer + 1
            v_u_157.Controls.Delete.Visible = false
            v_u_157.Controls.Rotate.Visible = false
            v_u_157.Controls.Scale.Visible = false
            v_u_157.Controls.Border.Visible = false
            v_u_157.Parent = p150.applied_canvas
            return v_u_157, v159
        end
        p150.UIManager.apps.DialogApp:dialog({
            ["text"] = "You have reached the sticker limit!",
            ["button"] = "Okay"
        })
    end
end
function v18.remove(p166, p167, p168)
    if not p168 then
        if p166.awaiting_delete_confirmation then
            return false
        end
        p166.awaiting_delete_confirmation = true
        local v169 = p166.UIManager.apps.DialogApp:dialog({
            ["text"] = "Remove sticker?",
            ["left"] = "No",
            ["right"] = "Yes"
        })
        p166.awaiting_delete_confirmation = false
        if v169 ~= "Yes" then
            return false
        end
    end
    local v170 = p166.stickers[p167]
    if v170 then
        v170 = p166.stickers[p167].unique
    end
    p166.stickers[p167] = nil
    p167:Destroy()
    for v171, v172 in p166.sticker_pages[p166.page] do
        if v172.unique == v170 then
            p166.sticker_pages[p166.page][v171] = nil
        end
    end
    p166.removed_signal:Fire(v170, p167.Name, p166.page)
    p166:apply()
    return true
end
function v18.remove_by_unique(p173, p174)
    for v175, v176 in p173.stickers do
        if v176.unique == p174 then
            return p173:remove(v175, true)
        end
    end
    return false
end
function v18.set_enabled(p177, p178)
    if p177.enabled ~= p178 then
        p177.enabled = p178
        p177.input_blocker.Visible = p178
        for v179, _ in p177.stickers do
            v179.Controls.Move.Visible = p178
        end
        if not p178 then
            p177:apply()
        end
    end
end
function v18.get_active_signal(p180)
    return p180.active_signal
end
function v18.get_applied_signal(p181)
    return p181.applied_signal
end
function v18.get_removed_signal(p182)
    return p182.removed_signal
end
function v18.get_active_sticker(p183)
    return p183.active_sticker
end
function v18.load_page(p184, p185)
    p184:apply()
    local v186 = p184.page_count
    p184.page = math.clamp(p185, 1, v186)
    for v187, _ in p184.stickers do
        v187:Destroy()
        if p184.move_draggers[v187] then
            p184.move_draggers[v187]:destroy()
        end
    end
    p184.stickers = {}
    p184.move_draggers = {}
    local v188 = {
        ["skip_activation"] = true
    }
    for _, v189 in p184.sticker_pages[p185] or {} do
        p184:add(v189.unique, v189.kind, v189, v188)
    end
end
function v18.load_sticker_data(p190, p191)
    local v192 = {}
    for v193, v194 in p191 or {} do
        v192[v193] = v_u_11.List.sort(v_u_11.Dictionary.values(v194), function(p195, p196)
            return (p195.last_edit or 0) < (p196.last_edit or 0)
        end)
    end
    p190.sticker_pages = v192
    p190:load_page(p190.page or 1)
end
function v18.start(p_u_197, p198)
    p_u_197.page_count = (p198 or {}).page_count or 1
    p_u_197.active_signal = v_u_5.new()
    p_u_197.applied_signal = v_u_5.new()
    p_u_197.removed_signal = v_u_5.new()
    p_u_197.canvas = p_u_197.instance
    p_u_197.canvas.Active = false
    p_u_197.highest_layer = 1
    p_u_197.move_draggers = {}
    p_u_197.is_touch_scaling = false
    p_u_197.input_blocker = p_u_197.canvas.InputBlocker
    local v_u_199 = p_u_197.UIManager.wrap(p_u_197.input_blocker, "UIDragger"):start({
        ["mouse_button1_click"] = function()
            if p_u_197.active_sticker then
                if not p_u_197.is_touch_scaling then
                    p_u_197:apply()
                end
            else
                return
            end
        end
    })
    local v_u_200 = nil
    local v_u_201 = nil
    v_u_199.drag_started:Connect(function()
        v_u_200 = v_u_14:GetMouseLocation()
    end)
    v_u_199.drag_changed:Connect(function(_, p202)
        if p_u_197.active_sticker and (v_u_200 - v_u_14:GetMouseLocation()).Magnitude >= 5 then
            v_u_201 = true
            v_u_199:force_end_drag(p202)
            local v203 = p_u_197.move_draggers[p_u_197.active_sticker]
            if v203 then
                v203:force_start_drag(p202)
            end
        end
    end)
    v_u_199.drag_ended:Connect(function()
        if p_u_197.active_sticker then
            if not v_u_201 then
                p_u_197:apply()
            end
            v_u_201 = nil
            v_u_200 = nil
        end
    end)
    v_u_6.get_gamepad_changed():Connect(function()
        p_u_197:apply()
    end)
    p_u_197.applied_canvas = Instance.new("CanvasGroup")
    p_u_197.applied_canvas.Size = UDim2.fromScale(1, 1)
    p_u_197.applied_canvas.BackgroundTransparency = 1
    p_u_197.applied_canvas.BorderSizePixel = 0
    p_u_197.applied_canvas.Parent = p_u_197.canvas
    p_u_197.stickers = {}
    p_u_197.sticker_pages = {}
    p_u_197.active_sticker = nil
    p_u_197.active_sticker_maid = v_u_2.new()
    p_u_197.scale_maid = v_u_2.new()
    p_u_197.rotate_maid = v_u_2.new()
    p_u_197.move_maid = v_u_2.new()
    p_u_197.sticker_template = p_u_197.canvas.StickerTemplate
    p_u_197.sticker_template.Parent = nil
    p_u_197:load_page(1)
    return p_u_197
end
return v18