--// ReplicatedStorage.CmdrClient.Commands.warp (ModuleScript)

local v2 = {
    ["Name"] = "warp",
    ["Aliases"] = {},
    ["Description"] = "Teleport to a predefined location in the game",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").availableLocations(),
                ["Name"] = "Location",
                ["Description"] = "The location to go to."
            }
        end,
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "The players to warp to this location.",
            ["Optional"] = true
        },
        {
            ["Type"] = "player",
            ["Name"] = "Player House",
            ["Description"] = "The players to warp to this location.",
            ["Optional"] = true
        }
    }
}
return v2