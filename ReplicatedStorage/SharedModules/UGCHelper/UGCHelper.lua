--// ReplicatedStorage.SharedModules.UGCHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("Signal")
local v_u_3 = v_u_1("CloudValues")
local v_u_4 = v_u_1("package:Sift")
local v_u_5 = game:GetService("RunService")
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = v2.new()
local v_u_9 = v2.new()
local v_u_10 = {}
local function v_u_14(p11)
    if p11 ~= nil then
        v_u_7 = v_u_4.Dictionary.map(p11, function(p12, p13)
            return p12, tonumber(p13)
        end)
        v_u_8:Fire()
    end
end
function v_u_10.init()
    if v_u_5:IsServer() then
        local v15 = v_u_1("DataM").get_global_store()
        local v16 = v15:get("ugc_infos")
        if v16 ~= nil then
            v_u_7 = v_u_4.Dictionary.map(v16, function(p17, p18)
                return p17, tonumber(p18)
            end)
            v_u_8:Fire()
        end
        v15:get_on_key_changed_event("ugc_infos"):Connect(v_u_14)
    else
        v_u_1("ClientData").register_callback_plus_existing("ugc_infos", function(_, p19)
            if p19 ~= nil then
                v_u_7 = v_u_4.Dictionary.map(p19, function(p20, p21)
                    return p20, tonumber(p21)
                end)
                v_u_8:Fire()
            end
        end)
    end
    v_u_3:onChange(function()
        local v22 = v_u_3:getValue("ugc", "asset_ids")
        if not v_u_4.List.equals(v_u_6, v22) then
            v_u_6 = v22
            v_u_9:Fire()
        end
    end)
end
function v_u_10.update_infos_in_store(p23)
    local v24 = v_u_5:IsServer()
    assert(v24, "UGC info may only be updated from the server.")
    v_u_1("DataM").get_global_store():set("ugc_infos", p23)
end
function v_u_10.get_infos()
    return v_u_7
end
function v_u_10.get_asset_ids()
    return v_u_6
end
function v_u_10.is_ugc_asset(p25)
    return table.find(v_u_6, p25) ~= nil
end
function v_u_10.get_info_for_asset_id(p26)
    return v_u_7[p26]
end
function v_u_10.get_infos_changed_signal()
    return v_u_8
end
function v_u_10.get_on_asset_ids_changed_signal()
    return v_u_9
end
function v_u_10.claimed_all_items_already(p27)
    local v28 = v_u_5:IsServer()
    local v_u_29
    if v28 then
        v_u_29 = p27:get_purchases()
    else
        v_u_29 = p27.purchases
    end
    local v30
    if v28 then
        v30 = p27:get_claimed()
    else
        v30 = p27.claimed
    end
    local v31 = v_u_10.get_asset_ids()
    if v_u_4.List.every(v31, function(p32)
        return v_u_4.List.find(v_u_29, p32) ~= nil
    end) then
        return #v31 - #v30 < 5
    else
        return false
    end
end
return v_u_10