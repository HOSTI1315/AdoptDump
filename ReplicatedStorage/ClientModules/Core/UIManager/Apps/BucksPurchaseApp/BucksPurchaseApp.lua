--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.BucksPurchaseApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("CurrencyPurchaseBaseApp")
local v4 = v2("BucksPurchaseApp", v_u_3)
local v_u_5 = v1("BucksPricingGroupsDB")
function v4.start(p6)
    v_u_3.start(p6, "money", "Bucks", v_u_5.default)
end
return v4