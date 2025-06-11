--// ReplicatedStorage.CmdrClient.Commands.removeallitemsoftype (ModuleScript)

local v3 = {
    ["Name"] = "removeallitemsoftype",
    ["Description"] = "Removes all copies of an item from a player.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "itemCategory",
            ["Name"] = "Category",
            ["Description"] = "The item category."
        },
        function(p1)
            local v2 = p1.Arguments[1]:GetValue()
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").itemKind(v2),
                ["Name"] = "Kind",
                ["Description"] = "The item to remove all copies of."
            }
        end,
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The user to remove from"
        }
    }
}
return v3