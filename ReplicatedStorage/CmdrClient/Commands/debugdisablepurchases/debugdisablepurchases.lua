--// ReplicatedStorage.CmdrClient.Commands.debugdisablepurchases (ModuleScript)

local v1 = {
    ["Name"] = "debugdisablepurchases",
    ["Aliases"] = {},
    ["Description"] = "Used to test disabling all purchases.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "boolean",
            ["Name"] = "Disabled",
            ["Description"] = "Whether all purchases should be disabled",
            ["Default"] = true
        }
    }
}
return v1