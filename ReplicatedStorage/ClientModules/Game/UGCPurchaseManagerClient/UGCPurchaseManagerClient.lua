--// ReplicatedStorage.ClientModules.Game.UGCPurchaseManagerClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("ClientData")
local v3 = v1("Signal")
local v_u_4 = v1("UGCHelper")
local v_u_5 = v1("package:Sift")
local v_u_6 = v3.new()
local v_u_7 = {}
local function v_u_8()
    return v_u_2.get("ugc_purchase_manager") or {
        ["purchases"] = {},
        ["claimed"] = {}
    }
end
function v_u_7.init()
    v_u_2.register_callback("ugc_purchase_manager", function()
        v_u_6:Fire()
    end)
end
function v_u_7.get_purchases()
    return v_u_8().purchases
end
function v_u_7.is_purchased(p9)
    return table.find(v_u_8().purchases, p9) ~= nil
end
function v_u_7.get_claimed()
    return v_u_8().claimed
end
function v_u_7.is_claimed(p10)
    return table.find(v_u_8().claimed, p10) ~= nil
end
function v_u_7.get_unclaimed_purchases()
    local v11 = v_u_7.get_purchases()
    local v_u_12 = v_u_7.get_claimed()
    return v_u_5.List.filter(v11, function(p13)
        return table.find(v_u_12, p13) == nil
    end)
end
function v_u_7.get_unclaimed_with_count_limit(p14)
    local v15 = v_u_7.get_unclaimed_purchases()
    if #v15 <= p14 then
        return v15
    else
        return v_u_5.List.slice(v15, 1, p14)
    end
end
function v_u_7.claimed_all_items_already()
    return v_u_4.claimed_all_items_already((v_u_8()))
end
function v_u_7.get_changed_signal()
    return v_u_6
end
return v_u_7