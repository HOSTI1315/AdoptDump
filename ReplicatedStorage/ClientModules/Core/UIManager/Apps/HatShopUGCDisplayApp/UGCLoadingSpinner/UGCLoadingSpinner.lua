--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HatShopUGCDisplayApp.UGCLoadingSpinner (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("new:ToggleableSignal")
local v_u_4 = game:GetService("RunService")
local v5 = v2("UGCLoadingSpinner", v1("UIBaseElement"))
function v5.start(p6)
    local v_u_7 = p6.instance.LoadingSpinner
    p6.instance.Visible = false
    v_u_3.newConnect(v_u_4.Heartbeat, function()
        v_u_7.Rotation = os.clock() * 180 % 360
    end):WithProperty(p6.instance, "Visible")
    return p6
end
function v5.set_text(p8, p9)
    p8.instance.LoadingText.Text = p9
end
function v5.show(p10)
    p10.instance.Visible = true
end
function v5.hide(p11)
    p11.instance.Visible = false
end
return v5