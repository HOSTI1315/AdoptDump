--// ReplicatedStorage.CmdrClient.Commands.vip (ModuleScript)

local v2 = {
    ["Name"] = "vip",
    ["Aliases"] = {},
    ["Description"] = "Sets vip status",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("VIP Status", { "true", "pre2022", "false" }),
                ["Name"] = "VIP Status",
                ["Description"] = "VIP Status",
                ["Optional"] = true
            }
        end,
        {
            ["Type"] = "playerIds",
            ["Name"] = "Players",
            ["Description"] = "The player affected. If omitted, the player will be the caller.",
            ["Optional"] = true
        }
    }
}
return v2