--// ReplicatedStorage.CmdrClient.Commands.debugClaimUGCPurchases (ModuleScript)

local v1 = {
    ["Name"] = "debugClaimUGCPurchases",
    ["Aliases"] = {},
    ["Description"] = "Manually claims all UGC purchases.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player whose UGC Purchase Manager state will be modified.",
            ["Optional"] = true
        }
    }
}
return v1