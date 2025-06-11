--// ReplicatedStorage.CmdrClient.Commands.permaban (ModuleScript)

local v2 = {
    ["Name"] = "permaban",
    ["Aliases"] = {},
    ["Description"] = "Permanently bans a player from the game.",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player to ban."
        },
        {
            ["Type"] = "banReason",
            ["Name"] = "Reason",
            ["Description"] = "The reason for the ban."
        },
        function(p1)
            return p1.Arguments[2] and (p1.Arguments[2]:GetValue() and p1.Arguments[2]:GetValue().Name == "Custom") and {
                ["Type"] = "string",
                ["Name"] = "Custom reason",
                ["Description"] = "The user-facing reason for the ban"
            } or {
                ["Type"] = "string",
                ["Name"] = "Press Enter to confirm",
                ["Description"] = not (p1.Arguments[2] and p1.Arguments[2]:GetValue().Desc) and "" or p1.Arguments[2]:GetValue().Desc,
                ["Optional"] = true
            }
        end
    }
}
return v2