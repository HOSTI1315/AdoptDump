--// ReplicatedStorage.CmdrClient.Commands.overrideGroupRank (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("GroupRankHelper")
local v_u_3 = v1("package:Sift")
local v_u_4 = nil
local v9 = {
    ["Name"] = "override_group_rank",
    ["Aliases"] = {},
    ["Description"] = "Override a player\'s rank in the Uplift Games group.",
    ["Group"] = "Debug",
    ["Args"] = {
        function(p5)
            if not v_u_4 then
                local v6 = v_u_3.Dictionary.copy(v_u_2.get_group_info().Roles)
                local v8 = v_u_3.Dictionary.map(v6, function(p7)
                    p7.Name = p7.Name .. " - " .. p7.Rank
                    return p7
                end)
                table.insert(v8, {
                    ["Name"] = "[clear]"
                })
                v_u_4 = v8
            end
            return {
                ["Type"] = p5.Cmdr.Util.MakeEnumType("GroupRoles", v_u_4),
                ["Name"] = "Group Role",
                ["Description"] = "The new group role to assign the player."
            }
        end,
        {
            ["Type"] = "playerIds",
            ["Name"] = "Players",
            ["Description"] = "Players to affect",
            ["Optional"] = true
        },
        {
            ["Type"] = "boolean",
            ["Name"] = "Save",
            ["Description"] = "Save the override for future sessions",
            ["Optional"] = true
        }
    }
}
return v9