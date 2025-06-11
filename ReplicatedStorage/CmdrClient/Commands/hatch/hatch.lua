--// ReplicatedStorage.CmdrClient.Commands.hatch (ModuleScript)

local v1 = {
    ["Name"] = "hatch",
    ["Aliases"] = {},
    ["Description"] = "Hatch egg",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "Players to affect",
            ["Optional"] = true
        }
    }
}
return v1