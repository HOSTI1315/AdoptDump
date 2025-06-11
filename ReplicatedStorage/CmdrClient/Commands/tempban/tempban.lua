--// ReplicatedStorage.CmdrClient.Commands.tempban (ModuleScript)

local v2 = {
    ["Name"] = "tempban",
    ["Aliases"] = {},
    ["Description"] = "Temporarily bans a player from the game.",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player to ban."
        },
        {
            ["Type"] = "duration",
            ["Name"] = "Duration",
            ["Description"] = "The duration of the ban."
        },
        {
            ["Type"] = "banReason",
            ["Name"] = "Reason",
            ["Description"] = "The reason for the ban."
        },
        function(p1)
            return p1.Arguments[3] and (p1.Arguments[3]:GetValue() and p1.Arguments[3]:GetValue().Name == "Custom") and {
                ["Type"] = "string",
                ["Name"] = "Custom reason",
                ["Description"] = "The user-facing reason for the ban"
            } or {
                ["Type"] = "string",
                ["Name"] = "Press Enter to confirm",
                ["Description"] = not (p1.Arguments[3] and p1.Arguments[3]:GetValue().Desc) and "" or p1.Arguments[3]:GetValue().Desc,
                ["Optional"] = true
            }
        end
    }
}
return v2