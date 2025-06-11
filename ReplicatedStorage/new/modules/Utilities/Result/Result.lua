--// ReplicatedStorage.new.modules.Utilities.Result (ModuleScript)

return {
    ["call"] = function(p1, ...)
        local v2, v3 = pcall(p1, ...)
        return v2 and {
            ["success"] = true,
            ["value"] = v3
        } or {
            ["success"] = false,
            ["message"] = v3
        }
    end
}