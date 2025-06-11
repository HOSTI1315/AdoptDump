--// ReplicatedStorage.CmdrClient.Types.filter (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("package:JMESPath")
return function(p2)
    p2:RegisterType("filter", {
        ["Validate"] = function(p3)
            return pcall(v_u_1.search, p3, {})
        end,
        ["Parse"] = function(p_u_4)
            return {
                ["parse"] = function(p5)
                    return v_u_1.search(p_u_4, p5)
                end
            }
        end
    })
end