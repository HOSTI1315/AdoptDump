--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AilmentsMonitorApp.AilmentsMonitorAppTooltip (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_3 = v2("new:AilmentsClient")
local v_u_4 = v2("new:AilmentsDB")
local v_u_5 = v2("BucksAgingMultiplierHelper")
local v6 = v2("Class")
local v_u_7 = v2("EquippedPets")
local v_u_8 = v2("Maid")
local v_u_9 = v2("PlatformM")
local v_u_10 = v2("package:Sift")
local v11 = v6("AilmentsMonitorAppTooltip", v2("UIBaseElement"))
function v11.set_ailment(p12, p13)
    p12.maid:DoCleaning()
    local v14 = p13 ~= nil
    p12.instance.Visible = v14
    if v14 then
        p12.ailment_kind = p13.kind
        local v15 = p13.components.preference
        local v16
        if v15 then
            v16 = p13.kind .. v15.item_kind
        else
            v16 = p13.kind
        end
        p12.ailment_key = v16
        local v17 = p13.description
        local v18 = p13.category
        local v19 = v18.colors
        local v20
        if typeof(v19) == "function" then
            v20 = v18.colors()
        else
            v20 = v18.colors
        end
        local v21 = v20.Keypoints[2].Value
        p12.instance.BoxBorder.TextArea.Description.DescriptionTextLabel.Text = v17.display_text
        p12.instance.BoxBorder.TextArea.Title.AilmentName.Text = ("%*!"):format(v17.name)
        p12.instance.BoxBorder.BottomFill.RewardText.TextColor3 = v21
        for _, v22 in p12.colorable do
            v22.ImageColor3 = v21
        end
        p12:_render_progress_text()
        p12:_render_reward()
    else
        p12.ailment_kind = nil
        p12.ailment_key = nil
        p12.instance.Parent = p12.main
    end
end
function v11.set_parent(p23, p24)
    if p24 then
        p23.instance.Parent = p24
    else
        p23.instance.Parent = p23.main
    end
    p23:_adjust_position()
end
function v11.set_wrappers(p25, p26)
    p25.char_wrappers = p26
    p25:_render_progress_text()
    p25:_render_reward()
end
function v11._adjust_position(p27)
    if p27.instance.Parent == p27.main then
        p27.instance.Position = UDim2.new(0.5, 0, 0, p27.ailments_container.AbsoluteSize.Y + 18)
    else
        p27.instance.Position = UDim2.new(0.5, 0, 1, 8)
    end
end
function v11._render_progress_text(p_u_28)
    if not p_u_28.ailment_kind then
        p_u_28.maid:DoCleaning()
        return
    end
    local v_u_29 = {}
    local v_u_30 = {}
    local v_u_31 = p_u_28.char_wrappers[p_u_28.ailment_key]
    if not v_u_31 then
        p_u_28.instance.BoxBorder.TextArea.Title.Progress.Text = ""
        return
    end
    for _, v32 in v_u_31 do
        local v33
        if v32.is_pet then
            v33 = v_u_7.get_name_from_wrapper(v32)
        else
            v33 = v32.char.name
        end
        v_u_29[v32] = v33
        local v34 = v_u_3.get_ailments_for_pet(v32)
        v_u_30[v32] = v34[p_u_28.ailment_kind]
        if not v_u_30[v32] then
            for _, v35 in v34 do
                if v35.kind == p_u_28.ailment_kind then
                    v_u_30[v32] = v35
                    break
                end
            end
        end
    end
    table.sort(v_u_31, function(p36, p37)
        local v38 = v_u_30[p36].created_timestamp
        local v39 = v_u_30[p37].created_timestamp
        if v38 == v39 then
            return v_u_29[p36] < v_u_29[p37]
        else
            return v38 < v39
        end
    end)
    local function v46()
        local v44 = v_u_10.List.map(v_u_31, function(p40)
            local v41 = v_u_30[p40]:get_progress()
            local v42 = v_u_29[p40]
            local v43 = v41 * 100
            return ("%* (%*%%)"):format(v42, (math.floor(v43)))
        end)
        local v45 = table.concat(v44, "\n")
        p_u_28.instance.BoxBorder.TextArea.Title.Progress.Text = v45
        p_u_28.instance.BoxBorder.TextArea.Title.Progress.AutoLocalize = false
    end
    v46()
    if v_u_10.List.some(v_u_31, function(p47)
        return v_u_30[p47].rate > 0
    end) then
        p_u_28.maid.update_progress = v_u_1.Heartbeat:Connect(v46)
    end
end
function v11._render_reward(p48)
    if p48.ailment_kind then
        local v49 = v_u_4[p48.ailment_kind]
        local v50 = nil
        for _, v51 in p48.char_wrappers[p48.ailment_key] do
            local v52 = v_u_5.apply_bucks_multiplier_for_pet(game.Players.LocalPlayer, v51, v49.reward)
            if not v50 or v50 < v52 then
                v50 = v52
            end
        end
        local v53 = ("Reward: %d Bucks"):format(v50)
        p48.instance.BoxBorder.BottomFill.RewardText.Text = v53
        if v50 > 0 then
            p48.instance.BoxBorder.BottomFill.Visible = true
            p48.instance.BoxBorder.TextArea.Description.Size = UDim2.new(1, 0, 0.5, 0)
        else
            p48.instance.BoxBorder.BottomFill.Visible = false
            p48.instance.BoxBorder.TextArea.Description.Size = UDim2.new(1, 0, 0.66, 0)
        end
    else
        return
    end
end
function v11.start(p_u_54, p55)
    p_u_54.maid = v_u_8.new()
    p_u_54.main = p_u_54.instance.Parent
    p_u_54.instance.Visible = false
    p_u_54.ailments_container = p55
    p_u_54.colorable = { p_u_54.main:FindFirstChild("box_fill", true), p_u_54.main:FindFirstChild("arrow_fill", true) }
    p_u_54.ailment_kind = nil
    p_u_54.ailment_key = nil
    p_u_54.char_wrappers = {}
    p_u_54.ailments_container:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        p_u_54:_adjust_position()
    end)
    v_u_9.run({
        ["tablet"] = function()
            p_u_54.instance.TabletClose.Visible = true
            p_u_54.instance.TabletClose.MouseButton1Click:connect(function()
                p_u_54:set_ailment(nil)
            end)
        end,
        ["default"] = function()
            p_u_54.instance.TabletClose:Destroy()
        end
    })
end
return v11