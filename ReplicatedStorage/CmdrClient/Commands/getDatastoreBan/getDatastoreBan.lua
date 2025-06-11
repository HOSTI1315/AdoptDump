--// ReplicatedStorage.CmdrClient.Commands.getDatastoreBan (ModuleScript)

local v1 = {
    ["Name"] = "getDatastoreBan",
    ["Aliases"] = {},
    ["Description"] = "Check if a user is banned via Datastores (before October 8th 2024)",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Players",
            ["Description"] = "The player to check"
        }
    }
}
return v1