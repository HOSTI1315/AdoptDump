--// ReplicatedStorage.CmdrClient.Commands.cleardata (ModuleScript)

local v1 = {
    ["Name"] = "cleardata",
    ["Aliases"] = {},
    ["Description"] = "Clears a player\'s data",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "userDataType",
            ["Name"] = "Data type",
            ["Description"] = "The type of data to clear."
        },
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player\'s data to clear."
        }
    }
}
return v1