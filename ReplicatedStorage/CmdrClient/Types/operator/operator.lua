--// ReplicatedStorage.CmdrClient.Types.operator (ModuleScript)

return function(p1)
    p1:RegisterType("operator", p1.Cmdr.Util.MakeEnumType("Operator", {
        {
            ["Name"] = "set",
            ["Perform"] = function(_, p2)
                return p2
            end
        },
        {
            ["Name"] = "add",
            ["Perform"] = function(p3, p4)
                return p3 + p4
            end
        },
        {
            ["Name"] = "subtract",
            ["Perform"] = function(p5, p6)
                return p5 - p6
            end
        },
        {
            ["Name"] = "multiply",
            ["Perform"] = function(p7, p8)
                return p7 * p8
            end
        },
        {
            ["Name"] = "divide",
            ["Perform"] = function(p9, p10)
                return p9 / p10
            end
        }
    }))
end