--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.PlayerProfile.WidgetText (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PlayerProfileHelper")
local v3 = v1("Class")
local v4 = v1("package:t")
local v5 = v3("WidgetText", v1("UIBaseElement"))
function v5.edit(p6, p7)
    if not p7 or p6.props.editable then
        p6.edit_textbox.Visible = p7
        p6.display_label.Visible = not p7
    end
end
function v5.get(p8)
    return p8.display_label.Text
end
function v5.to_save(p9)
    local v10 = p9:get()
    if v10 == "" then
        return nil
    elseif v10 == p9.props.default_text then
        return nil
    else
        return v10
    end
end
function v5.set(p_u_11, p_u_12, p13)
    if p_u_12 ~= p_u_11.unfiltered_title then
        if p_u_12 == "" then
            p_u_12 = nil
        end
        if p13 then
            p13 = p_u_11.props.editable
        end
        if not p13 then
            p_u_11.edit_textbox.Text = p_u_12 or ""
        end
        p_u_11.display_label.Text = p_u_12 or (p_u_11.props.default_text or "")
        if p13 and p_u_12 then
            if p_u_11.filter_promise then
                p_u_11.filter_promise:cancel()
            end
            p_u_11.filter_promise = v_u_2.filter_text_promise(p_u_12):timeout(5):andThen(function(p14)
                if p14 ~= nil then
                    p_u_11.unfiltered_title = p_u_12
                    p_u_11.display_label.Text = p14
                    p_u_11.widget:save()
                end
            end):catch(function(_) end)
        end
    end
end
local v_u_15 = v4.strictInterface({
    ["default_text"] = v4.optional(v4.string),
    ["editable"] = v4.optional(v4.boolean),
    ["character_limit"] = v4.optional(v4.integer),
    ["override_edit"] = v4.optional(v4.instanceIsA("TextBox")),
    ["override_display"] = v4.optional(v4.instanceIsA("TextLabel"))
})
function v5.start(p_u_16, p17, p18)
    local v19 = p17 ~= nil
    assert(v19, "Missing widget for WidgetText")
    p_u_16.widget = p17
    p_u_16.props = p18 or {}
    p_u_16.props.default_text = p_u_16.props.default_text or ""
    p_u_16.props.character_limit = p_u_16.props.character_limit or 24
    local v20 = p_u_16.props
    local v21 = p_u_16.props.editable
    if v21 then
        v21 = p_u_16.widget.player_profile.is_my_profile
    end
    v20.editable = v21
    local v22 = v_u_15
    local v23 = p_u_16.props
    assert(v22, v23)
    p_u_16.edit_textbox = p_u_16.props.override_edit or p_u_16.instance.Edit
    p_u_16.display_label = p_u_16.props.override_display or p_u_16.instance.Display
    v_u_2.limit_textbox_length(p_u_16.edit_textbox, p_u_16.props.character_limit)
    if p_u_16.props.editable then
        p_u_16.widget:get_edited_changed_signal():Connect(function(p24)
            p_u_16:edit(p24)
            if not p24 then
                p_u_16:set(p_u_16.edit_textbox.Text, true)
            end
        end)
        p_u_16.widget.player_profile_app:mark_priority_ui(p_u_16.edit_textbox)
    end
    p_u_16:edit(false)
    p_u_16:set(p_u_16.props.default_text, false)
    return p_u_16
end
return v5