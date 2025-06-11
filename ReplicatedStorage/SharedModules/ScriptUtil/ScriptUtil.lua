--// ReplicatedStorage.SharedModules.ScriptUtil (ModuleScript)

return {
    ["create_continue"] = function(p1)
        local v2 = (p1 or {}).timeout or (1 / 0)
        local v_u_3 = Instance.new("BindableEvent")
        local v_u_4 = false
        local v_u_5 = nil
        if v2 < (1 / 0) then
            delay(v2, function()
                if v_u_3 then
                    v_u_4 = true
                    v_u_3:Fire()
                end
            end)
        end
        return {
            ["continue"] = function(...)
                if v_u_3 then
                    v_u_4 = true
                    v_u_5 = { ... }
                    v_u_3:Fire()
                end
            end,
            ["yield"] = function()
                if not v_u_4 then
                    v_u_3.Event:wait()
                end
                v_u_3:Destroy()
                local v6 = v_u_5 or {}
                return unpack(v6)
            end
        }
    end
}