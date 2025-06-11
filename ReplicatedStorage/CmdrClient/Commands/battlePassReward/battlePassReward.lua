--// ReplicatedStorage.CmdrClient.Commands.battlePassReward (ModuleScript)

local v2 = {
    ["Name"] = "battlePassReward",
    ["Description"] = "Attempts to claim the next reward in the battle pass.",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").battlePassId(),
                ["Name"] = "Battle Pass Id",
                ["Description"] = "The id of the battle pass."
            }
        end,
        {
            ["Type"] = "playerIds",
            ["Name"] = "Players",
            ["Description"] = "Defaults to your player.",
            ["Optional"] = true
        }
    }
}
return v2