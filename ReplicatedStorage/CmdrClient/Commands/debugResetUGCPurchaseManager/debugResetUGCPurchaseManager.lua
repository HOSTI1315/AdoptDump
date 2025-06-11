--// ReplicatedStorage.CmdrClient.Commands.debugResetUGCPurchaseManager (ModuleScript)

local v2 = {
    ["Name"] = "debugResetUGCPurchaseManager",
    ["Aliases"] = {},
    ["Description"] = "Resets the state of the UGC Purchase Manager.",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("option", { "all", "claimed" }),
                ["Name"] = "Data type",
                ["Description"] = "The type of data to clear."
            }
        end,
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player whose UGC Purchase Manager state will be reset.",
            ["Optional"] = true
        }
    }
}
return v2