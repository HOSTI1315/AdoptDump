--// ReplicatedStorage.CmdrClient.Types.JSON (ModuleScript)

local v_u_1 = game:GetService("HttpService")
return function(p2)
    p2:RegisterType("json", {
        ["Validate"] = function(p3)
            return pcall(v_u_1.JSONDecode, v_u_1, p3)
        end,
        ["Parse"] = function(p4)
            return v_u_1:JSONDecode(p4)
        end
    })
end