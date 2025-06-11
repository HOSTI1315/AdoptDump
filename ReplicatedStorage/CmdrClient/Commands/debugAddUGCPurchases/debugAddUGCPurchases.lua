--// ReplicatedStorage.CmdrClient.Commands.debugAddUGCPurchases (ModuleScript)

local v1 = {
    ["Name"] = "debugAddUGCPurchases",
    ["Aliases"] = {},
    ["Description"] = "Manually adds asset ids to the list of purchases.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "string",
            ["Name"] = "AssetIds",
            ["Description"] = "List of asset ids to add, separated by commas (no spaces).",
            ["Optional"] = true
        },
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player whose UGC Purchase Manager and UGC-Linked Items states will be modified.",
            ["Optional"] = true
        }
    }
}
return v1