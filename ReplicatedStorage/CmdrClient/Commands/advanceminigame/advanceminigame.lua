--// ReplicatedStorage.CmdrClient.Commands.advanceminigame (ModuleScript)

local v2 = {
    ["Name"] = "advanceminigame",
    ["Aliases"] = { "advance" },
    ["Description"] = "Advances the current time to the start time of a minigame.",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").minigameId(),
                ["Name"] = "Minigame Id",
                ["Description"] = "The id of the minigame to advance."
            }
        end,
        {
            ["Type"] = "integer",
            ["Name"] = "Seconds Before",
            ["Description"] = "The number of seconds before game start to advance to.",
            ["Default"] = 1
        }
    }
}
return v2