--// ReplicatedStorage.CmdrClient.Commands.rollHistory (ModuleScript)

local v1 = {
    ["Name"] = "rollHistory",
    ["Aliases"] = {},
    ["Description"] = "Displays server roll history for the given player.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player to display roll history for."
        }
    }
}
return v1