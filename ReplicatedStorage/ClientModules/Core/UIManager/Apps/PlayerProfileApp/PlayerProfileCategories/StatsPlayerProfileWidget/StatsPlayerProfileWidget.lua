--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerProfileApp.PlayerProfileCategories.StatsPlayerProfileWidget (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("PlatformM")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("StatsWidgetDB")
local v_u_6 = v1("package:Promise")
local v_u_7 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local v_u_8 = v3.get_platform() == "phone" and true or v3.get_platform() == "tablet"
local v9 = v2("StatsPlayerProfileWidget", v1("BasePlayerProfileWidget"))
function v9._get_max_slot_count(p10)
    return p10.expanded and 8 or 4
end
function v9._adjust_slot_count(p11, p12)
    p11:_render_slot(5)
    p11:_render_slot(6)
    p11:_render_slot(7)
    p11:_render_slot(8)
    local v13 = p11.instance.Body.Slots.UIGridLayout
    v13.FillDirectionMaxCells = p12
    v13.CellPadding = UDim2.fromScale(0.07 / p12, 0)
    v13.CellSize = UDim2.fromScale(0.9299999999999999 / p12, 0.9)
end
function v9._get_frame(p14, p15)
    return p14.stat_frames[p15]
end
function v9._add_stat(p16, p17, p18, p19)
    p16.stats[p17] = {
        ["kind"] = p18,
        ["value"] = p19
    }
    p16:_render_slot(p17)
end
function v9._remove_stat(p20, p21)
    p20.stats[p21] = nil
    p20:_render_slot(p21)
end
function v9._render_slot(p_u_22, p_u_23)
    local v_u_24 = p_u_22:_get_frame(p_u_23)
    if v_u_24 then
        v_u_24.Visible = p_u_23 <= p_u_22:_get_max_slot_count()
        if v_u_24.Visible then
            local v25 = v_u_24.Editing
            v25.Visible = p_u_22.editing
            local v_u_26 = p_u_22.stats[p_u_23]
            v_u_26 = v_u_26
            local v_u_27
            if v_u_26 then
                v_u_27 = v_u_26.kind
            else
                v_u_27 = v_u_26
            end
            if v_u_27 then
                local v_u_28 = v_u_5[v_u_27]
            end
            if v_u_28 == nil then
                v_u_27 = nil
            end
            if v_u_27 and v_u_24:GetAttribute("Stat") == v_u_27 then
                return
            elseif v_u_27 ~= nil or v_u_24:GetAttribute("Stat") ~= "empty" then
                v_u_24:SetAttribute("Stat", v_u_27 or "empty")
                local v29 = v_u_27 == nil
                v25.AddButton.Visible = v29
                v25.RemoveButton.Visible = not v29
                v_u_24.StatInfo.Visible = not v29
                if v_u_28 and not v29 then
                    local v30 = v_u_7:Translate(workspace, v_u_28.display_text or v_u_28.choose_text)
                    v_u_24.StatInfo.StatLabel.Text = v30:upper()
                    v_u_24.StatInfo.IconLabel.Image = v_u_8 and v_u_28.mobile_icon or v_u_28.icon
                    local v_u_31
                    if v_u_26.value == nil then
                        v_u_31 = nil
                    else
                        v_u_31 = v_u_28.format_value(v_u_26.value)
                    end
                    v_u_24.StatInfo.ValueLabel.Text = v_u_31 or "..."
                    if v_u_26.value == nil then
                        v_u_6.try(function()
                            return v_u_4.get("PlayerProfileAPI/GetStat"):InvokeServer(v_u_27)
                        end):andThen(function(p32)
                            if p32 == nil then
                                return
                            else
                                local v33 = p_u_22.stats[p_u_23]
                                if v33 then
                                    v33 = p_u_22.stats[p_u_23].kind
                                end
                                if v33 == v_u_27 then
                                    p_u_22.stats[p_u_23].value = p32
                                    local v34
                                    if v_u_26.value == nil then
                                        v34 = nil
                                    else
                                        v34 = v_u_28.format_value(v_u_26.value)
                                    end
                                    v_u_31 = v34
                                    v_u_24.StatInfo.ValueLabel.Text = v_u_31 or "..."
                                end
                            end
                        end)
                    end
                end
            end
        else
            return
        end
    else
        return
    end
end
function v9.render(p35)
    for v36 = 1, 8 do
        p35:_render_slot(v36)
    end
end
function v9.get_save_data(p37)
    local v38 = {
        ["stats"] = {},
        ["title"] = p37.title:to_save()
    }
    for v39 = 1, p37:_get_max_slot_count() do
        if p37.stats[v39] then
            local v40 = v38.stats
            local v41 = {
                ["index"] = v39,
                ["kind"] = p37.stats[v39].kind,
                ["value"] = p37.stats[v39].value
            }
            table.insert(v40, v41)
        end
    end
    return v38
end
function v9.on_shrink(p42)
    p42:_adjust_slot_count(4)
end
function v9.on_expand(p43)
    p43:_adjust_slot_count(8)
end
function v9.start(p_u_44, p45, _)
    local v46 = p_u_44.instance.Body.Slots.SlotTemplate
    v46.Parent = nil
    p_u_44.title = p_u_44.UIManager.wrap(p_u_44.instance.Title, "WidgetText"):start(p_u_44, {
        ["default_text"] = "Stats",
        ["editable"] = true
    })
    local v47 = p_u_44.title
    local v48
    if p45 then
        v48 = p45.title
    else
        v48 = p45
    end
    v47:set(v48)
    if v_u_8 then
        v46.StatInfo.StatLabel.LineHeight = 0.9
    end
    p_u_44.stats = {}
    if p45 and p45.stats then
        for _, v49 in p45.stats do
            p_u_44.stats[v49.index] = {
                ["kind"] = v49.kind,
                ["value"] = v49.value
            }
        end
    end
    p_u_44.stat_frames = {}
    for v_u_50 = 1, 8 do
        local v_u_51 = v46:Clone()
        v_u_51.Name = v_u_50
        v_u_51.LayoutOrder = v_u_50
        v_u_51.ZIndex = v_u_50 * -1
        v_u_51.Parent = p_u_44.instance.Body.Slots
        local v57 = {
            ["mouse_button1_click"] = function()
                local v52 = {}
                for v53, v54 in v_u_5 do
                    v52[v53] = {
                        ["text"] = v54.choose_text,
                        ["icon"] = v_u_8 and v54.mobile_icon or v54.icon,
                        ["layout_order"] = v54.layout_order
                    }
                end
                for _, v55 in p_u_44.stats do
                    v52[v55.kind] = nil
                end
                if next(v52) == nil then
                    p_u_44.UIManager.apps.DialogApp:dialog({
                        ["text"] = "No more stats to display!",
                        ["button"] = "Okay"
                    })
                    return
                else
                    local v56 = p_u_44.UIManager.apps.DialogApp:dialog({
                        ["dialog_type"] = "ScrollingButtonsDialog",
                        ["header"] = "ADD STAT",
                        ["buttons"] = v52,
                        ["cancelable"] = true,
                        ["cells_per_row"] = 2,
                        ["padding"] = 10
                    })
                    if v56 and v56 ~= "cancel" then
                        p_u_44:_add_stat(v_u_50, v56)
                        p_u_44.player_profile_app:set_gamepad_selection(v_u_51.Editing.RemoveButton)
                    end
                end
            end
        }
        p_u_44.UIManager.wrap(v_u_51.Editing.AddButton, "IconButton"):start(v57)
        p_u_44.UIManager.wrap(v_u_51.Editing.RemoveButton, "IconButton"):start({
            ["mouse_button1_click"] = function()
                p_u_44:_remove_stat(v_u_50)
                p_u_44.player_profile_app:set_gamepad_selection(v_u_51.Editing.AddButton)
            end
        })
        p_u_44.stat_frames[v_u_50] = v_u_51
    end
    if p_u_44.expanded then
        p_u_44:on_expand()
    else
        p_u_44:on_shrink()
    end
end
return v9