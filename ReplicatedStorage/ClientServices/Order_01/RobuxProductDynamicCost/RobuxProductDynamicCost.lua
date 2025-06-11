--// ReplicatedStorage.ClientServices.Order_01.RobuxProductDynamicCost (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("DeveloperProductDB")
local v_u_3 = v1("GamepassDB")
local v_u_4 = v1("RouterClient")
local v5 = v1("Signal")
local v_u_6 = game:GetService("MarketplaceService")
local v_u_7 = {
    ["prices_changed"] = v5.new()
}
local v_u_8 = false
local function v_u_18(p9, p10, p_u_11, p_u_12)
    local v_u_13 = nil
    local v14 = 0.016666666666666666
    while true do
        local v15, v16 = pcall(function()
            v_u_13 = v_u_6:GetProductInfo(p_u_11, p_u_12)
        end)
        if v15 then
            break
        end
        warn((("[RobuxProductDynamicCost] Failed to fetch product info for %*:\n  %*"):format(p9, v16)))
        task.wait(v14)
        local v17 = v14 * 2
        v14 = math.min(v17, 10)
    end
    if v_u_13 and v_u_13.PriceInRobux then
        p10.cost = v_u_13.PriceInRobux
        if not v_u_8 then
            v_u_8 = true
            task.delay(1, function()
                v_u_8 = false
                v_u_7.prices_changed:Fire()
            end)
        end
    end
end
local function v_u_23()
    for v19, v20 in v_u_2 do
        if v20.cost and v20.product_id then
            task.spawn(v_u_18, v19, v20, v20.product_id, Enum.InfoType.Product)
        end
    end
    for v21, v22 in v_u_3 do
        if v22.cost and v22.id then
            task.spawn(v_u_18, v21, v22, v22.id, Enum.InfoType.GamePass)
        end
    end
end
function v_u_7.init()
    task.spawn(v_u_23)
    v_u_4.get("ProductsAPI/GetClientPurchasePrice").OnClientInvoke = function(p24)
        return v_u_6:GetProductInfo(p24, Enum.InfoType.GamePass).PriceInRobux
    end
end
return v_u_7