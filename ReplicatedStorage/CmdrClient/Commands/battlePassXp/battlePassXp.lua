--// ReplicatedStorage.CmdrClient.Commands.battlePassXp (ModuleScript)

local v2 = {
    ["Name"] = "battlePassXp",
    ["Aliases"] = { "xp" },
    ["Description"] = "Adds XP to a Battle Pass.",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").battlePassId(),
                ["Name"] = "Battle Pass Id",
                ["Description"] = "The id of the battle pass to give XP to."
            }
        end,
        {
            ["Type"] = "integer",
            ["Name"] = "XP",
            ["Description"] = "The number XP to gain.",
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