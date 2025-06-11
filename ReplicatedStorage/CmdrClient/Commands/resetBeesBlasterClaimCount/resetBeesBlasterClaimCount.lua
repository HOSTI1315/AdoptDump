--// ReplicatedStorage.CmdrClient.Commands.resetBeesBlasterClaimCount (ModuleScript)

local v1 = {
    ["Name"] = "reset_bees_blaster_claim_count",
    ["Aliases"] = {},
    ["Description"] = "Resets the number of BEES! Blasters a player has claimed.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player who\'s claim count will be reset.",
            ["Optional"] = true
        }
    }
}
return v1