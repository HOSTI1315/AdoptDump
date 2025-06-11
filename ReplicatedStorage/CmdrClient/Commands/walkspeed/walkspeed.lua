--// ReplicatedStorage.CmdrClient.Commands.walkspeed (ModuleScript)

local v1 = {
    ["Name"] = "walkspeed",
    ["Description"] = "Sets player characters walkspeed.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "integer",
            ["Name"] = "Speed",
            ["Description"] = "The speed of the characters.",
            ["Default"] = 16
        },
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "The players to set walkspeed for",
            ["Optional"] = true
        }
    }
}
return v1