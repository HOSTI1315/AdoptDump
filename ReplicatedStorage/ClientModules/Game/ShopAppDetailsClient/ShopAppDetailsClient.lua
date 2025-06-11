--// ReplicatedStorage.ClientModules.Game.ShopAppDetailsClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Signal")
local v_u_3 = v1("ClientData")
local v4 = {}
local v_u_5 = v2.new()
function v4.get_details()
    return v_u_3.get("shop_app_details") or {}
end
function v4.init()
    v_u_3.register_callback("shop_app_details", function()
        v_u_5:Fire()
    end)
end
function v4.get_details_changed_signal()
    return v_u_5
end
return v4