--// ReplicatedStorage.CmdrClient.Commands.debugLocalization (ModuleScript)

return {
    ["Name"] = "debugLocalization",
    ["Aliases"] = { "localizationDebug", "locDebug", "debugLoc" },
    ["Description"] = "Sets the value of a localization debug setting",
    ["Group"] = "Staff",
    ["Args"] = { function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("option", { "DisplayMode" }),
                ["Name"] = "Setting",
                ["Description"] = "setting to change"
            }
        end, function(p2)
            local v3 = p2.Arguments[1]
            if v3 then
                v3 = p2.Arguments[1]:GetValue()
            end
            if v3 == "DisplayMode" then
                return {
                    ["Type"] = p2.Cmdr.Util.MakeEnumType("option", { "Hide_all_translated_strings", "Show_keys_of_all_translated_strings", "Normal_behavior" }),
                    ["Name"] = "Value",
                    ["Description"] = "desired behavior for displaying translated strings"
                }
            end
        end }
}