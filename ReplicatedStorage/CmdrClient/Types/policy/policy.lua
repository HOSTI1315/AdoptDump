--// ReplicatedStorage.CmdrClient.Types.policy (ModuleScript)

return function(p1)
    p1:RegisterType("policy", p1.Cmdr.Util.MakeEnumType("Policy", {
        "IsPaidItemTradingAllowed",
        "ArePaidRandomItemsRestricted",
        "IsSubjectToChinaPolicies",
        "AreAdsAllowed",
        "IsEligibleToPurchaseSubscription"
    }))
end