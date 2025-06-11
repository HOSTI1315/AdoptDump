--// ReplicatedStorage.SharedModules.Finder (ModuleScript)

return {
    ["find"] = function(p1, ...)
        if p1 ~= nil then
            local v2 = p1
            for _, v3 in pairs({ ... }) do
                v2 = p1:FindFirstChild(v3)
                if v2 == nil then
                    break
                end
            end
            return v2
        end
    end
}