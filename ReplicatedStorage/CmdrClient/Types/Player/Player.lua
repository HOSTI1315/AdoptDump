--// ReplicatedStorage.CmdrClient.Types.Player (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Shared.Util)
local v_u_2 = game:GetService("Players")
local v_u_8 = {
    ["Transform"] = function(p3)
        return v_u_1.MakeFuzzyFinder(v_u_2:GetPlayers())(p3)
    end,
    ["Validate"] = function(p4)
        return #p4 > 0, "No player with that name could be found."
    end,
    ["Autocomplete"] = function(p5)
        return v_u_1.GetNames(p5)
    end,
    ["Parse"] = function(p6)
        return p6[1]
    end,
    ["Default"] = function(p7)
        return p7.Name
    end,
    ["ArgumentOperatorAliases"] = {
        ["me"] = ".",
        ["all"] = "*",
        ["others"] = "**",
        ["random"] = "?"
    }
}
return function(p9)
    p9:RegisterType("player", v_u_8)
    p9:RegisterType("players", v_u_1.MakeListableType(v_u_8, {
        ["Prefixes"] = "% teamPlayers"
    }))
end