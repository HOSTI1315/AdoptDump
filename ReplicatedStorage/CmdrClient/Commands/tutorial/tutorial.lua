--// ReplicatedStorage.CmdrClient.Commands.tutorial (ModuleScript)

local v_u_1 = {
    "control",
    "legacy_no_egg",
    "adoption_day",
    "adoption_day_skip_park",
    "adoption_day_egg",
    "free_furniture",
    "egg_outside_house",
    "free_cracked_egg"
}
local v7 = {
    ["Name"] = "tutorial",
    ["Aliases"] = {},
    ["Description"] = "Modify tutorial data",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "playerId",
            ["Name"] = "Player",
            ["Description"] = "The player whose tutorial status to modify."
        },
        function(p2)
            return {
                ["Type"] = p2.Cmdr.Util.MakeEnumType("option", { "reset", "complete" }),
                ["Name"] = "Action",
                ["Description"] = "Reset or complete the tutorial."
            }
        end
    },
    ["AutoExec"] = (function()
        local v3 = {}
        for _, v4 in v_u_1 do
            local v5 = {
                "tutorial . reset",
                "cleardata ABTests . && cleardata ABTests .",
                "cleardata Houses . && cleardata Houses .",
                ("abgroupoverride . %* %* true"):format("tutorial_2025", v4),
                (("echo \"You are assigned to the %* group now. Remember to rejoin the game!\""):format(v4))
            }
            local v6 = ("alias \"tutorial_%*|%*\" %*"):format(v4, ("Run this command to test the %* group."):format(v4), (table.concat(v5, " && ")))
            table.insert(v3, v6)
        end
        return v3
    end)()
}
return v7