--// ReplicatedStorage.CmdrClient.Commands.removeallquests (ModuleScript)

local v1 = {
    ["Name"] = "removeallquests",
    ["Aliases"] = {},
    ["Description"] = "Removes all quests from a player",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "The player to remove all quests from.",
            ["Optional"] = true
        }
    }
}
return v1