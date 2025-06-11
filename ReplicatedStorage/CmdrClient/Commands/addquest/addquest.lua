--// ReplicatedStorage.CmdrClient.Commands.addquest (ModuleScript)

local v1 = {
    ["Name"] = "addquest",
    ["Aliases"] = {},
    ["Description"] = "Adds a quest to the given players.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "quests",
            ["Name"] = "Quest(s)",
            ["Description"] = "The quest to give.",
            ["Optional"] = false
        },
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "The player to give the quest to.",
            ["Optional"] = true
        }
    }
}
return v1