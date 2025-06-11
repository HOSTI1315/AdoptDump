--// ReplicatedStorage.CmdrClient.Commands.unsubscribe (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("new:SubscriptionsDB")
local v_u_3 = v1("package:Sift").Dictionary.keys(v2)
local v5 = {
    ["Name"] = "unsubscribe",
    ["Aliases"] = {},
    ["Description"] = "Unsubscribes to a subscription (DOES NOT WORK if player actually purchased subscription)",
    ["Group"] = "Staff",
    ["Args"] = {
        function(p4)
            return {
                ["Type"] = p4.Cmdr.Util.MakeEnumType("sub_ids", v_u_3),
                ["Name"] = "Subscription ID",
                ["Description"] = "Subscription ID to unsubscribe"
            }
        end,
        {
            ["Type"] = "player",
            ["Name"] = "Player",
            ["Description"] = "The player to unsubscribe."
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "Wipe Data",
            ["Description"] = "If true, also wipes all subscription data.",
            ["Optional"] = true
        }
    }
}
return v5