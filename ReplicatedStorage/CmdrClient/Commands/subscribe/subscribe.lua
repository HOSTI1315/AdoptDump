--// ReplicatedStorage.CmdrClient.Commands.subscribe (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("new:SubscriptionsDB")
local v_u_3 = v1("package:Sift").Dictionary.keys(v2)
local v6 = {
    ["Name"] = "subscribe",
    ["Aliases"] = {},
    ["Description"] = "Subscribes to to a subscription.",
    ["Group"] = "Staff",
    ["Args"] = {
        function(p4)
            return {
                ["Type"] = p4.Cmdr.Util.MakeEnumType("sub_ids", v_u_3),
                ["Name"] = "Subscription ID",
                ["Description"] = "Subscription to subscribe to."
            }
        end,
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player to subscribe."
        },
        {
            ["Type"] = "duration",
            ["Name"] = "Period Duration",
            ["Description"] = "How long a subscription period should last. (A value of 0 will default to 1 month.)",
            ["Optional"] = true,
            ["Default"] = 0
        },
        {
            ["Type"] = "duration",
            ["Name"] = "Start Offset",
            ["Description"] = "Start the subscription an offset time from now.",
            ["Optional"] = true,
            ["Default"] = 0
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "Renewing",
            ["Description"] = "If true, will renew instead of expiring.",
            ["Optional"] = true,
            ["Default"] = false
        },
        {
            ["Type"] = "duration",
            ["Name"] = "Payment Processed Delay",
            ["Description"] = "Delay before each payment processes.",
            ["Default"] = 0,
            ["Optional"] = true
        },
        function(p5)
            return {
                ["Type"] = p5.Cmdr.Util.MakeEnumType("subscription_source", { "subscription_certificate", "cmdr" }),
                ["Name"] = "Subscription Source",
                ["Description"] = "The source of this subscription",
                ["Default"] = "cmdr",
                ["Optional"] = true
            }
        end
    }
}
return v6