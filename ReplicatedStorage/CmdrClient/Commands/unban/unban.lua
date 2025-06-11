--// ReplicatedStorage.CmdrClient.Commands.unban (ModuleScript)

local v1 = {
    ["Name"] = "unban",
    ["Aliases"] = {},
    ["Description"] = "Unbans a player who was previously banned. Works for permanent and temporary bans.",
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