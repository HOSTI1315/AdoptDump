--// ReplicatedStorage.CmdrClient.Commands.addalleggs (ModuleScript)

local v1 = {
    ["Name"] = "addalleggs",
    ["Aliases"] = {},
    ["Description"] = "Adds all eggs to the given players.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "The players to add the eggs to.",
            ["Optional"] = true
        }
    }
}
return v1