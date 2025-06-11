--// ReplicatedStorage.CmdrClient.Commands.resetUGCLinkedItems (ModuleScript)

local v1 = {
    ["Name"] = "reset_ugc_linked_items",
    ["Aliases"] = {},
    ["Description"] = "Resets the UGC-linked items a player has claimed.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player for whom the UGC-linked items state will be reset.",
            ["Optional"] = true
        }
    }
}
return v1