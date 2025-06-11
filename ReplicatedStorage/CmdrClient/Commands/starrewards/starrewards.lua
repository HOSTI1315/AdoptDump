--// ReplicatedStorage.CmdrClient.Commands.starrewards (ModuleScript)

return {
    ["Name"] = "starrewards",
    ["Aliases"] = { "star" },
    ["Description"] = "Perform operations related to star rewards.",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("Action", { "stars", "claim", "page" }),
                ["Name"] = "Action",
                ["Description"] = "Action"
            }
        end,
        function(p2)
            local v3 = p2.Arguments[1]:GetValue()
            if v3 == "stars" then
                return {
                    ["Type"] = "operator",
                    ["Name"] = "Operator",
                    ["Description"] = "The operation to perform on the stars."
                }
            end
            if v3 == "page" then
                return {
                    ["Type"] = "playerIds",
                    ["Name"] = "Players",
                    ["Description"] = "The players to affect. Omit to affect yourself.",
                    ["Optional"] = true
                }
            end
            if v3 == "claim" then
                return {
                    ["Type"] = "integer",
                    ["Name"] = "Reward Number",
                    ["Description"] = "The number of the reward to claim up to on the current page."
                }
            end
        end,
        function(p4)
            local v5 = p4.Arguments[1]:GetValue()
            if v5 == "stars" then
                return {
                    ["Type"] = "integer",
                    ["Name"] = "Amount",
                    ["Description"] = "The amount of stars to set."
                }
            end
            if v5 == "claim" then
                return {
                    ["Type"] = "playerIds",
                    ["Name"] = "Players",
                    ["Description"] = "The players to affect. Omit to affect yourself.",
                    ["Optional"] = true
                }
            end
        end,
        function(p6)
            local v7 = p6.Arguments[1]:GetValue()
            if v7 == "stars" then
                return {
                    ["Type"] = "playerIds",
                    ["Name"] = "Players",
                    ["Description"] = "The players to affect. Omit to affect yourself.",
                    ["Optional"] = true
                }
            end
            if v7 == "claim" then
                return {
                    ["Type"] = "boolean",
                    ["Name"] = "BlockPrestige",
                    ["Description"] = "Don\'t prestige if all items are claimed on a page",
                    ["Optional"] = true
                }
            end
        end
    }
}