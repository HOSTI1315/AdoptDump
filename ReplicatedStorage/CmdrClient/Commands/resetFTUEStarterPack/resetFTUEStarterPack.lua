--// ReplicatedStorage.CmdrClient.Commands.resetFTUEStarterPack (ModuleScript)

local v1 = {
    ["Name"] = "resetFTUEStarterPack",
    ["Aliases"] = {},
    ["Description"] = "Resets the state of the FTUE Starter Pack.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player whose FTUE Starter Pack state will be reset.",
            ["Optional"] = true
        }
    }
}
return v1