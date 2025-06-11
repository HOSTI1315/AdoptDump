--// ReplicatedStorage.CmdrClient.Commands.levelup (ModuleScript)

local v1 = {
    ["Name"] = "levelup",
    ["Aliases"] = {},
    ["Description"] = "Level up the pets of the given players",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "Players whose pets to level up",
            ["Optional"] = true
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Number of levels",
            ["Description"] = "Number of times to level up",
            ["Default"] = 1
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Number of ailments",
            ["Description"] = "Number of ailments to complete",
            ["Default"] = 0
        }
    }
}
return v1