--// ReplicatedStorage.CmdrClient.Commands.clearailments (ModuleScript)

local v1 = {
    ["Name"] = "clearailments",
    ["Aliases"] = { "clearallailments" },
    ["Description"] = "Clears all ailments",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "Players to affect"
        }
    }
}
return v1