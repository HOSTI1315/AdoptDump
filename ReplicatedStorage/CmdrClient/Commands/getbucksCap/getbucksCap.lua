--// ReplicatedStorage.CmdrClient.Commands.getbucksCap (ModuleScript)

local v1 = {
    ["Name"] = "getbuckscap",
    ["Aliases"] = {},
    ["Description"] = "Gets the bucks cap for player",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "The players to get print the bucks cap of",
            ["Optional"] = true
        }
    }
}
return v1