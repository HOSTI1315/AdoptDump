--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.SettingsApp.Checkbox (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Signal")
local v_u_4 = v1("package:Sift")
local v5 = v1("package:t")
local v6 = v2("Checkbox", v1("UIBaseElement"))
local v_u_7 = v5.strictInterface({
    ["default"] = v5.boolean,
    ["text"] = v5.string
})
function v6.get(p8)
    return p8.status
end
function v6.set(p9, p10)
    if p10 ~= p9.status then
        p9.checkmark.Visible = p10
        p9.status = p10
        p9.changed:Fire(p9.status)
    end
end
function v6.start(p_u_11, p12)
    local v13 = v_u_7(p12)
    assert(v13, "Options failed to validate.")
    p_u_11.options = v_u_4.Dictionary.copy(p12)
    p_u_11.status = nil
    p_u_11.changed = v_u_3.new()
    p_u_11.box = p_u_11.instance.Box
    p_u_11.checkmark = p_u_11.box.Checkmark
    p_u_11.label = p_u_11.instance.TextLabel
    p_u_11.label.Text = p_u_11.options.text
    p_u_11:set(p_u_11.options.default)
    p_u_11.box.Activated:Connect(function()
        p_u_11:set(not p_u_11.status)
    end)
    p_u_11.instance.Activated:Connect(function()
        p_u_11:set(not p_u_11.status)
    end)
    return p_u_11
end
function v6.destroy(p14)
    p14.changed:destroy()
end
return v6