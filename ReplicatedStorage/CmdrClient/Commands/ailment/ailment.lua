--// ReplicatedStorage.CmdrClient.Commands.ailment (ModuleScript)

local v2 = {
    ["Name"] = "ailment",
    ["Aliases"] = {},
    ["Description"] = "Add or clear an ailment",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "Players to affect"
        },
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("option", { "add", "clear" }),
                ["Name"] = "Action",
                ["Description"] = "Add or clear"
            }
        end,
        {
            ["Type"] = "ailments",
            ["Name"] = "Ailment(s)",
            ["Description"] = "Ailments to add or clear"
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "Force Preference",
            ["Description"] = "Forces whether the ailment has a specific item request",
            ["Optional"] = true
        }
    }
}
return v2