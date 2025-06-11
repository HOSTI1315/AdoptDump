--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.UIApps.MockToolApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("UIBaseApp")
local v_u_4 = v1("PlatformM")
local v5 = v2("MockToolApp", v3)
function v5.show(p6)
    p6.instance.Enabled = true
    p6.poof_effect = p6.UIManager.wrap(p6.instance.Frame.Main, "RevealPoofEffect")
    p6.poof_effect:start()
    p6.poof_effect:play()
end
function v5.hide(p7)
    if p7.poof_effect then
        p7.poof_effect:destroy()
        p7.poof_effect = nil
    end
    p7.instance.Enabled = false
end
function v5._get_default_button_scale(_)
    return v_u_4.get_platform() == v_u_4.platform.phone and 0.7 or 1
end
function v5.start(p8)
    p8.instance.Frame.UIScale.Scale = p8:_get_default_button_scale()
end
return v5