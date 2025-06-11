--// ReplicatedStorage.CmdrClient.Commands.battlePassEndEvent (ModuleScript)

local v2 = {
    ["Name"] = "battlePassEndEvent",
    ["Description"] = "Ends a battle pass event, if an event_end_timestamp is defined.",
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