--// ReplicatedStorage.CmdrClient.Commands.tradeban (ModuleScript)

local v3 = {
    ["Name"] = "tradeban",
    ["Aliases"] = {},
    ["Description"] = "Bans a player from trading.",
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
            ["Description"] = "The duration of the ban. (0 = Permaban)"
        },
        {
            ["Type"] = "banReason",
            ["Name"] = "Reason",
            ["Description"] = "The reason for the ban."
        },
        function(p1)
            local v2 = p1.Arguments[3]
            if v2 then
                v2 = p1.Arguments[3]:GetValue()
            end
            return v2 and v2.Name == "Custom" and {
                ["Type"] = "string",
                ["Name"] = "Custom reason",
                ["Description"] = "The user-facing reason for the ban"
            } or {
                ["Type"] = "string",
                ["Name"] = "Press Enter to confirm",
                ["Description"] = not (v2 and v2.Desc) and "" or v2.Desc,
                ["Optional"] = true
            }
        end
    }
}
return v3