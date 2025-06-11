--// ReplicatedStorage.SharedModules.PolicyHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("TableUtil")
local v_u_3 = v_u_1("CloudValues")
local v_u_4 = v_u_1("package:Sift")
local v_u_5 = game:GetService("RunService")
local v_u_6 = {
    ["ArePaidRandomItemsRestricted"] = false,
    ["IsSubjectToChinaPolicies"] = false,
    ["AllowedExternalLinkReferences"] = {},
    ["IsPaidItemTradingAllowed"] = true,
    ["AreAdsAllowed"] = true,
    ["IsEligibleToPurchaseSubscription"] = false
}
local v_u_7 = {
    "YouTube",
    "Twitch",
    "Facebook",
    "Twitter",
    "Discord"
}
local v_u_8 = {}
local function v_u_12(p9)
    if v_u_5:IsClient() then
        local v10 = p9 == game.Players.LocalPlayer
        assert(v10, "Can only get policy info for the local player on the client")
        return v_u_1("ClientData").get_server(p9, "policy_info")
    else
        local v11 = v_u_1("DataM").get_store(p9)
        if v11 == nil or v11.destroyed then
            return nil
        else
            return v11:get("policy_info")
        end
    end
end
function v_u_8.is_loaded(p13)
    if v_u_5:IsClient() then
        local v14 = p13 == game.Players.LocalPlayer
        assert(v14, "Can only get policy info for the local player on the client")
        return v_u_1("ClientData").get("policy_info") ~= nil
    end
    local v15 = v_u_1("DataM").get_store(p13)
    local v16 = v15 ~= nil and not v15.destroyed
    if v16 then
        v16 = v15:get("policy_info") ~= nil
    end
    return v16
end
function v_u_8.get_policy_info(p17)
    return v_u_4.Dictionary.merge(v_u_6, v_u_12(p17) or {})
end
function v_u_8.is_all_trading_disabled()
    return v_u_3:getValue("trading", "disableAllTrading"), "Trading is disabled for maintenance and will be enabled soon."
end
function v_u_8.is_trading_prohibited(p18)
    if v_u_3:getValue("trading", "disableAllTrading") then
        return true, "Trading is disabled for maintenance and will be enabled soon."
    elseif v_u_8.get_policy_info(p18).IsPaidItemTradingAllowed then
        return false, nil
    else
        return true, "Laws in your country don\'t allow you to trade."
    end
end
function v_u_8.is_trading_prohibited_between_players(p19, p20)
    local v21 = not v_u_8.get_policy_info(p19).IsPaidItemTradingAllowed
    local v22 = not v_u_8.get_policy_info(p20).IsPaidItemTradingAllowed
    if v_u_3:getValue("trading", "disableAllTrading") then
        return true, "Trading is disabled for maintenance and will be enabled soon.", "Trading is disabled for maintenance and will be enabled soon."
    elseif v21 or v22 then
        return true, v21 and "Laws in your country don\'t allow you to trade." or nil, v22 and "Laws in your country don\'t allow you to trade." or nil
    else
        return false, nil, nil
    end
end
function v_u_8.is_external_link_allowed(p23, p24)
    local v25 = v_u_2.is_member(v_u_7, p24)
    assert(v25, "Supplied link is not recognised as valid")
    local v26 = v_u_8.get_policy_info(p23).AllowedExternalLinkReferences
    return v_u_2.is_member(v26, p24) and true or false
end
return v_u_8