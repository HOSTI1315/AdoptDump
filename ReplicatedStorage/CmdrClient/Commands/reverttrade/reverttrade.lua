--// ReplicatedStorage.CmdrClient.Commands.reverttrade (ModuleScript)

local v1 = {
    ["Name"] = "reverttrade",
    ["Aliases"] = {},
    ["Description"] = "Reverts a trade between two users, attempting to remove items from the recipient, potentially creating copies of items if not possible.",
    ["Group"] = "Admin",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Victim player",
            ["Description"] = "The player who should receive a full rollback"
        },
        {
            ["Type"] = "string",
            ["Name"] = "Trade ID",
            ["Description"] = "The trade ID you want to revert",
            ["Optional"] = true
        }
    }
}
return v1