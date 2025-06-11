--// ReplicatedStorage.CmdrClient.Commands.clearMultipliers (ModuleScript)

local v1 = {
    ["Name"] = "clearmultipliers",
    ["Aliases"] = { "clear_bonus" },
    ["Description"] = "Clears all server multipliers or a specific key.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "string",
            ["Name"] = "Key",
            ["Description"] = "Key to clear.",
            ["Optional"] = true
        }
    }
}
return v1