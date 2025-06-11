--// ReplicatedStorage.CmdrClient.Types.permissions (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
return function(p2)
    p2:RegisterHook("BeforeRun", function(p3)
        local v4, v5 = v_u_1("canUseAdminApi")(p3.Executor, p3.Group)
        if v4 then
            return nil
        else
            return v5
        end
    end)
end