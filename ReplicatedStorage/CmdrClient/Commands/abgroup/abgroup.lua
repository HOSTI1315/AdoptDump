--// ReplicatedStorage.CmdrClient.Commands.abgroup (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("package:AB")
local v_u_3 = v1("package:Sift")
local function v_u_4()
    return v_u_3.Dictionary.values(v_u_2.getTestNames())
end
local v6 = {
    ["Name"] = "abgroup",
    ["Aliases"] = {},
    ["Description"] = "Check a player\'s current AB test group.",
    ["Group"] = "Debug",
    ["Args"] = {
        {
            ["Type"] = "players",
            ["Name"] = "Players",
            ["Description"] = "Players to check."
        },
        function(p5)
            return {
                ["Type"] = p5.Cmdr.Util.MakeEnumType("ABTest", v_u_4()),
                ["Name"] = "AB Test",
                ["Description"] = "The AB test to check."
            }
        end
    }
}
return v6