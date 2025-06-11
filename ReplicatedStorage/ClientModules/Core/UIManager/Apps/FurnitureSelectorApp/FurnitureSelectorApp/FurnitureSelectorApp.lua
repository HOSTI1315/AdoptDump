--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FurnitureSelectorApp.FurnitureSelectorApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("DepreciationCalculator")
local v_u_3 = v1("HoverImageButtonSlider")
local v_u_4 = v1("CameraInputDisabler")
local v_u_5 = v1("FurniturePlaneLock")
local v_u_6 = v1("InteractionsEngine")
local v_u_7 = v1("FurnitureRegistry")
local v_u_8 = v1("HoverImageButton")
local v_u_9 = v1("FurnitureHistory")
local v10 = v1("SharedConstants")
local v_u_11 = v1("FurniturePlacer")
local v_u_12 = v1("FurnitureBounds")
local v_u_13 = v1("FurnitureColors")
local v_u_14 = v1("FurnitureUseDB")
local v_u_15 = v1("SettingsHelper")
local v_u_16 = v1("FurnitureXRay")
local v_u_17 = v1("RouterClient")
local v_u_18 = v1("ClientStore")
local v_u_19 = v1("FurnitureDB")
local v_u_20 = v1("HouseClient")
local v_u_21 = v1("PlatformM")
local v_u_22 = v1("Number")
local v_u_23 = v1("Signal")
local v24 = v1("Class")
local v_u_25 = v1("FurnitureEditorTelemetry")
local v_u_26 = game:GetService("Players")
local v_u_27 = game:GetService("RunService")
local v_u_28 = v1("package:Sift")
local v_u_29 = v1("package:Promise")
local v_u_30 = {
    ["multi_color_enabled"] = false,
    ["non_colorable_furniture_enabled"] = false
}
local v_u_31 = {
    ["multi_color_enabled"] = true,
    ["non_colorable_furniture_enabled"] = true
}
local v_u_32 = v10.housing_editor.minimum_furniture_scale
local v_u_33 = v10.housing_editor.maximum_furniture_scale
local v_u_34 = {
    ["move"] = { 0.1, 0.4, 1 },
    ["rotation"] = { 15, 15, 15 },
    ["scale"] = { 0.01, 0.05, 0.1 },
    ["handle_move"] = { 0.001, 0.1, 1 },
    ["handle_rotation"] = { 1, 15, 45 }
}
local v_u_35 = {
    ["small"] = 1,
    ["medium"] = 2,
    ["large"] = 3
}
local v_u_36 = v_u_28.Dictionary.flip(v_u_35)
local function v_u_37() end
local v38 = v24("FurnitureSelectorApp", v1("UIBaseApp"))
local function v_u_43(p39)
    local v40 = {}
    for v41, v42 in p39 do
        v40[v41] = v42:ToHex()
    end
    return table.concat(v40, "_")
end
local function v_u_50(p44)
    local v45 = 0
    local v46 = {}
    local v47 = false
    for _, v48 in p44 do
        local v49 = v_u_19[v48.data.id]
        v47 = not (v49 and v49.can_color) and true or v47
        if v48.model:FindFirstChild("Colorable", true) then
            v45 = v45 + 1
        end
        v46[v48.data.id] = true
    end
    return #v_u_28.Dictionary.keys(v46) == 1, v45 == #p44, v47
end
local function v_u_57(p51, p52)
    for _, v53 in p52 do
        if #v_u_13.get_default_colors(v53.model) == 0 then
            return false
        end
    end
    local v54, v55, v56 = v_u_50(p52)
    if v56 then
        return false
    elseif p51.color_config.non_colorable_furniture_enabled then
        return v54 or v55
    else
        return v55
    end
end
local function v_u_66(p58)
    local v59 = v_u_20.get_current_house_owner()
    local v60 = 0
    local v61 = 0
    local v62 = 0
    for _, v63 in p58 do
        local v64 = v_u_19[v63.data.id]
        if v64.cost then
            local v65 = v_u_2.calculate_furniture_depreciation(v59, v63.data)
            if v_u_2.was_furniture_created_this_session(v59, v63.data) then
                v60 = v60 + 1
            end
            v61 = v61 + v65
            v62 = v62 + v64.cost
        end
    end
    return v61, v61 == v62, v60 == #p58
end
local function v_u_73(p67, p68)
    for _, v69 in p67:GetChildren() do
        for v70, v72 in p68 do
            if v72 == v_u_28.None or not v72 then
                local v72 = nil
            end
            v69[v70] = v72
        end
    end
end
local function v_u_91(p74, p75, p_u_76, p77, p78)
    local v79, v80 = v_u_12.get_furniture_selection_cframe_size(p75, true, p_u_76)
    local v_u_81 = v_u_12.create_selection_box(p74, v79, v80, p77, p78)
    return v_u_29.new(function(_, _, p82)
        local v_u_83 = {}
        local v_u_84 = {}
        for _, v85 in p_u_76 do
            for _, v86 in ipairs(v85:GetDescendants()) do
                if v86:IsA("BasePart") then
                    if v86:GetAttribute("IsAnimated") ~= true then
                        v_u_84[v86] = v86.Anchored
                        v86.Anchored = true
                    end
                    v_u_83[v86] = v86.CanCollide
                    v86.CanCollide = false
                end
            end
        end
        p82(function()
            v_u_81:Destroy()
            for v87, v88 in pairs(v_u_84) do
                v87.Anchored = v88
            end
            for v89, v90 in pairs(v_u_83) do
                v89.CanCollide = v90
            end
        end)
    end), v_u_81
end
function v38._make_waypoint(p_u_92)
    p_u_92.history:waypoint(v_u_26.LocalPlayer, "mutate", function(p93)
        for _, v94 in p_u_92.selected_furnitures do
            p93(v94.data.unique, v94.data)
        end
    end)
end
function v38._mark_mutated(p95)
    for _, v96 in p95.selected_furnitures do
        v96.data.mutated = true
    end
end
function v38._get_selected_furniture_from_model(p97, p98)
    local v99 = p98:GetAttribute("furniture_unique")
    if v99 then
        v99 = p97.selected_furnitures_unique_to_index[v99]
    end
    if v99 then
        v99 = p97.selected_furnitures[v99]
    end
    return v99
end
function v38._select_primary_furniture(p100, p101)
    p100.selected_primary_promise:cancel()
    p100.selected_primary_furniture = p101
    p100.selected_primary_furniture_bounds = nil
    if p101 then
        local v102, v103 = v_u_91(p101.model, p101.model.PlacementBlock.CFrame, { p101.model }, Color3.fromRGB(163, 162, 165), #p100.selected_furnitures >= 2 and 0.025 or 0)
        p100.instance.Adornee = p101.model.PlacementBlock
        v_u_73(p100.move_handles, {
            ["Adornee"] = v103
        })
        v_u_73(p100.rotate_handles, {
            ["Adornee"] = v103
        })
        p100.selected_primary_furniture_bounds = v103
        p100.selected_primary_promise = v102
    else
        p100.instance.Adornee = nil
        v_u_73(p100.move_handles, {
            ["Adornee"] = v_u_28.None
        })
        v_u_73(p100.rotate_handles, {
            ["Adornee"] = v_u_28.None
        })
    end
end
function v38._select_multiple_furnitures(p104, p105)
    p104:_select_primary_furniture(nil)
    p104.selected_furnitures_promise:cancel()
    if #p105 == 0 then
        p104.UIManager.set_app_visibility(p104.ClassName, false)
        p104.instance.Container.Info.Text = ""
        p104.selected_furnitures = {}
        p104.selected_furnitures_changed:Fire()
        v_u_6:refresh()
        return
    end
    p104.UIManager.set_app_visibility(p104.ClassName, true)
    local v106 = {}
    for _, v107 in p105 do
        local v108 = v107.model
        table.insert(v106, v108)
    end
    p104.selected_furnitures = p105
    p104.selected_furnitures_promise = v_u_91(v106[1], v106[1].PlacementBlock.CFrame, v106, Color3.fromRGB(0, 255, 255), 0.05)
    p104:_select_primary_furniture(p105[1])
    p104.buttons.Paint:set_enabled((v_u_57(p104, p105)))
    local v109 = p104.buttons.Trash
    local v110
    if v_u_20.get_current_house_owner() == v_u_26.LocalPlayer then
        v110 = true
        ::l8::
        v109:set_enabled(v110)
        local v111 = p104.buttons.Scale
        for _, v112 in p105 do
            if v112.model:GetAttribute("DisableScaling") then
                v113 = false
                ::l16::
                v111:set_enabled(v113)
                p104.selected_furnitures_changed:Fire()
                return
            end
        end
        local v113 = true
        goto l16
    else
        for _, v114 in p105 do
            if not v114.data.guest_built then
                v110 = false
                goto l8
            end
        end
        v110 = true
        goto l8
    end
end
function v38._anchor_billboard_promise(p_u_115)
    return v_u_29.new(function(_, _, p116)
        local v_u_117 = p_u_115.instance.Adornee
        local v_u_118 = v_u_117.CFrame:PointToWorldSpace(p_u_115.instance.StudsOffsetWorldSpace)
        local v_u_120 = v_u_27.RenderStepped:Connect(function()
            local v119 = v_u_117.CFrame:PointToObjectSpace(v_u_118)
            p_u_115.instance.StudsOffsetWorldSpace = v119
        end)
        p116(function()
            v_u_120:Disconnect()
            p_u_115.instance.StudsOffsetWorldSpace = Vector3.new(0, 0.5, 0)
        end)
    end)
end
function v38._set_info_text_on_hover(p_u_121, p_u_122, p_u_123)
    v_u_21.run({
        ["desktop"] = function()
            p_u_122.MouseEnter:Connect(function()
                p_u_121.previous_hover_button = p_u_122
                p_u_121.instance.Container.Info.Text = p_u_123()
            end)
            p_u_122.MouseLeave:Connect(function()
                if p_u_121.previous_hover_button == p_u_122 then
                    p_u_121.instance.Container.Info.Text = ""
                end
            end)
        end,
        ["phone"] = function()
            p_u_122.MouseButton1Down:connect(function()
                p_u_121.previous_hover_button = p_u_122
                p_u_121.instance.Container.Info.Text = p_u_123()
            end)
        end,
        ["console"] = "desktop",
        ["tablet"] = "phone"
    })
end
function v38._create_pages(p124, p_u_125, p126)
    local v127 = v_u_21.is_using_gamepad()
    local v128 = {}
    local v_u_129 = {}
    for v130, v131 in p126 do
        local v132 = v130 % #p126 + 1
        local v133 = p124.page_template:Clone()
        v133.Visible = v130 == 1
        v133.Name = "Page" .. v130
        v133.Parent = p_u_125
        for v134, v135 in v131 do
            if v135 ~= "EMPTY" then
                local v136 = (v134 - 1) % 3 + 1 - 1
                local v137 = v134 / 3
                local v138 = math.ceil(v137) - 1
                local v139 = p124.tool_icons:FindFirstChild(v135):Clone()
                v139.Position = UDim2.fromOffset(v136 * 70, v138 * 70)
                v139.Parent = v133
                local v_u_140 = v139:FindFirstChild("GuideArrows")
                if v_u_140 then
                    v_u_140 = v_u_140:FindFirstChild("LeftStickIcon")
                end
                if v_u_140 then
                    v_u_140.Visible = v127
                end
                v_u_21.get_gamepad_changed():Connect(function(p141)
                    if v_u_140 then
                        v_u_140.Visible = p141
                    end
                end)
                for _, v142 in v139:GetChildren() do
                    if v142.Name ~= "Button" then
                        v142.Visible = false
                    end
                end
                if v135 == "Page" then
                    v139.Name = "ToPage" .. v132
                end
                local v143 = v139.Button:GetAttribute("ShouldHideMouse")
                local v144 = v_u_8.new(v139.Button, p124.instance, v143)
                v128[v135] = v144
                if v135 == "Page" then
                    v_u_129[v144] = v132
                end
            end
        end
    end
    for v145, v_u_146 in v_u_129 do
        local v_u_147 = v_u_146 % #p126 + 1
        p124:_set_info_text_on_hover(v145, function()
            return "Go to page " .. v_u_146
        end)
        v145.MouseButton1Down:Connect(function()
            for _, v148 in v_u_129 do
                p_u_125:FindFirstChild("Page" .. v148).Visible = false
            end
            p_u_125:FindFirstChild("Page" .. v_u_146).Visible = true
            p_u_125.Info.Text = "Go to page " .. v_u_147
        end)
    end
    return v128
end
function v38._get_all_page_children(p149)
    local v150 = {}
    for _, v151 in p149.instance.Container:GetChildren() do
        for _, v152 in v151:GetChildren() do
            table.insert(v150, v152)
        end
    end
    return v150
end
function v38._focus_on_buttons(p_u_153, p_u_154)
    local v_u_155 = {}
    return v_u_29.new(function(_, _, p156)
        for _, v157 in p_u_153:_get_all_page_children() do
            v_u_155[v157] = v157.Visible
            v157.Visible = p_u_154[v157.Name] and true or false
            if p_u_154[v157.Name] then
                for _, v158 in v157:GetChildren() do
                    v_u_155[v158] = v158.Visible
                    v158.Visible = p_u_154[v157.Name][v158.Name] and true or false
                end
            end
        end
        p156(function()
            for v159, v160 in v_u_155 do
                v159.Visible = v160
            end
        end)
    end)
end
function v38._get_non_primary_selected_furniture(p_u_161)
    return v_u_28.List.filter(p_u_161.selected_furnitures, function(p162)
        return p162 ~= p_u_161.selected_primary_furniture
    end)
end
function v38._init_move(p_u_163)
    p_u_163:_set_info_text_on_hover(p_u_163.buttons.Move, function()
        return v_u_21.is_using_gamepad() and "Hold RT and drag to move" or "Hold and drag to move"
    end)
    local v_u_164 = v_u_29.resolve()
    local v_u_165 = v_u_29.resolve()
    p_u_163.buttons.Move.MouseButton1Down:Connect(function()
        v_u_4.set_camera_input_enabled_mobile("dragging", false)
        local v166, v167 = p_u_163.plane_lock_component:get_plane()
        if v166 and v167 then
            local v168 = {
                ["Move"] = {
                    ["Button"] = true,
                    ["HeightLockMoveHint"] = true
                }
            }
            v_u_165 = p_u_163:_focus_on_buttons(v168)
        else
            local v169 = {
                ["Move"] = {
                    ["Button"] = true,
                    ["HeightLockMoveHint"] = false
                }
            }
            v_u_165 = p_u_163:_focus_on_buttons(v169)
        end
    end)
    p_u_163.buttons.Move.MouseButton1Up:Connect(function()
        v_u_4.set_camera_input_enabled_mobile("dragging", true)
        v_u_164:cancel()
        v_u_165:cancel()
    end)
    p_u_163.buttons.Move.MouseButton1Down:connect(function()
        local v_u_170 = nil
        local v_u_171 = p_u_163:get_placement_grid_size("move")
        local v_u_172, v173 = p_u_163.plane_lock_component:get_plane()
        if v_u_172 then
            v_u_172 = v173 and {
                ["origin"] = v_u_172,
                ["normal"] = v173,
                ["allow_placement_below"] = true
            } or v173
        end
        local v_u_175 = v_u_28.List.map(p_u_163:_get_non_primary_selected_furniture(), function(p174)
            return p174.model
        end)
        local v_u_178 = v_u_11.get_cframe_furniture_callback({
            ["primary_furniture_model"] = p_u_163.selected_primary_furniture.model,
            ["other_furniture_models"] = v_u_175,
            ["post_cframe_set_callback"] = function(p176, p177)
                p_u_163:_get_selected_furniture_from_model(p176).data.cframe = p177
                v_u_16.update_xray(p176)
            end
        })
        v_u_164 = v_u_29.new(function(_, _, p179)
            local v_u_180 = v_u_27.RenderStepped:Connect(function()
                v_u_170 = v_u_11.calculate_placement_from_mouse({
                    ["house"] = workspace.HouseInteriors.blueprint:GetChildren()[1],
                    ["furniture"] = p_u_163.selected_primary_furniture.model,
                    ["ignore_furniture_models"] = v_u_175,
                    ["interval"] = v_u_171,
                    ["rotation"] = p_u_163.selected_primary_furniture.data.cframe,
                    ["try_align"] = false,
                    ["plane_lock"] = v_u_172
                })
                if v_u_170 then
                    v_u_178(v_u_170)
                end
            end)
            p179(function()
                v_u_180:Disconnect()
            end)
        end)
        p_u_163:_make_waypoint()
        v_u_164:await()
        p_u_163:_mark_mutated()
    end)
end
function v38._init_rotate(p_u_181)
    p_u_181:_set_info_text_on_hover(p_u_181.buttons.Rotate, function()
        return v_u_21.is_using_gamepad() and "Hold RT and drag to rotate" or "Hold and drag to rotate"
    end)
    local v_u_182 = v_u_29.resolve()
    local v_u_183 = CFrame.new()
    local v_u_184 = v_u_37
    p_u_181.buttons.Rotate.MouseButton1Down:Connect(function()
        p_u_181:_make_waypoint()
        local v185 = {
            ["Rotate"] = {
                ["Button"] = true,
                ["GuideArrows"] = true
            }
        }
        v_u_182 = p_u_181:_focus_on_buttons(v185)
        local v187 = v_u_28.List.map(p_u_181:_get_non_primary_selected_furniture(), function(p186)
            return p186.model
        end)
        v_u_183 = p_u_181.selected_primary_furniture.data.cframe
        v_u_184 = v_u_11.get_cframe_furniture_callback({
            ["primary_furniture_model"] = p_u_181.selected_primary_furniture.model,
            ["other_furniture_models"] = v187,
            ["post_cframe_set_callback"] = function(p188, p189)
                p_u_181:_get_selected_furniture_from_model(p188).data.cframe = p189
                v_u_16.update_xray(p188)
            end
        })
    end)
    p_u_181.buttons.Rotate.MouseButton1Up:Connect(function()
        v_u_182:cancel()
    end)
    local v190 = v_u_3.new(p_u_181.buttons.Rotate, {
        ["axis"] = "X"
    })
    v190:get_changed_signal():Connect(function(p191)
        local v192 = p_u_181:get_placement_grid_size("rotation")
        local v193 = v_u_184
        local v194 = v_u_183
        local v195 = CFrame.fromEulerAnglesYXZ
        local v196 = p191 * v192 % 360
        v193(v194 * v195(0, math.rad(v196), 0))
    end)
    v190:get_finalized_signal():Connect(function(p197)
        if p197 ~= 0 then
            p_u_181:_mark_mutated()
        end
    end)
end
function v38._init_height(p_u_198)
    p_u_198:_set_info_text_on_hover(p_u_198.buttons.Height, function()
        return v_u_21.is_using_gamepad() and "Hold RT and drag to adjust height" or "Hold and drag to adjust height"
    end)
    local v_u_199 = v_u_29.resolve()
    local v_u_200 = v_u_29.resolve()
    local v_u_201 = CFrame.new()
    local v_u_202 = v_u_37
    p_u_198.buttons.Height.MouseButton1Down:Connect(function()
        p_u_198:_make_waypoint()
        v_u_200 = p_u_198:_anchor_billboard_promise()
        local v203 = {
            ["Height"] = {
                ["Button"] = true,
                ["GuideArrows"] = true
            }
        }
        v_u_199 = p_u_198:_focus_on_buttons(v203)
        local v205 = v_u_28.List.map(p_u_198:_get_non_primary_selected_furniture(), function(p204)
            return p204.model
        end)
        v_u_201 = p_u_198.selected_primary_furniture.data.cframe
        v_u_202 = v_u_11.get_cframe_furniture_callback({
            ["primary_furniture_model"] = p_u_198.selected_primary_furniture.model,
            ["other_furniture_models"] = v205,
            ["post_cframe_set_callback"] = function(p206, p207)
                p_u_198:_get_selected_furniture_from_model(p206).data.cframe = p207
                v_u_16.update_xray(p206)
            end
        })
    end)
    p_u_198.buttons.Height.MouseButton1Up:Connect(function()
        v_u_199:cancel()
        v_u_200:cancel()
    end)
    local v208 = v_u_3.new(p_u_198.buttons.Height, {
        ["axis"] = "Y",
        ["tween_return"] = false
    })
    v208:get_changed_signal():Connect(function(p209)
        local v210 = v_u_201.YVector.Y >= 0 and 1 or -1
        local v211 = p_u_198:get_placement_grid_size("move")
        v_u_202(v_u_201 * CFrame.new(0, -(v210 * v211 * p209), 0))
    end)
    v208:get_finalized_signal():Connect(function(p212)
        if p212 ~= 0 then
            p_u_198:_mark_mutated()
        end
    end)
end
function v38._init_height_lock(p_u_213)
    local v_u_214 = false
    local v_u_215 = p_u_213.buttons.HeightLock:get_image()
    local v_u_216, v_u_217 = p_u_213.buttons.HeightLock:get_colors()
    local v_u_218 = Color3.fromRGB(85, 170, 0)
    local v_u_219 = Color3.fromRGB(85, 170, 127)
    local v_u_220 = p_u_213.instance.Container:FindFirstChild("HeightLockMoveHint", true)
    local function v222()
        local v221 = v_u_214 and "Unlock minimum dragging height" or "Lock dragging to selected model\'s height"
        if v_u_21.is_using_gamepad() then
            v221 = "(RT) " .. v221 or v221
        end
        return v221
    end
    p_u_213:_set_info_text_on_hover(p_u_213.buttons.HeightLock, v222)
    p_u_213.buttons.HeightLock.MouseButton1Down:Connect(function()
        local v223 = p_u_213.plane_lock_component:get_locked_furniture_folder()
        local v224 = p_u_213.selected_primary_furniture
        if v224 then
            v224 = p_u_213.selected_primary_furniture.model.Parent
        end
        if v223 == v224 then
            p_u_213.plane_lock_component:set_locked_furniture_folder(nil)
            p_u_213.plane_lock_component:set_icon_visible(false)
            v_u_214 = false
            p_u_213.buttons.HeightLock:set_colors(v_u_216, v_u_217)
            v_u_220.InnerCircle.ImageColor3 = v_u_216
        else
            p_u_213.plane_lock_component:set_locked_furniture_folder(v224)
            v_u_214 = true
            p_u_213.buttons.HeightLock:set_colors(v_u_218 or v_u_216, v_u_219 or v_u_217)
            v_u_220.InnerCircle.ImageColor3 = v_u_218 or v_u_216
        end
        local v225 = p_u_213.instance.Container.Info
        local v226 = v_u_214 and "Unlock minimum dragging height" or "Lock dragging to selected model\'s height"
        if v_u_21.is_using_gamepad() then
            v226 = "(RT) " .. v226 or v226
        end
        v225.Text = v226
    end)
    p_u_213.selected_furnitures_changed:Connect(function()
        local v227 = p_u_213.plane_lock_component:get_locked_furniture_folder()
        local v228 = p_u_213.selected_primary_furniture
        if v228 then
            v228 = p_u_213.selected_primary_furniture.model.Parent
        end
        if v227 and v227 ~= v228 then
            p_u_213.plane_lock_component:set_icon_visible(true)
            v_u_214 = false
            p_u_213.buttons.HeightLock:set_colors(v_u_216, v_u_217)
            v_u_220.InnerCircle.ImageColor3 = v_u_216
        else
            p_u_213.plane_lock_component:set_icon_visible(false)
            local v229 = v227 and true or false
            v_u_214 = v229
            p_u_213.buttons.HeightLock:set_colors(v229 and v_u_218 or v_u_216, v229 and v_u_219 or v_u_217)
            v_u_220.InnerCircle.ImageColor3 = v229 and v_u_218 or v_u_216
        end
    end)
    p_u_213.plane_lock_component:get_folder_changed_signal():Connect(function(p230)
        p_u_213.buttons.HeightLock:set_image(p230 and "rbxassetid://8760023810" or v_u_215)
    end)
end
function v38._init_scale(p_u_231)
    p_u_231:_set_info_text_on_hover(p_u_231.buttons.Scale, function()
        return v_u_21.is_using_gamepad() and "Hold RT and drag to scale" or "Hold and drag to scale"
    end)
    local v_u_232 = v_u_29.resolve()
    local v_u_233 = 1
    local v_u_234 = nil
    local v_u_235 = {}
    local v_u_236 = {}
    p_u_231.buttons.Scale.MouseButton1Down:Connect(function()
        p_u_231:_make_waypoint()
        local v237 = {
            ["Scale"] = {
                ["Button"] = true,
                ["GuideArrows"] = true
            }
        }
        v_u_232 = p_u_231:_focus_on_buttons(v237)
        v_u_235 = v_u_28.List.map(p_u_231:_get_non_primary_selected_furniture(), function(p238)
            return p238.model
        end)
        v_u_236 = v_u_28.Dictionary.map(p_u_231.selected_furnitures, function(p239)
            return p239.model.PlacementBlock.Size.Y, p239
        end)
        v_u_233 = p_u_231.selected_primary_furniture.data.scale
        v_u_234 = v_u_11.get_scale_furniture_callback({
            ["primary_furniture_model"] = p_u_231.selected_primary_furniture.model,
            ["other_furniture_models"] = v_u_235
        })
    end)
    p_u_231.buttons.Scale.MouseButton1Up:Connect(function()
        v_u_232:cancel()
    end)
    local v240 = v_u_3.new(p_u_231.buttons.Scale, {
        ["axis"] = "X"
    })
    v240:get_changed_signal():Connect(function(p241)
        if v_u_234 then
            local v242 = v_u_233 + p241 * p_u_231:get_placement_grid_size("scale")
            local v243 = v_u_32
            local v244 = v_u_33
            local v245 = math.clamp(v242, v243, v244)
            v_u_234((v_u_22.round(v245 / v_u_233, 2)))
            local v246 = workspace.HouseInteriors.blueprint:GetChildren()[1]:WaitForChild("SpecialParts"):WaitForChild("FurnitureOrigin").CFrame:ToObjectSpace(p_u_231.selected_primary_furniture.model.PlacementBlock.CFrame)
            v_u_11.get_cframe_furniture_callback({
                ["primary_furniture_model"] = p_u_231.selected_primary_furniture.model,
                ["other_furniture_models"] = v_u_235,
                ["post_cframe_set_callback"] = function(p247, p248)
                    p_u_231:_get_selected_furniture_from_model(p247).data.cframe = p248
                    v_u_16.update_xray(p247)
                end
            })(v246)
        end
    end)
    v240:get_finalized_signal():Connect(function(p249)
        if p249 ~= 0 then
            for v250, v251 in v_u_236 do
                local v252 = v250.model.PlacementBlock.Size.Y / v251
                local v253 = v_u_22.round(v252 * v250.data.scale, 2)
                local v254 = v_u_32
                local v255 = v_u_33
                v250.data.scale = math.clamp(v253, v254, v255)
            end
            p_u_231:_mark_mutated()
        end
    end)
end
function v38._init_override_handles(p_u_256)
    local v_u_257 = CFrame.new()
    local v_u_258 = v_u_37
    for _, v_u_259 in p_u_256.rotate_handles:GetChildren() do
        v_u_259.MouseButton1Down:Connect(function()
            p_u_256:_make_waypoint()
            local v260 = workspace.HouseInteriors.blueprint:GetChildren()[1]:WaitForChild("SpecialParts"):WaitForChild("FurnitureOrigin")
            local v262 = v_u_28.List.map(p_u_256:_get_non_primary_selected_furniture(), function(p261)
                return p261.model
            end)
            v_u_257 = v260.CFrame:ToObjectSpace(p_u_256.selected_primary_furniture_bounds.CFrame)
            v_u_258 = v_u_11.get_cframe_furniture_from_custom_pivot_callback({
                ["primary_furniture_pivot"] = p_u_256.selected_primary_furniture_bounds.CFrame,
                ["primary_furniture_model"] = p_u_256.selected_primary_furniture.model,
                ["other_furniture_models"] = v262,
                ["post_cframe_set_callback"] = function(p263, p264)
                    p_u_256:_get_selected_furniture_from_model(p263).data.cframe = p264
                    v_u_16.update_xray(p263)
                end
            })
            v_u_4.set_camera_input_enabled_mobile("rotate_" .. v_u_259.Name, false)
        end)
        local v_u_265 = 0
        v_u_259.MouseDrag:Connect(function(p266, p267, _)
            local v268 = Vector3.FromAxis(p266)
            local v269 = p_u_256:get_placement_grid_size("handle_rotation")
            local v270 = math.deg(p267) / v269 + 0.5
            local v271 = math.floor(v270) * v269
            local v272 = math.rad(v271)
            v_u_258(v_u_257 * CFrame.fromAxisAngle(v268, v272))
            v_u_265 = v272
        end)
        v_u_259.MouseButton1Up:Connect(function()
            v_u_4.set_camera_input_enabled_mobile("rotate_" .. v_u_259.Name, true)
            if v_u_265 ~= 0 then
                p_u_256:_mark_mutated()
            end
        end)
    end
    for _, v_u_273 in p_u_256.move_handles:GetChildren() do
        v_u_273.MouseButton1Down:Connect(function()
            p_u_256:_make_waypoint()
            local v274 = workspace.HouseInteriors.blueprint:GetChildren()[1]:WaitForChild("SpecialParts"):WaitForChild("FurnitureOrigin")
            local v276 = v_u_28.List.map(p_u_256:_get_non_primary_selected_furniture(), function(p275)
                return p275.model
            end)
            v_u_257 = v274.CFrame:ToObjectSpace(p_u_256.selected_primary_furniture_bounds.CFrame)
            v_u_258 = v_u_11.get_cframe_furniture_from_custom_pivot_callback({
                ["primary_furniture_pivot"] = p_u_256.selected_primary_furniture_bounds.CFrame,
                ["primary_furniture_model"] = p_u_256.selected_primary_furniture.model,
                ["other_furniture_models"] = v276,
                ["post_cframe_set_callback"] = function(p277, p278)
                    p_u_256:_get_selected_furniture_from_model(p277).data.cframe = p278
                    v_u_16.update_xray(p277)
                end
            })
            v_u_4.set_camera_input_enabled_mobile("move_" .. v_u_273.Name, false)
        end)
        local v_u_279 = 0
        v_u_273.MouseDrag:Connect(function(p280, p281)
            local v282 = Vector3.FromNormalId(p280)
            local v283 = p_u_256:get_placement_grid_size("handle_move")
            local v284 = p281 / v283 + 0.5
            local v285 = math.floor(v284) * v283
            v_u_258(v_u_257 * CFrame.new(v282 * v285))
            v_u_279 = v285
        end)
        v_u_273.MouseButton1Up:Connect(function()
            v_u_4.set_camera_input_enabled_mobile("move_" .. v_u_273.Name, true)
            if v_u_279 ~= 0 then
                p_u_256:_mark_mutated()
            end
        end)
    end
end
function v38._init_color(p_u_286)
    p_u_286:_set_info_text_on_hover(p_u_286.buttons.Paint, function()
        return v_u_21.is_using_gamepad() and "(RT) Change color" or "Change color"
    end)
    local v_u_287 = false
    p_u_286.buttons.Paint.MouseButton1Down:Connect(function()
        if not v_u_287 and (p_u_286.selected_primary_furniture and v_u_57(p_u_286, p_u_286.selected_furnitures)) then
            v_u_287 = true
            local v288 = p_u_286.selected_primary_furniture
            local v289 = #v_u_13.get_primary_default_colors(v288.model)
            local v290 = v_u_13.get_default_colors(v288.model)
            local v291 = v288.data.colors or v290
            local v292, v293 = v_u_50(p_u_286.selected_furnitures)
            local v294 = v292 and #v290 == 1 and true or not v292 and v293
            local v295, v_u_296
            if p_u_286.color_config.multi_color_enabled and not v294 then
                v295, v_u_296 = p_u_286.UIManager.apps.FurniturePickColorsApp:queue_with_override({
                    ["kind"] = v288.data.id,
                    ["starter_colors"] = v291,
                    ["world_orientation"] = v288.model.PlacementBlock.CFrame,
                    ["play_pop_sound"] = true
                })
            else
                v295, v_u_296 = p_u_286.UIManager.apps.ColorPickerApp:queue_with_override({
                    ["request_source"] = "furniture",
                    ["starter_color"] = v291[1],
                    ["additional_colors"] = { v290[1] }
                })
            end
            local v297 = v_u_29.fromEvent(p_u_286.selected_furnitures_changed):andThen(function()
                v_u_296(nil)
            end)
            local v298 = v295:expect()
            local v299
            if typeof(v298) == "Color3" then
                if p_u_286.color_config.multi_color_enabled then
                    v299 = { v298 }
                else
                    v299 = {}
                    for v300 = 1, v289 do
                        v299[v300] = v298
                    end
                end
            else
                v299 = v298
            end
            v297:cancel()
            v_u_287 = false
            if v299 then
                local v301 = {}
                local v302 = false
                for _, v303 in p_u_286.selected_furnitures do
                    local v304 = v303.data.colors or {}
                    local v305 = v_u_13.get_default_colors(v303.model)
                    local v306 = table.clone(v305)
                    for v307, _ in v305 do
                        v306[v307] = v299[v307] or (v304[v307] or v305[v307])
                    end
                    v302 = v_u_43(v303.data.colors or v305) ~= v_u_43(v306) and true or v302
                    v301[v303] = v306
                end
                if v302 then
                    p_u_286:_make_waypoint()
                    for v308, v309 in v301 do
                        v308.data.colors = v309
                        v308.data.mutated = true
                    end
                    p_u_286:push_furniture_changes(p_u_286.selected_furnitures):andThen(function(p310)
                        p_u_286:deselect_all()
                        for _, v311 in p310 do
                            p_u_286:select_furniture(v311.model, v311.data)
                        end
                    end):expect()
                end
            end
        end
    end)
end
function v38._init_delete(p_u_312)
    p_u_312:_set_info_text_on_hover(p_u_312.buttons.Trash, function()
        local v313, v314 = v_u_66(p_u_312.selected_furnitures)
        if not v313 then
            return ""
        end
        local v315 = v_u_21.is_using_gamepad() and "(RT)" or ""
        local v316
        if #p_u_312.selected_furnitures > 1 then
            v316 = v315 .. "Sell multiple for "
        else
            v316 = v315 .. "Sell for "
        end
        return v316 .. (v314 and "full price" or "$" .. v313)
    end)
    p_u_312.buttons.Trash.MouseButton1Down:Connect(function()
        p_u_312:sell_furniture(p_u_312.selected_furnitures)
    end)
end
function v38._reset_rotation(p317)
    p317:_make_waypoint()
    local v318 = workspace.HouseInteriors.blueprint:GetChildren()[1]:WaitForChild("SpecialParts"):WaitForChild("FurnitureOrigin")
    for _, v_u_319 in p317.selected_furnitures do
        local v320 = v_u_12.get_furniture_selection_cframe_size(v_u_319.model.PlacementBlock.CFrame, true, { v_u_319.model })
        local v321 = v318.CFrame:ToObjectSpace(v320)
        v_u_11.get_cframe_furniture_from_custom_pivot_callback({
            ["primary_furniture_pivot"] = v320,
            ["primary_furniture_model"] = v_u_319.model,
            ["other_furniture_models"] = {},
            ["post_cframe_set_callback"] = function(_, p322)
                v_u_319.data.cframe = p322
                v_u_16.update_xray(v_u_319.model)
            end
        })(CFrame.new(v321.Position))
    end
    p317:_mark_mutated()
end
function v38._reset_rotation_around_pivot(p_u_323)
    p_u_323:_make_waypoint()
    local v324 = workspace.HouseInteriors.blueprint:GetChildren()[1]:WaitForChild("SpecialParts"):WaitForChild("FurnitureOrigin")
    local v326 = v_u_28.List.map(p_u_323:_get_non_primary_selected_furniture(), function(p325)
        return p325.model
    end)
    local v327 = v324.CFrame:ToObjectSpace(p_u_323.selected_primary_furniture_bounds.CFrame)
    v_u_11.get_cframe_furniture_from_custom_pivot_callback({
        ["primary_furniture_pivot"] = p_u_323.selected_primary_furniture_bounds.CFrame,
        ["primary_furniture_model"] = p_u_323.selected_primary_furniture.model,
        ["other_furniture_models"] = v326,
        ["post_cframe_set_callback"] = function(p328, p329)
            p_u_323:_get_selected_furniture_from_model(p328).data.cframe = p329
            v_u_16.update_xray(p328)
        end
    })(CFrame.new(v327.Position))
    p_u_323:_mark_mutated()
end
function v38._update_color_config(p330)
    if v_u_15.get_setting_client({
        ["setting_id"] = "furniture_advanced_colors",
        ["use_default"] = true
    }) then
        p330.color_config = v_u_31
    else
        p330.color_config = v_u_30
    end
end
function v38.push_furniture_changes(_, p331)
    local v332 = {}
    local v333 = {}
    for v334, v_u_335 in p331 do
        v332[v334] = v_u_29.resolve({
            ["unique"] = v_u_335.data.unique,
            ["model"] = v_u_335.model,
            ["data"] = v_u_335.data
        })
        if v_u_335.model and (v_u_335.data and (v_u_335.data.unique and v_u_335.data.mutated)) then
            v332[v334] = v_u_29.fromEvent(v_u_7.furniture_registered, function(p336, _, _)
                return p336 == v_u_335.data.unique
            end):andThen(function(p337, p338, p339)
                v_u_335.data.mutated = false
                return {
                    ["unique"] = p337,
                    ["model"] = p338,
                    ["data"] = p339
                }
            end)
            local v340 = {
                ["unique"] = v_u_335.data.unique,
                ["cframe"] = v_u_335.data.cframe,
                ["colors"] = v_u_335.data.colors,
                ["scale"] = v_u_335.data.scale
            }
            table.insert(v333, v340)
        end
    end
    v_u_17.get("HousingAPI/PushFurnitureChanges"):FireServer(v333)
    return v_u_29.all(v332)
end
function v38.sell_furniture(p_u_341, p_u_342, p343)
    local v344 = p343 or {}
    local v345
    if v_u_20.get_current_house_owner() == v_u_26.LocalPlayer then
        v345 = true
        ::l5::
        if not v345 then
            p_u_341.UIManager.apps.HintApp:hint({
                ["text"] = v344.custom_fail_msg or "You don\'t have permission to sell this.",
                ["yields"] = false,
                ["overridable"] = true,
                ["length"] = 4.5
            })
            return false
        end
        local v346 = #p_u_342 == 1
        local v347, v348, _ = v_u_66(p_u_342)
        local v349
        if v344.custom_sell_msg then
            v349 = v344.custom_sell_msg:format("$" .. v347)
        else
            v349 = (not v346 and "Sell multiple for " or "Sell " .. v_u_19[p_u_342[1].data.id].name .. " for ") .. (v348 and "full price" or "$" .. v347) .. "?"
        end
        if p_u_341.UIManager.apps.DialogApp:dialog({
            ["text"] = v349,
            ["left"] = "Cancel",
            ["right"] = "Sell",
            ["accept_delay"] = v344.accept_delay
        }) == "Cancel" then
            return false
        end
        local v_u_350 = {}
        p_u_341.history:waypoint(v_u_26.LocalPlayer, "sell", function(p351)
            for _, v352 in p_u_342 do
                local v353 = v_u_350
                local v354 = v352.data.unique
                table.insert(v353, v354)
                p351(v352.data.unique, v352.data)
                if v352.model.Parent == p_u_341.plane_lock_component:get_locked_furniture_folder() then
                    p_u_341.plane_lock_component:set_locked_furniture_folder(nil)
                end
                local v355 = v_u_14[v352.data.id]
                if v355 and v355.plays_music then
                    v_u_18.store:dispatch({
                        ["type"] = "set_window_visibility",
                        ["window_name"] = "radio",
                        ["visible"] = false
                    })
                end
            end
        end, v344.force_waypoint)
        if v344.before_sell_callback then
            v344.before_sell_callback()
        end
        v_u_17.get("HousingAPI/SellFurniture"):FireServer(not v344.is_sell_all, v_u_350)
        p_u_341:deselect_all()
        return true
    else
        for _, v356 in p_u_342 do
            if not v356.data.guest_built then
                v345 = false
                goto l5
            end
        end
        v345 = true
        goto l5
    end
end
function v38.reset_selected_furniture_rotation(p357, p358)
    local v359 = p357.selected_furnitures
    if #v359 > 0 then
        if p358 then
            p357:_reset_rotation_around_pivot()
        else
            p357:_reset_rotation()
        end
        p357:_select_multiple_furnitures({})
        p357:_select_multiple_furnitures(v359)
        p357.UIManager.apps.HintApp:hint({
            ["text"] = "Rotation was reset!",
            ["overridable"] = true,
            ["yields"] = false,
            ["length"] = 5
        })
    else
        p357.UIManager.apps.HintApp:hint({
            ["text"] = "No furniture was selected.",
            ["overridable"] = true,
            ["yields"] = false,
            ["length"] = 5
        })
    end
end
function v38.set_placement_grid_size(p360, p361)
    local v362 = v_u_35[p361]
    assert(v362, "Invalid size provided!")
    p360.placement_grid_size = p361
end
function v38.increment_placement_grid_size(p363, p364)
    p363:set_placement_grid_size(v_u_36[(v_u_35[p363.placement_grid_size] + p364 - 1) % #v_u_36 + 1])
end
function v38.get_placement_grid_size(p365, p366)
    local v367 = v_u_34[p366]
    return v367 and v367[v_u_35[p365.placement_grid_size]] or p365.placement_grid_size
end
function v38.start_drag_move(p368)
    p368.buttons.Move:fire_button_1_down()
end
function v38.get_flag(p369, p370)
    return p369.flags[p370]
end
function v38.set_flag(p371, p372, p373)
    local v374 = p371.flags[p372]
    if p373 ~= v374 then
        p371.flags[p372] = p373
        p371.flag_changed:Fire(p372, v374, p373)
    end
end
function v38.is_selecting(p375)
    return p375.selected_furnitures[1] ~= nil
end
function v38.is_selecting_single(p376)
    return #p376.selected_furnitures == 1
end
function v38.is_selecting_multiple(p377)
    return #p377.selected_furnitures > 1
end
function v38.get_selection_as_buy_requests(p378)
    if p378:is_selecting() then
        local v379 = p378.selected_furnitures
        local v380 = {}
        for _, v381 in v379 do
            local v382 = v_u_19[v381.data.id]
            if v382 and v382.cost then
                local v383 = {
                    ["kind"] = v381.data.id
                }
                local v384 = {
                    ["cframe"] = v381.data.cframe
                }
                local v385 = v381.data.colors
                if v385 then
                    v385 = table.clone(v381.data.colors)
                end
                v384.colors = v385
                v384.scale = v381.data.scale
                v383.properties = v384
                table.insert(v380, v383)
            end
        end
        if #v379 == #v380 then
            return v380
        else
            return nil
        end
    else
        return
    end
end
function v38.is_furniture_selected(p386, p387)
    return p386.selected_furnitures_unique_to_index[p387] and true or false
end
function v38.get_primary_furniture_unique(p388)
    local v389 = p388.selected_primary_furniture
    if v389 then
        v389 = p388.selected_primary_furniture.data.unique
    end
    return v389
end
function v38.deselect_furniture(p390, p391)
    local v392 = p390.selected_furnitures_unique_to_index[p391]
    if v392 then
        local v393 = v_u_28.List.copy(p390.selected_furnitures)
        local v394 = table.remove(v393, v392)
        p390.selected_furnitures_unique_to_index = {}
        for v395, v396 in v393 do
            p390.selected_furnitures_unique_to_index[v396.data.unique] = v395
        end
        p390:_select_multiple_furnitures(v393)
        p390:push_furniture_changes({ v394 })
    end
end
function v38.deselect_all(p397)
    p397:push_furniture_changes(p397.selected_furnitures)
    p397.selected_furnitures_unique_to_index = {}
    p397:_select_multiple_furnitures({})
end
function v38.get_selected_furnitures(p398)
    return v_u_28.List.copy(p398.selected_furnitures)
end
function v38.force_select_furnitures(p399, p400)
    local v401 = p399:get_selected_furnitures()
    local v402 = 0
    for v403, v404 in p400 do
        if p399:is_furniture_selected(v404.unique) then
            return
        end
        if not v404.placeable then
            v404.unique = v403:GetAttribute("furniture_unique")
            v404.mutated = false
            local v405 = {
                ["model"] = v403,
                ["data"] = v404,
                ["tick"] = tick()
            }
            table.insert(v401, v405)
            p399.selected_furnitures_unique_to_index[v404.unique] = #v401
            v402 = v402 + 1
        end
    end
    if v402 > 0 then
        p399:_select_multiple_furnitures(v401)
    end
end
function v38.force_select_furniture(p406, p407, p408)
    return p406:force_select_furnitures({
        [p407] = p408
    })
end
function v38.select_furnitures(p409, p410)
    if not p409.history:is_processing() then
        return p409:force_select_furnitures(p410)
    end
end
function v38.select_furniture(p411, p412, p413)
    p411:select_furnitures({
        [p412] = p413
    })
end
function v38.select_primary_furniture(p414, p415)
    local v416 = p414:is_furniture_selected(p415)
    assert(v416, "Cannot set the primary furniture to a piece that isn\'t already selected.")
    local v417 = p414.selected_furnitures_unique_to_index[p415]
    p414:_select_primary_furniture(p414.selected_furnitures[v417])
end
function v38.buy_new_furnitures(p418, p419, p420)
    local v421, v_u_422 = v_u_7.buy_furniture(p420)
    if v421 then
        p418.history:waypoint(v_u_26.LocalPlayer, "buy", function(p423)
            for _, v424 in v_u_422.results do
                p423(v424.unique, v424.furniture_data)
            end
        end)
        if p419 and v_u_20.is_edit_mode_active() then
            p418:deselect_all()
            for _, v425 in v_u_422.results do
                p418:select_furniture(v425.furniture_model, v425.furniture_data)
            end
        end
    end
    return v421, v_u_422
end
function v38.show(p426)
    p426.instance.Enabled = true
end
function v38.hide(p427)
    p427.instance.Enabled = false
end
function v38.start(p_u_428)
    p_u_428.history = v_u_9.new(100, true)
    p_u_428.placement_grid_size = "large"
    p_u_428.selected_furnitures = {}
    p_u_428.selected_furnitures_unique_to_index = {}
    p_u_428.selected_furnitures_changed = v_u_23.new()
    p_u_428.selected_furnitures_promise = v_u_29.resolve()
    p_u_428.selected_primary_furniture = nil
    p_u_428.selected_primary_furniture_bounds = nil
    p_u_428.selected_primary_promise = v_u_29.resolve()
    p_u_428.plane_lock_component = v_u_5.new(p_u_428.instance.FurniturePlaneLock)
    p_u_428.move_handles = p_u_428.instance.MoveHandles
    p_u_428.move_handles.Parent = v_u_26.LocalPlayer.PlayerGui
    p_u_428.rotate_handles = p_u_428.instance.RotateHandles
    p_u_428.rotate_handles.Parent = v_u_26.LocalPlayer.PlayerGui
    p_u_428.flags = {
        ["handle_mode"] = "Default",
        ["locked"] = false
    }
    p_u_428.flag_changed = v_u_23.new()
    p_u_428.flag_changed:Connect(function(p429, _, p430)
        if p429 == "handle_mode" then
            p_u_428.instance.Container.Visible = p430 == "Default"
            v_u_73(p_u_428.move_handles, {
                ["Visible"] = p430 == "MoveHandles"
            })
            v_u_73(p_u_428.rotate_handles, {
                ["Visible"] = p430 == "RotateHandles"
            })
        elseif p429 == "locked" then
            p_u_428:deselect_all()
        end
    end)
    p_u_428.instance.Container.Info.Text = ""
    v_u_73(p_u_428.move_handles, {
        ["Visible"] = false
    })
    v_u_73(p_u_428.rotate_handles, {
        ["Visible"] = false
    })
    p_u_428.tool_icons = p_u_428.instance.Container.ToolIcons
    p_u_428.tool_icons.Parent = nil
    p_u_428.page_template = p_u_428.instance.Container.PageTemplate
    p_u_428.page_template.Parent = nil
    p_u_428.buttons = p_u_428:_create_pages(p_u_428.instance.Container, {
        {
            "Trash",
            "Move",
            "Paint",
            "Page",
            "Rotate",
            "Scale"
        },
        {
            "HeightLock",
            "Height",
            "EMPTY",
            "Page",
            "EMPTY",
            "EMPTY"
        }
    })
    p_u_428.color_config = v_u_30
    task.spawn(function()
        p_u_428:_update_color_config()
        v_u_15.promise_setting_changed_signal("furniture_advanced_colors"):expect():Connect(function()
            p_u_428:deselect_all()
            p_u_428:_update_color_config()
        end)
    end)
    p_u_428:_init_scale()
    p_u_428:_init_override_handles()
    p_u_428:_init_move()
    p_u_428:_init_rotate()
    p_u_428:_init_height()
    p_u_428:_init_height_lock()
    p_u_428:_init_color()
    p_u_428:_init_delete()
    for v_u_431, v432 in p_u_428.buttons do
        v432.MouseButton1Down:Connect(function()
            v_u_25.log_billboard_button_click(v_u_431)
        end)
    end
end
return v38