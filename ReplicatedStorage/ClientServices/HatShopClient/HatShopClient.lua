--// ReplicatedStorage.ClientServices.HatShopClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ClientData")
local v3 = v1("Signal")
local v4 = {}
local v_u_5 = {}
local v_u_6 = v3.new()
function v4.get_stock_changed_event()
    return v_u_6
end
function v4.get_current_stock()
    return v_u_5
end
function v4.init()
    v_u_2.register_callback_plus_existing("hat_shop_stock", function(_, p7, _)
        if p7 ~= nil then
            v_u_5 = p7
            v_u_6:Fire(p7)
        end
    end)
end
return v4