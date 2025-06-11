--// ReplicatedStorage.CmdrClient.Commands.istradebanned (ModuleScript)

local v1 = {
    ["Name"] = "istradebanned",
    ["Aliases"] = {},
    ["Description"] = "Check if a user is trade banned",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Players",
            ["Description"] = "The player to check"
        }
    }
}
return v1