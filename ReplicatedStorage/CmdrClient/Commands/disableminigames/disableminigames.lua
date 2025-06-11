--// ReplicatedStorage.CmdrClient.Commands.disableminigames (ModuleScript)

return {
    ["Name"] = "disableminigames",
    ["Aliases"] = {},
    ["Description"] = "Sets which minigames are not included in the schedule.",
    ["Group"] = "Debug",
    ["Args"] = { function(p1)
            local v2 = p1.Cmdr.Registry:GetStore("InstancedArgTypes").minigameId
            return {
                ["Type"] = p1.Cmdr.Util.MakeListableType(v2()),
                ["Name"] = "Minigame Ids",
                ["Description"] = "The ids of the minigames to disable.",
                ["Optional"] = true
            }
        end }
}