--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.BaseApps.UIBaseApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v1("ClientData")
v1("PlatformM")
v1("RouterClient")
v1("XboxSupport")
v1("StringUtil")
local v2 = v1("Class")
local v_u_3 = v1("CriticalSection")
local v4, v_u_5 = v2("UIBaseApp", v1("UIBaseElement"))
function v4.__init(p6, ...)
    v_u_5.__init(p6, ...)
    p6.show_hide_critical_section = v_u_3.new()
end
function v4.get_start_order(_)
    return 100000
end
function v4.set_visibility(p7, p8)
    p7.show_hide_critical_section:wait()
    if p7.UIManager.apps.HideGuiApp:should_hide_app(p7.ClassName) then
        p8 = false
    end
    if p8 and p7.visible ~= true then
        p7.visible = true
        p7:show()
    elseif not p8 and p7.visible ~= false then
        p7.visible = false
        p7:hide()
    end
    p7.show_hide_critical_section:signal()
end
function v4.refresh(p9, p10)
    p9:set_visibility(p10[p9.ClassName])
end
function v4.can_set_app_visibility(_, _)
    return true
end
function v4.show(_)
    error("Not implemented")
end
function v4.hide(_)
    error("Not implemented")
end
return v4