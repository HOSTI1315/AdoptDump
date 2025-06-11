--// ReplicatedStorage.CmdrClient.Commands.debugdisablepurchase (ModuleScript)

local v3 = {
    ["Name"] = "debugdisablepurchase",
    ["Aliases"] = {},
    ["Description"] = "Used to test the purchase disabling CloudValue system.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "itemCategory",
            ["Name"] = "Category",
            ["Description"] = "The item category to pick the item from."
        },
        function(p1)
            local v2 = p1.Arguments[1]:GetValue()
            return {
                ["Type"] = p1.Cmdr.Registry:GetStore("InstancedArgTypes").itemKind(v2),
                ["Name"] = "Kind",
                ["Description"] = "The item to enable/disable purchases for."
            }
        end,
        {
            ["Type"] = "boolean",
            ["Name"] = "Disabled",
            ["Description"] = "Whether the item should be disabled",
            ["Default"] = true
        }
    }
}
return v3