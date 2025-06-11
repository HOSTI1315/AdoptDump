--// ReplicatedStorage.CmdrClient.Commands.untradeban (ModuleScript)

local v1 = {
    ["Name"] = "untradeban",
    ["Aliases"] = {},
    ["Description"] = "Un-trade bans a player, allowing them to trade.",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player to unban."
        }
    }
}
return v1