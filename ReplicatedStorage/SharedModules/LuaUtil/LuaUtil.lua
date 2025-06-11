--// ReplicatedStorage.SharedModules.LuaUtil (ModuleScript)

return {
    ["pcall_print_error"] = function(p1)
        local v2, v_u_3 = pcall(p1)
        if not v2 then
            spawn(function()
                error(v_u_3, 3)
            end)
        end
    end
}