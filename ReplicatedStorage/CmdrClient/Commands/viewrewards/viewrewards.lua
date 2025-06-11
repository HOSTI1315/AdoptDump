--// ReplicatedStorage.CmdrClient.Commands.viewrewards (ModuleScript)

local v1 = {
    ["Name"] = "viewrewards",
    ["Aliases"] = {},
    ["Description"] = "View the pending rewards of a user.",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player to view the rewards of."
        }
    }
}
return v1