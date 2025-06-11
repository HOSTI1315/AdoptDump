--// ReplicatedStorage.SharedPackages._Index.upliftgames_utilities@1.2.0.utilities.TransactionUtil (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Promise)
return {
    ["tieTransactionToPromise"] = function(p_u_2, p3)
        p3:finally(function(p_u_4)
            return v_u_1.promisify(function()
                if p_u_4 == v_u_1.Status.Resolved then
                    p_u_2:complete()
                else
                    p_u_2:abort()
                end
            end)()
        end)
        return p3
    end
}