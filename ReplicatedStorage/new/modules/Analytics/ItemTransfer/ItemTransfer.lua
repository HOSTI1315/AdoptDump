--// ReplicatedStorage.new.modules.Analytics.ItemTransfer (ModuleScript)

local v_u_1 = game:GetService("AnalyticsService")
local v_u_2 = require(script.Parent.Parent.LegacyLoad)("DataM")
return {
    ["log"] = function(p3)
        local v4 = p3.sender
        local v5 = p3.kind
        local v6 = #v_u_2.get_store(v4):get("inventory"):get_items_with_kind(v5)
        local v7 = p3.recipient
        local v8 = p3.kind
        local v9 = #v_u_2.get_store(v7):get("inventory"):get_items_with_kind(v8)
        v_u_1:LogEconomyEvent(p3.sender, Enum.AnalyticsEconomyFlowType.Source, "item", 1, v6, p3.event_type, p3.kind)
        v_u_1:LogEconomyEvent(p3.recipient, Enum.AnalyticsEconomyFlowType.Sink, "item", 1, v9, p3.event_type, p3.kind)
    end
}