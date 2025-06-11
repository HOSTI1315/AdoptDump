--// ReplicatedStorage.CmdrClient.Types.Command (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Shared.Util)
return function(p_u_2)
    local v7 = {
        ["Transform"] = function(p3)
            return v_u_1.MakeFuzzyFinder(p_u_2:GetCommandNames())(p3)
        end,
        ["Validate"] = function(p4)
            return #p4 > 0, "No command with that name could be found."
        end,
        ["Autocomplete"] = function(p5)
            return p5
        end,
        ["Parse"] = function(p6)
            return p6[1]
        end
    }
    p_u_2:RegisterType("command", v7)
    p_u_2:RegisterType("commands", v_u_1.MakeListableType(v7))
end