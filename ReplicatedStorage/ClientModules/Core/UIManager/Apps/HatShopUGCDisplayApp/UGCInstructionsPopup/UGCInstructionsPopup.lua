--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HatShopUGCDisplayApp.UGCInstructionsPopup (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")("UGCInstructionsPopup", v1("UIBaseElement"))
function v2.start(p_u_3, p4)
    local v_u_5 = p4.on_close
    local v6 = p_u_3.instance
    p_u_3.UIManager.wrap(v6:FindFirstChild("StartButton", true), "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_3:hide()
            if v_u_5 then
                v_u_5()
            end
        end
    })
    return p_u_3
end
function v2.show(p7)
    p7.instance.Visible = true
end
function v2.hide(p8)
    p8.instance.Visible = false
end
return v2