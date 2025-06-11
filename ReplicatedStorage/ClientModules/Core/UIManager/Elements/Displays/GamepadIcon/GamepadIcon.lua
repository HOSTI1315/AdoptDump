--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Displays.GamepadIcon (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PlatformM")
local v3 = v1("Class")
local v_u_4 = v1("Maid")
local v5 = v3("GamepadIcon", v1("UIBaseElement"))
function v5.is_enabled(p6)
    local v7 = v_u_2.is_using_gamepad()
    if v7 then
        v7 = p6.key ~= nil
    end
    return v7
end
function v5._refresh_icon(p8)
    local v9 = p8:is_enabled()
    local v10 = p8.instance.Image
    p8.instance.Image = v9 and (v_u_2.get_custom_icon(p8.key) or "") or ""
    if v10 == p8.instance.Image and (p8.enabled ~= nil and p8.enabled == v9) then
        return
    else
        p8.enabled = v9
        if p8.on_update then
            p8.on_update(p8, v9)
        else
            p8.instance.Visible = v9
        end
    end
end
function v5.update(p11, p12)
    p11.key = p12.key or p11.key
    p11.on_update = p12.on_update or p11.on_update
    p11:_refresh_icon()
end
function v5.update_key(p13, p14)
    if p13.key ~= p14 then
        p13.key = p14
        p13:_refresh_icon()
    end
end
function v5.get_key(p15)
    return p15.key
end
function v5.start(p_u_16, p17)
    p_u_16.maid = v_u_4.new()
    p_u_16:update(p17)
    p_u_16.maid:GiveTask(v_u_2.get_gamepad_changed():Connect(function()
        p_u_16:_refresh_icon()
    end))
    return p_u_16
end
function v5.destroy(p18)
    p18.maid:Destroy()
end
return v5