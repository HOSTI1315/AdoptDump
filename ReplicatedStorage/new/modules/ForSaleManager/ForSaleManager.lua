--// ReplicatedStorage.new.modules.ForSaleManager (ModuleScript)

local v_u_1 = require(script.Parent.HotspotsByInterior)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_3 = require(game.ReplicatedStorage.Fsys).load
local v_u_4 = v_u_3("CloudValues")
local v5 = v_u_3("ContentPackHelper")
local v_u_6 = v_u_3("FurnitureDB")
local v_u_7 = v_u_3("FurnitureUseDB")
local v_u_8 = v_u_3("InventoryDB")
local v_u_9 = v_u_3("KindDB")
local v_u_10 = v_u_3("LiveOpsMapSwap")
local v_u_11 = v_u_3("RefreshmentsDB")
local v_u_12 = game:GetService("RunService")
local v_u_13 = {}
local v_u_14 = {}
function v_u_13.get_interiors(p15)
    local v16 = {}
    local v17
    if v_u_12:IsServer() then
        v17 = v_u_1.get_server().items
    else
        v17 = v_u_1.get_client():expect().items
    end
    if v17[p15] then
        for v18, _ in v17[p15] do
            table.insert(v16, v18)
        end
    end
    return v16
end
function v_u_13.get_furniture_kinds(p19)
    local v20 = {}
    for v21, v22 in v_u_7 do
        if v22.items_to_acquire and (v_u_2.List.find(v22.items_to_acquire, p19) ~= nil and (v_u_6[v21].cost ~= nil or v_u_8.toys[v21] ~= nil)) then
            table.insert(v20, v21)
        end
    end
    return v20
end
function v_u_13.get_stand_kinds(p23)
    local v24 = {}
    for v25, v26 in v_u_11 do
        if v26.refreshment_item.kind == p23 then
            table.insert(v24, v25)
        end
    end
    return v24
end
function v_u_13.is_in_hatshop_rotation(p_u_27)
    if v_u_12:IsServer() then
        return v_u_3("HatShopRotation").is_on_sale(p_u_27)
    end
    local v28 = v_u_3("ClientData").get("hat_shop_stock")
    return v_u_2.List.some(v28, function(p29)
        return p29.accessory_id == p_u_27
    end)
end
local function v_u_32(p30, _)
    local v31 = v_u_9[p30]
    if v31.cost then
        if v31.origin_entry and v31.origin_entry.only_has_dev_product then
            return false
        elseif v31.liveops_map_type_required_for_purchase and v31.liveops_map_type_required_for_purchase ~= v_u_10.get_current_map_type() then
            return false
        elseif v31.is_in_hatshop_rotation then
            return v_u_13.is_in_hatshop_rotation(v31.kind)
        else
            return (next(v_u_13.get_interiors(p30)) or (next(v_u_13.get_furniture_kinds(p30)) or next(v_u_13.get_stand_kinds(p30)))) and true or false
        end
    else
        return false
    end
end
function v_u_13.has_custom_callback(p33)
    return v_u_14[p33] ~= nil
end
function v_u_13.is_for_sale(p34, p35)
    return (v_u_14[p34] or v_u_32)(p34, p35)
end
function v_u_13.are_all_purchases_disabled()
    return v_u_4:getValue("purchases", "suspendAllPurchases")
end
function v_u_13.is_item_purchase_disabled(p36)
    return v_u_4:getValue("item_control", "non_purchasable_items")[p36] or false
end
v5.merge("ForSaleCallbacks", v_u_14)
return v_u_13