--// ReplicatedStorage.CmdrClient.Commands.removeitem (ModuleScript)

local v2 = {
    ["Name"] = "removeitem",
    ["Aliases"] = {},
    ["Description"] = "Removes an item from the given player.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The user to remove from"
        },
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").userInventoryItem((p1.Arguments[1]:GetValue())),
                ["Name"] = "Item",
                ["Description"] = "The item to remove"
            }
        end
    }
}
return v2