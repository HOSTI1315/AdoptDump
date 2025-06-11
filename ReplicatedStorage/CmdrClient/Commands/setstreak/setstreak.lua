--// ReplicatedStorage.CmdrClient.Commands.setstreak (ModuleScript)

local v1 = {
    ["Name"] = "setstreak",
    ["Aliases"] = {},
    ["Description"] = "Sets a player\'s login streak to a specific value.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player whose streak to set."
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Streak",
            ["Description"] = "Amount of days to set the streak to."
        }
    }
}
return v1