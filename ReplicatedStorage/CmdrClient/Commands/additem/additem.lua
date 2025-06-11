--// ReplicatedStorage.CmdrClient.Commands.additem (ModuleScript)

local v3 = {
    ["Name"] = "additem",
    ["Aliases"] = { "a" },
    ["Description"] = "Adds an item to the given players.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "itemCategory",
            ["Name"] = "Category",
            ["Description"] = "The item category to add from."
        },
        function(p1)
            local v2 = p1.Arguments[1]:GetValue()
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").itemKind(v2),
                ["Name"] = "Kind",
                ["Description"] = "The item to add."
            }
        end,
        {
            ["Type"] = "playerIds",
            ["Name"] = "Players",
            ["Description"] = "The player to give the item to. If omitted, the item is added to you.",
            ["Optional"] = true
        },
        {
            ["Type"] = "integer",
            ["Name"] = "Amount",
            ["Description"] = "The amount of this item to add.",
            ["Default"] = 1
        },
        {
            ["Type"] = "string",
            ["Name"] = "Properties",
            ["Description"] = "Extra properties for the item",
            ["Optional"] = true
        }
    }
}
return v3