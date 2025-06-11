--// ReplicatedStorage.CmdrClient.Commands.freestuff (ModuleScript)

local v1 = {
    ["Name"] = "freestuff",
    ["Aliases"] = {},
    ["Description"] = "Adds the \"free stuff package\" to the given user.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player that gets the free stuff!"
        }
    }
}
return v1