--// ReplicatedStorage.CmdrClient.Commands.getitem (ModuleScript)

local v3 = {
    ["Name"] = "getitem",
    ["Description"] = "Returns a list of items of a particular kind in a player\'s inventory, and when they first obtained it (if ever).",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "itemCategory",
            ["Name"] = "Category",
            ["Description"] = "The item category to find."
        },
        function(p1)
            local v2 = p1.Arguments[1]:GetValue()
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").itemKind(v2),
                ["Name"] = "Kind",
                ["Description"] = "The item to find."
            }
        end,
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The user to get the item information from"
        }
    }
}
return v3