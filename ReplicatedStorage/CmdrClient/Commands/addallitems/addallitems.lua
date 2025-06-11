--// ReplicatedStorage.CmdrClient.Commands.addallitems (ModuleScript)

local v1 = {
    ["Name"] = "addallitems",
    ["Aliases"] = {},
    ["Description"] = "Adds all items to the given players.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "The players to add the items to.",
            ["Optional"] = true
        },
        {
            ["Type"] = "itemCategory",
            ["Name"] = "Category",
            ["Description"] = "The item category to add from.",
            ["Optional"] = true
        },
        {
            ["Type"] = "string",
            ["Name"] = "Properties",
            ["Description"] = "Extra properties for the item",
            ["Optional"] = true
        }
    }
}
return v1