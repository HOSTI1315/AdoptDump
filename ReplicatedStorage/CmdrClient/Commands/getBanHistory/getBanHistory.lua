--// ReplicatedStorage.CmdrClient.Commands.getBanHistory (ModuleScript)

local v1 = {
    ["Name"] = "getBanHistory",
    ["Aliases"] = {},
    ["Description"] = "View bans made via UserRestrictions (after October 8th 2024)",
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