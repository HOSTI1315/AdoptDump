--// ReplicatedStorage.CmdrClient.Commands.getstreak (ModuleScript)

local v1 = {
    ["Name"] = "getstreak",
    ["Description"] = "Returns streak data for a given player.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The user to get the streak data of"
        }
    }
}
return v1