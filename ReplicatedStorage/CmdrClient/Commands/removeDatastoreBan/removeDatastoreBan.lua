--// ReplicatedStorage.CmdrClient.Commands.removeDatastoreBan (ModuleScript)

local v1 = {
    ["Name"] = "removeDatastoreBan",
    ["Aliases"] = { "unpermaban", "untempban" },
    ["Description"] = "Unbans a player who was previously banned via Datastores (before October 8th 2024). Works for permanent and temporary bans.",
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