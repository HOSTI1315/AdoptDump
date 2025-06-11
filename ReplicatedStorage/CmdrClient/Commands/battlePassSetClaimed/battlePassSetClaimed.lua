--// ReplicatedStorage.CmdrClient.Commands.battlePassSetClaimed (ModuleScript)

local v2 = {
    ["Name"] = "battlePassSetClaimed",
    ["Description"] = "Sets the claimed level of a battle pass.",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").battlePassId(),
                ["Name"] = "Battle Pass Id",
                ["Description"] = "The id of the battle pass to set."
            }
        end,
        {
            ["Type"] = "integer",
            ["Name"] = "Claimed",
            ["Description"] = "The reward id to set.",
            ["Default"] = 0
        },
        {
            ["Type"] = "playerIds",
            ["Name"] = "Players",
            ["Description"] = "Defaults to your player.",
            ["Optional"] = true
        }
    }
}
return v2