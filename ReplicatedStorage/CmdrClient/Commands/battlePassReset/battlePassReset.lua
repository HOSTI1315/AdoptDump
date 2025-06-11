--// ReplicatedStorage.CmdrClient.Commands.battlePassReset (ModuleScript)

local v2 = {
    ["Name"] = "battlePassReset",
    ["Description"] = "Resets all XP and claimed rewards for a battle pass.",
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