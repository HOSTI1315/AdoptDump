--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.SettingsApp.InputBox (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Signal")
local v_u_4 = v1("package:t")
local v5 = v2("InputBox", v1("UIBaseElement"))
local v_u_6 = v_u_4.strictInterface({
    ["default"] = v_u_4.any,
    ["max_length"] = v_u_4.optional(v_u_4.union(v_u_4.integer, v_u_4.numberMin(0))),
    ["text_validation"] = v_u_4.optional(v_u_4.callback)
})
local function v_u_7()
    return true
end
function v5.console_activated(p8)
    p8.textbox:CaptureFocus()
end
function v5.get(p9)
    return p9.value
end
function v5.set(p10, p11)
    local v12 = v_u_4.string(p11)
    assert(v12, "Not a string")
    local v13 = p11:sub(1, p10.options.max_length)
    if p10.options.validation(v13) then
        p10.textbox.Text = v13
    else
        p10.textbox.Text = p10.previous_value or ""
    end
    if p10.value ~= p10.textbox.Text then
        p10.value = p10.textbox.Text
        p10.previous_value = p10.value
        p10.changed:Fire(p10.value)
    end
end
function v5.start(p_u_14, p15)
    local v16 = v_u_6(p15)
    assert(v16, "Options failed to validate.")
    p_u_14.options = {
        ["default"] = p15.default,
        ["max_length"] = p15.max_length or (1 / 0),
        ["validation"] = p15.validation or v_u_7
    }
    p_u_14.value = nil
    p_u_14.previous_value = nil
    p_u_14.changed = v_u_3.new()
    p_u_14.textbox = p_u_14.instance.TextBox
    p_u_14.textbox.PlaceholderText = p_u_14.options.default
    p_u_14.textbox:GetPropertyChangedSignal("Text"):Connect(function()
        if p_u_14.previous_value then
            if #p_u_14.textbox.Text >= p_u_14.options.max_length then
                p_u_14.textbox.Text = p_u_14.previous_value
            else
                if p_u_14.options.validation(p_u_14.textbox.Text) then
                    p_u_14.previous_value = p_u_14.textbox.Text
                else
                    p_u_14.textbox.Text = p_u_14.previous_value
                end
                p_u_14.textbox.Text = p_u_14.textbox.Text:sub(1, p_u_14.options.max_length)
            end
        else
            return
        end
    end)
    p_u_14.textbox.FocusLost:Connect(function()
        p_u_14:set(p_u_14.textbox.Text)
    end)
    p_u_14:set("")
    return p_u_14
end
return v5