--// ReplicatedStorage.SharedModules.SharedDB.AltCurrencyData (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("CloudValues")
local v3 = v_u_1("AltCurrencyDB")
local v_u_4 = v_u_1("DeveloperProductCallbacks")
local v_u_5 = v_u_1("package:Sift")
local v_u_6 = {
    ["enabled"] = false,
    ["name"] = "cherry_blossoms_2025",
    ["currency_type"] = "cherry_blossoms",
    ["purchasable"] = true,
    ["hide_indicator"] = true
}
local v_u_7 = {
    "A",
    "B",
    "C",
    "D",
    "E",
    "F"
}
local v_u_8 = {
    ["D"] = "GOOD VALUE",
    ["E"] = "GREAT VALUE",
    ["F"] = "BEST DEAL!"
}
local function v13(p9)
    return not (v_u_6.enabled and v_u_6.purchasable) and {} or v_u_5.Dictionary.map(p9, function(p10, p11)
        local v12 = v_u_7[p11]
        return {
            ["reward_type"] = v_u_6.name,
            ["name"] = v_u_6.name .. " " .. v12,
            ["reward_amount"] = p10.reward_amount,
            ["cost"] = p10.cost,
            ["tag"] = v_u_8[v12] or nil,
            ["product_id"] = p10.product_id,
            ["image_id"] = p10.image_id,
            ["callback"] = v_u_4.currency
        }, v_u_6.name:lower() .. v12
    end)
end
local v14 = v3[v_u_6.currency_type]
v_u_6 = v_u_5.Dictionary.join(v14, v_u_6, {
    ["developer_products"] = v13(v14.developer_products)
})
local v_u_15 = {
    ["hour"] = 7,
    ["minute"] = 50
}
function v_u_6.get_takedown_timestamp()
    if not v_u_2:getValue("purchases", "useAltCurrencyTakedownDate") then
        return nil
    end
    local v16 = v_u_5.Dictionary.join(v_u_15, v_u_2:getValue("purchases", "altCurrencyTakedownDate"))
    return v_u_1("TimeZoneHelper").from_region_datetime("PT", v16.year, v16.month, v16.day, v16.hour, v16.minute).UnixTimestamp
end
function v_u_6.is_taken_down()
    local v17 = v_u_6.get_takedown_timestamp()
    if v17 then
        return v_u_1("LiveOpsTime").has_happened(v17)
    else
        return v_u_2:getValue("purchases", "suspendAltCurrencyPurchases")
    end
end
return v_u_6