--// ReplicatedStorage.CmdrClient.Commands.watchmode (ModuleScript)

local v1 = {
    ["Name"] = "watchmode",
    ["Aliases"] = {},
    ["Description"] = "Enters / exits player watch mode, which:\n* Hides your character from others\n* Allows you to enter all interiors\n* Shows you all private chats",
    ["Group"] = "Staff",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "The players to enter observation mode. Defaults to yourself.",
            ["Optional"] = true
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "State",
            ["Description"] = "Whether the player should be in watch mode. If absent, toggles watch mode.",
            ["Optional"] = true
        }
    }
}
return v1