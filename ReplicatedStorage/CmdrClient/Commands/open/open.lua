--// ReplicatedStorage.CmdrClient.Commands.open (ModuleScript)

local v3 = {
    ["Name"] = "open",
    ["Aliases"] = { "unbox" },
    ["Description"] = "Opens/unboxes/hatches an item for the given player.",
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
                ["Description"] = "The item to open."
            }
        end,
        {
            ["Type"] = "integer",
            ["Name"] = "Amount",
            ["Description"] = "The amount of this item to open.",
            ["Default"] = 1
        }
    }
}
return v3