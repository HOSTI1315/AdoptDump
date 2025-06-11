--// ReplicatedStorage.CmdrClient.Commands.playerflag (ModuleScript)

local v2 = {
    ["Name"] = "playerflag",
    ["Aliases"] = {},
    ["Description"] = "Gets/sets the state of a player flag",
    ["Group"] = "Staff",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player"
        },
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("option", {
                    "trading_disabled",
                    "camera_tools",
                    "awarded_dj_compensation",
                    "chat_disabled"
                }),
                ["Name"] = "Flag",
                ["Description"] = "The flag to set"
            }
        end,
        {
            ["Type"] = "boolean",
            ["Name"] = "State",
            ["Description"] = "The flag\'s new value.",
            ["Optional"] = true
        }
    }
}
return v2