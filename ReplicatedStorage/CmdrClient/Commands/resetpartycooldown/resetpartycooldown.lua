--// ReplicatedStorage.CmdrClient.Commands.resetpartycooldown (ModuleScript)

local v1 = {
    ["Name"] = "resetpartycooldown",
    ["Aliases"] = {},
    ["Description"] = "Resets the party cooldown for 1 or more players",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "The players to reset the cooldown for",
            ["Optional"] = true
        }
    }
}
return v1