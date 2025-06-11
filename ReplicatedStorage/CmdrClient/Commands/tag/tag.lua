--// ReplicatedStorage.CmdrClient.Commands.tag (ModuleScript)

local v2 = {
    ["Name"] = "tag",
    ["Aliases"] = {},
    ["Description"] = "Sets a player\'s tag",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player whose tag to set."
        },
        function(p1)
            return {
                ["Type"] = p1.Cmdr.Util.MakeEnumType("Tag", {
                    "none",
                    "vip",
                    "staff",
                    "developer",
                    "founder",
                    "friend",
                    "influencer"
                }),
                ["Name"] = "tag",
                ["Description"] = "Tag to set"
            }
        end
    }
}
return v2