--// ReplicatedStorage.CmdrClient.Commands.getcurrency (ModuleScript)

local v1 = {
    ["Name"] = "getcurrency",
    ["Description"] = "Returns each currency amount for a given player.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The user to get the currency of"
        }
    }
}
return v1